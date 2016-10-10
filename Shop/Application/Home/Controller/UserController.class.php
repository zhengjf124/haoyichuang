<?php
namespace Home\Controller;
require_once 'lib/WeChatQrcode.class.php';
require_once 'lib/wxShare.class.php';

/**
 * 会员接口
 * @author  xiaoxu<997998478@qq.com>
 * @package Home\Controller
 */
class UserController extends CommonController
{

    public function __construct()
    {
        parent::__construct();
    }


    /**
     * 个人中心
     * @access public
     * @since 1.0
     */
    public function index()
    {
        $commission_log = M('commission_log')->where(array('gainer_id' => $this->user_id))->field('order_money,money')->select();
        $sales = 0;//销售额
        $reward = 0;//我的奖励
        foreach ($commission_log as $value) {
            $sales += $value['order_money'];
            $reward += $value['money'];
        }
        $this->assign('sales', $sales > 0 ? number_format($sales, 2) : '0.00');
        $this->assign('reward', $reward > 0 ? number_format($reward, 2) : '0.00');
        //$once_son_num = M('user')->where(array('parent_id' => $this->user_id))->count();
        //$once_son_num = $once_son_num > 0 ? $once_son_num : 0;
        //$this->assign('once_son_num', $once_son_num);//一级代言人数量
        $parent_id = $this->user_info['parent_id'];
        if($parent_id == 0){
            $info = '你还没有推荐人';
        }else if(preg_match('/^[1-9][0-9]$/', $parent_id)) {
            $parent_nick_name = M('user')->where(array('id' => $parent_id))->getField('nick_name');
            $info = '您是由[' . $parent_nick_name . ']推荐';
        }
        $user_levels = C('USER_LEVEL');
        $this->assign('user_level', $user_levels[$this->user_info['user_level']]);
        $this->assign('user_info', $this->user_info);
        $this->assign('info', $info);
        $this->display();
    }

    /**
     * 我是代言人
     * @access public
     * @since 1.0
     */
    public function spokesman()
    {
        $nickname = trim(I('nickname'));//昵称
        if (empty($nickname) === false) {
            $where['nick_name'] = array('like', '%' . $nickname . '%');
        }
        $where['parent_id'] = $this->user_id;
        $type = trim(I('type'));
        $once_user_list = M('user')->where($where)->field('id,nick_name,user_name')->select();

        $second_user_list = array();
        foreach ($once_user_list as $value) {
            unset($list);
            $list = M('user')->where(array('parent_id' => $value['id'], 'nick_name' => array('like', '%' . $nickname . '%')))->field('id,nick_name,user_name')->select();
            if ($list) {
                foreach ($list as $val) {
                    $second_user_list[] = $val;
                }
                unset($val);
                unset($list);
            }
        }
        unset($value);

        if ($type == 'second') { //二级代言人
            if ($once_user_list) {
                $this->assign('user_list', $second_user_list);
            }
        } else if ($type == 'third') {
            if ($second_user_list) {
                $third_user_list = array();
                foreach ($second_user_list as $value) {
                    unset($list);
                    $list = M('user')->where(array('parent_id' => $value['id'], 'nick_name' => array('like', '%' . $nickname . '%')))->field('id,nick_name,user_name')->select();
                    if ($list) {
                        foreach ($list as $val) {
                        	if(empty($val['nick_name'])){
                        		$val['nick_name'] = '暂无';
                        	}
                            $third_user_list[] = $val;
                        }
                        unset($val);
                        unset($list);
                    }
                }
                $this->assign('user_list', $third_user_list);
            }
        } else { //一级代言人
            $this->assign('user_list', $once_user_list);
        }
        $this->assign('user_info', $this->user_info);
        $user_levels = C('USER_LEVEL');
        $this->assign('user_level', $user_levels[$this->user_info['user_level']]);        
        $this->display();
    }

    /**
     * 代言人推广
     * @access public
     * @since 1.0
     */
    public function extension()
    {
        $list = M('commission_log')->where(array('gainer_id' => $this->user_id))->field('gainer_id,order_id,money,user_id')->order('add_time desc')->select();
        if ($list) {
            foreach ($list as &$value) {
                $value['nickname'] = M('user')->where(array('id' => $value['user_id']))->getField('nick_name');
                $value['order_sn'] = M('order')->where(array('id' => $value['order_id']))->getField('order_sn');
                $value['order_sn'] = '***' . substr($value['order_sn'], -5);
            }
            $this->assign('list', $list);
        }
        $this->display();
    }

    /**
     * 我的财富
     * @access public
     * @since 1.0
     */
    public function wealth()
    {
        $account_balance = $this->user_info['account_balance'];//账户余额
        $this->assign('account_balance', $account_balance);
       $money_type = array('income' => '收入', 'expend' => '支出', 'other' => '其他');
        $list = M('financial_log')->where(array('user_id' => $this->user_id))->field('money_type,add_time,money')->order('add_time desc')->select();
        if ($list) {
            foreach ($list as &$value) {
                $value['money_type'] = $money_type[$value['money_type']];
                $value['add_time'] = date('Y-m-d', $value['add_time']);
            }
        }
        /*已体现的财富*/
        $withdraw = M('withdrawal_log')->where(array('withdrawal_status' => array('in', array(10, 20)), 'user_id' => $this->user_id))->sum('money');
        $this->assign('withdraw', $withdraw > 0 ? $withdraw : '0.00');
        $this->assign('list', $list);
        $this->display();
    }

    /**
     * 提现申请
     * @access public
     * @since 1.0
     */
    public function withdraw()
    {
        if (IS_AJAX) {
            $money = intval(I('money'));
            $pay_type = trim(I('pay_type'));
            $pay_accounts = trim(I('pay_accounts'));
            $account_balance = $this->user_info['account_balance'];//账户余额
            if (!$account_balance) {
                $this->_returnError(1, '网络不稳定，请重试');
            }
            if (empty($pay_type) === true) {
                $this->_returnError(1, '支付方式不能为空');
            }
            if (empty($pay_accounts) === true) {
                $this->_returnError(1, '支付帐号不能为空');
            }
            settype($money, 'double');
            settype($account_balance, 'double');
            settype($account_balance, 'double');
            if ($money > $account_balance) {
                $this->_returnError(10054, '对不起，您的余额不足');
            }
            $new_payment_money = $account_balance - $money;
            settype($new_payment_money, 'double');
            if ($new_payment_money < 0) {
                $this->_returnError(10054, '对不起，您的余额不足');
            }
            /*添加提现申请*/
            $data['user_id'] = $this->user_id;//提现用户ID
            $data['withdrawal_status'] = 10;//提现状态 10-审核中 20-已到帐 30-提现失败
            $data['money'] = $money;//提现金额
            $data['procedure_fee'] = 0;//提现手续费
            $data['reality_money'] = $money - $data['procedure_fee'];//实际到账金额
            $data['pay_type'] = $pay_type;//支付方式
            $data['pay_accounts'] = $pay_accounts;//支付帐号
            $data['add_time'] = $this->now;//添加时间
            $result = M('withdrawal_log')->add($data);
            if ($result) {
                /*添加财务日志*/
                $data3['money_type'] = 'expend'; //支出
                $data3['money'] = $money; //金额
                $data3['pay_type'] = 0; //支付方式 余额支付
                $data3['reason'] = 30; //提现
                $data3['user_id'] = $this->user_id;
                $this->financialLog($data3);
                /*修改账户余额*/
                M('user')->where(array('user_id' => $this->user_id))->setField('account_balance', $new_payment_money);
                $this->_returnData('', '提交成功');
            } else {
                $this->_returnError(1, '网络不稳定，请重试');
            }
        } else {
            $withdrawal_status = C('WITHDRAWAL_STATUS');//提现状态
            $list = M('withdrawal_log')->where(array('user_id' => $this->user_id))->field('reality_money,add_time,withdrawal_status')->order('add_time desc')->select();
            if ($list) {
                foreach ($list as &$value) {
                    $value['withdrawal_status'] = $withdrawal_status[$value['withdrawal_status']];
                    $value['sn'] = date('mdHis', $value['add_time']);
                }
                //echo json_encode($list);exit;
                $this->assign('list', $list);
            }
            $this->display();
        }
    }

    /**
     * 推广二维码
     * @access public
     * @since 1.0
     */
    public function qrcode()
    {
        $w = new WeChatQrcode();
        if (empty($this->user_info['wechat_qrcode']) === true || !file_exists(trim($this->user_info['wechat_qrcode'], '/'))) {
            $wechat_qrcode = $w->getWChatQrcode($this->getUserNumber($this->user_id, 0));
            M('user')->where(array('id' => $this->user_id))->setField('wechat_qrcode', $wechat_qrcode);        
        } else {
            $wechat_qrcode = $this->user_info['wechat_qrcode'];
        }
        $this->assign('wechat_qrcode', $wechat_qrcode);

        /**/
        $s = new \wxShare();
        $theme = '好易创';
        $desc = '好易创描述描述';
        $img = DOMAIN_NAME . $wechat_qrcode;
        $url = DOMAIN_NAME . $wechat_qrcode;
        $data = $s->index($theme, $desc, $img, $url);
        $this->assign('shareinfo', $data['shareinfo']);
        $this->assign('config', $data['config']);
        $this->display();
    }

}//end
