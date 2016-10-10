<?php
namespace Home\Controller;

/**
 * 微信支付接口
 * @author wubuze
 * @package Home\Controller
 */
class PayController extends CommonController
{ // 接口必须继承这个控制器

    /**
     * 构造函数
     */
    public function __construct()
    {
        parent::__construct();


    }


    /**
     * 确认支付
     * @access public
     * @since 1.0
     */
    public function index()
    {
        $order_sn = trim(I('order_sn'));//订单号
        if (preg_match_all('/^[1-9][0-9]{18}$/', $order_sn)) {
            $order_info = M('order')->where(array('order_sn' => $order_sn, 'user_id' => $this->user_id))->field('id,pay_fee,order_sn,pay_status')->find(); //订单详情
            if (!$order_info) {
                $this->_returnError(10024, '订单不存在');
            }
            if (in_array($order_info['pay_status'], array(1, 2))) {
                $this->_returnError(10025, '订单已支付，请勿重复支付');
            }

            $jsApiParameters = $this->payInfo($order_info);

            $this->assign('jsApiParameters', $jsApiParameters);
            $this->display();
        } else {
            die("<script>alert('订单不存在!');location.href='" . U('Index/index') . "'</script>");
        }
    }

    public function success(){

        $this->display();
    }

}//end