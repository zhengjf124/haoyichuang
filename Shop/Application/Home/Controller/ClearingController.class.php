<?php
namespace Home\Controller;

use Think\Controller;

class ClearingController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function buyClearing()
    {
        $order_sn = trim(I('order_sn'));
        $pay_money = trim(I('pay_money'));
        if (preg_match_all('/^[1-9][0-9]{18}$/', $order_sn)) {
            $order_info = M('order')->where(array('order_sn' => $order_sn))->field('user_id,id,pay_status')->find();
            if (!$order_info) {
                $this->_returnError(10052, '对不起，该订单不存在，请重试');
            }
            if ($order_info['pay_status'] == 2) {
                $this->_returnError(10053, '该订单已支付，请勿重复支付');
            }

            $res = M('order')->where(array('id' => $order_info['id']))->setField(array('order_status' => 200, 'pay_id' => 10, 'money_paid' => $pay_money, 'pay_status' => 2,'pay_time' => time(),'pay_name' => '微信支付'));
            if ($res) {
                /*添加财务日志*/
                $data3['money_type'] = 'expend'; //支出
                $data3['money'] = $pay_money; //金额
                $data3['pay_type'] = 10; //支付方式 微信支付
                $data3['reason'] = 10; //购买商品付款
                $data3['user_id'] = $order_info['user_id'];
                $this->financialLog($data3);

                $this->clearingFxPrice($order_info['id']);//结算分销佣金
            }

            $this->_returnData();
        }
    }

    /**
     * 结算分销佣金
     * @access private
     * @param array $order_id 订单id
     * @since 1.0
     * @return array
     */
    private function clearingFxPrice($order_id)
    {
        $order_info = M('order')->where(array('id' => $order_id))->field('id,order_amount,once_fx_price,second_fx_price,third_fx_price,is_separate,user_id')->find();
        if ($order_info && $order_info['is_separate'] == 0) {
            $user_ids = $this->getFxUserId($order_info['user_id']);//获取三级分销的用户ID

            /*一级代言人佣金结算*/
            if ($user_ids['once_user_id'] > 0) {

                $data['add_time'] = time();
                $data['gainer_id'] = $user_ids['once_user_id'];
                $data['order_id'] = $order_info['id'];
                $data['order_money'] = $order_info['order_amount'];
                $data['money'] = $order_info['once_fx_price'];
                $data['user_id'] = $order_info['user_id'];
                M('commission_log')->add($data);
                unset($data);

                /*添加财务日志*/
                $data4['money_type'] = 'income'; //收入
                $data4['money'] = $order_info['once_fx_price']; //金额
                $data4['pay_type'] = 0; //支付方式
                $data4['reason'] = 20; //获得分销佣金
                $data4['user_id'] = $user_ids['once_user_id'];
                $this->financialLog($data4);

                /*将佣金添加到用户的余额中*/
                M('user')->where(array('id' => $user_ids['once_user_id']))->setInc('account_balance', $order_info['once_fx_price']);
            }

            /*二级代言人佣金结算*/
            if ($user_ids['second_user_id'] > 0) {

                $data['add_time'] = time();
                $data['gainer_id'] = $user_ids['second_user_id'];
                $data['order_id'] = $order_info['id'];
                $data['order_money'] = $order_info['order_amount'];
                $data['money'] = $order_info['second_fx_price'];
                $data['user_id'] = $order_info['user_id'];
                M('commission_log')->add($data);
                unset($data);

                /*添加财务日志*/
                $data5['money_type'] = 'income'; //收入
                $data5['money'] = $order_info['second_fx_price']; //金额
                $data5['pay_type'] = 0; //支付方式
                $data5['reason'] = 20; //获得分销佣金
                $data5['user_id'] = $user_ids['second_user_id'];
                $this->financialLog($data5);

                /*将佣金添加到用户的余额中*/
                M('user')->where(array('id' => $user_ids['second_user_id']))->setInc('account_balance', $order_info['second_fx_price']);
            }

            /*三级代言人佣金结算*/
            if ($user_ids['third_user_id'] > 0) {

                $data['add_time'] = time();
                $data['gainer_id'] = $user_ids['third_user_id'];
                $data['order_id'] = $order_info['id'];
                $data['order_money'] = $order_info['order_amount'];
                $data['money'] = $order_info['third_fx_price'];
                $data['user_id'] = $order_info['user_id'];
                M('commission_log')->add($data);
                unset($data);

                /*添加财务日志*/
                $data6['money_type'] = 'income'; //收入
                $data6['money'] = $order_info['third_fx_price']; //金额
                $data6['pay_type'] = 0; //支付方式
                $data6['reason'] = 20; //获得分销佣金
                $data6['user_id'] = $user_ids['third_user_id'];
                $this->financialLog($data6);

                /*将佣金添加到用户的余额中*/
                M('user')->where(array('id' => $user_ids['third_user_id']))->setInc('account_balance', $order_info['third_fx_price']);
            }
            
            M('order')->where(array('id' => $order_info['id']))->setField(array('is_separate' => 1));
            
        }
    }

    /**
     * 获取三级分销的用户ID
     * @access private
     * @param array $user_id 用户id
     * @since 1.0
     * @return array
     */
    private function getFxUserId($user_id)
    {
        $data['once_user_id'] = M('user')->where(array('id' => $user_id))->getField('parent_id');
        if (preg_match('/^[1-9][0-9]*$/', $data['once_user_id'])) {
            $data['second_user_id'] = M('user')->where(array('id' => $data['once_user_id']))->getField('parent_id');
            if (preg_match('/^[1-9][0-9]*$/', $data['second_user_id'])) {
                $data['third_user_id'] = M('user')->where(array('id' => $data['second_user_id']))->getField('parent_id');
                $data['third_user_id'] = preg_match('/^[1-9][0-9]*$/', $data['once_user_id']) ? $data['third_user_id'] : 0;
            } else {
                $data['second_user_id'] = 0;
                $data['third_user_id'] = 0;
            }
        } else {
            $data['second_user_id'] = 0;
            $data['second_user_id'] = 0;
            $data['third_user_id'] = 0;
        }
        return $data;
    }

    /**
     * 保存财务日志
     * @access protected
     * @param array $data 需要保存的数据
     * @since 1.0
     * @return bool
     */
    protected function financialLog($data)
    {
        $data['add_time'] = time();
        $result = M('financial_log')->add($data);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 返回错误信息（JSON）
     * @access protected
     * @param string $code 返回的错误码
     * @param string $message 需要返回提示信息
     * @since 1.0
     * @return string
     */
    protected function _returnError($code, $message)
    {
        $this->ajaxReturn([
            'code' => $code,
            'reason' => $message
        ]);
    }

    /**
     * 返回数据（JSON）
     * @access protected
     * @param array $data 需要返回的数据
     * @param string $message 需要返回提示信息
     * @since 1.0
     * @return string
     */
    protected function _returnData($data = array(), $message = '操作成功')
    {
        $this->ajaxReturn(array(
            'code' => 0,
            'reason' => $message,
            'data' => $data
        ));
    }
}
