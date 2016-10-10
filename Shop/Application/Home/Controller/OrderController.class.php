<?php
namespace Home\Controller;

/**
 * 订单
 * @author xiaoxu
 * @package Home\Controller
 */

class OrderController extends CommonController
{

    /**
     * 构造函数
     */
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * 订单列表
     * @access public
     * @since 1.0
     */
    public function index()
    {
        $order_list = M('Order')->where(array('is_delete' => 0, 'user_id' => $this->user_id))->field('id,order_sn,user_id,goods,order_amount,order_status')->order('add_time desc')->select();
        if ($order_list) {
            $order_status = C('ORDER_STATUS');
            foreach ($order_list as &$value) {
                $value['goods_info'] = json_decode($value['goods'], true);
                $value['order_status_name'] = $order_status[$value['order_status']];
                switch ($value['order_status']) {
                    case 100://未付款，待付款
                        $value['html'] = '<a><button data-id="' . $value['order_id'] . '" class="cancel_order_submit" >取消订单</button></a><a href="' . U('Pay/index') . '?order_sn=' . $value['order_sn'] . '"><button>立即支付</button></a>';
                        break;
                    case 200://已支付，待发货
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a>';
                        break;
                    case 210://订单已经处理，待收货
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a><a><button class="confirm_goods_submit" data-id="' . $value['order_sn'] . '" >确认收货</button></a>';
                        break;
                    case 222://确认收货，订单完成
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a>';
                        break;
                    case 101://订单未付款，已取消订单
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a>';
                        break;
                    case 300://订单已付款，申请退款
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a></a>';
                        break;
                    case 310://退款成功
                        $value['html'] = '<a href="http://wpa.qq.com/msgrd?v=3&uin=842419949&site=qq&menu=yes"><button>联系客服</button></a></a>';
                        break;
                    default:
                }
            }
            $this->assign('list', $order_list);
        }
        $this->display();
    }

    /**
     * 订单详情
     * @access public
     * @since 1.0
     */
    public function details()
    {
        $order_sn = trim(I('order_sn'));
        if (!preg_match_all('/^[1-9][0-9]{18}$/', $order_sn)) {
            die();
        }
        $order_status = C('ORDER_STATUS');
        $order_info = M('order')->where(array('order_sn' => $order_sn, 'user_id' => $this->user_id))->field('goods,user_address,consignee,mobile,order_status,order_sn')->find();
        $order_info['address_info'] = unserialize($order_info['address_info']);
        $order_info['order_status'] = $order_status[$order_info['order_status']];
        $order_info['goods_info'] = json_decode($order_info['goods'], true);
        $this->assign('info', $order_info);
        $this->display();
    }

    /**
     * 确认订单
     * @access public
     * @since 1.0
     */
    public function confirm()
    {
        /*收货地址*/
        $address_id = trim(I('address_id')); //订单ID
        if (preg_match_all('/^[1-9][0-9]*$/', $address_id)) {
            $address_info = M('user_address')->where(array('user_id' => $this->user_id, 'id' => $address_id, 'is_delete' => 0))->field('id,consignee,mobile,province,city,district,address')->find();
            if (!$address_info) {
                $address_info = M('user_address')->where(array('user_id' => $this->user_id, 'is_default' => 1, 'is_delete' => 0))->field('id,consignee,mobile,province,city,district,address')->find();
            }
        } else {
            $address_info = M('user_address')->where(array('user_id' => $this->user_id, 'is_default' => 1, 'is_delete' => 0))->field('id,consignee,mobile,province,city,district,address')->find();
        }
        if ($address_info) {
            $address_info['address'] = $address_info['province'] . $address_info['city'] . $address_info['district'] . $address_info['address'];
        } else {
            $address_info['id'] = 0;
        }
        $this->assign('address_info', $address_info);

        /*商品详情列表*/
        $goods_info = $this->getGoodsInfo();
        if (empty($goods_info[0]) === true) {
            redirect(U('Index/index'));
        }
        $goods_list = array();
        $i = 0;
        $total_money = 0;
        $total_num = 0;
        foreach ($goods_info as $key => $value) {
            $value['goods_info'] = M('goods')->where(array('id' => $value['goods_id'], 'is_on_sale' => 1))->field('goods_name,goods_img,goods_desc,goods_price')->find();
            if ($value['goods_info']) {
                $goods_list[$i] = $value['goods_info'];
                $goods_list[$i]['goods_num'] = $value['goods_num'];
                $total_money += $value['goods_info']['goods_price'] * $value['goods_num'];
                $total_num += $value['goods_num'];
                $i++;
            }
        }
        $total_money = number_format($total_money, 2);
        //echo json_encode($goods_info);
        $this->assign('total_money', $total_money);
        $this->assign('total_num', $total_num);
        $this->assign('goods_list', $goods_list);
        $this->display();
    }

    /**
     * 保存需要购买的产品信息
     * @access public
     * @since 1.0
     */
    public function toBuying()
    {
        $goods_id = I('goods_id');
        $goods_num = I('goods_num');
        $goods_info = array();//商品详情(商品ID，数量)
        if (preg_match_all('/^[1-9][0-9]*$/', $goods_id)) {
            $goods_info[0]['goods_id'] = $goods_id;
            $goods_info[0]['goods_num'] = preg_match_all('/^[1-9][0-9]*$/', $goods_num) ? $goods_num : 1;
        } else {
            $i = 0;
            foreach ($goods_id as $key => &$value) {
                $goods_info[$i]['goods_id'] = $value;
                $goods_info[$i]['goods_num'] = preg_match_all('/^[1-9][0-9]*$/', $goods_num[$i]) ? $goods_num[$i] : 1;
                $i++;
            }
        }
        $this->saveGoodsInfo($goods_info);
        $this->_returnData($goods_info);
    }


    /**
     * 添加订单
     * @access public
     * @since 1.0
     */
    public function addOrder()
    {
        if (IS_AJAX) {
            $address_id = trim(I('address_id')); //订单ID
            if (!preg_match_all('/^[1-9][0-9]*$/', $address_id)) {
                $this->_returnError(1, '网络不稳定，请重试');
            }

            $address_info = M('user_address')->where(array('user_id' => $this->user_id, 'id' => $address_id, 'is_delete' => 0))->field('id,consignee,mobile,province,city,district,address')->find();
            if (!$address_info) {
                $this->_returnError(10021, '地址不存在，请重新选择地址');
            }
            $goods_info = $this->getGoodsInfo();
            if (!$goods_info) {
                $this->_returnError(10022, '请选择需要购买的商品');
            }

            $goods_list = array();
            $i = 0;
            $total_money = 0;
            $data['once_fx_price'] = 0;//一级分销佣金
            $data['second_fx_price'] = 0;//二级分销佣金
            $data['third_fx_price'] = 0;//三级分销佣金
            foreach ($goods_info as $key => $value) {
                $value['goods_info'] = M('goods')->where(array('id' => $value['goods_id'], 'goods_status' => 1))->field('id,goods_name,goods_img,goods_brief,goods_price,once_distribution_price,second_distribution_price,third_distribution_price')->find();
                if ($value['goods_info']) {
                    $goods_list[$i] = $value['goods_info'];
                    $goods_list[$i]['goods_num'] = $value['goods_num'];
                    $total_money += $value['goods_info']['goods_price'] * $value['goods_num'];
                    $data['once_fx_price'] += $value['goods_num'] * $value['goods_info']['once_distribution_price'];
                    $data['second_fx_price'] += $value['goods_num'] * $value['goods_info']['second_distribution_price'];
                    $data['third_fx_price'] += $value['goods_num'] * $value['goods_info']['third_distribution_price'];
                    $i++;
                }
            }


            $data['consignee'] = $address_info['consignee'];//收货人
            $data['mobile'] = $address_info['mobile'];//收货人手机号
            $data['goods'] = json_encode($goods_list);//商品列表信息 json格式
            $data['add_time'] = $this->now;//下单时间
            $data['order_amount'] = $total_money;//应付款金额
            $data['pay_fee'] = $total_money;//支付费用
            $data['goods_amount'] = $total_money;//支付费用
            $data['pay_name'] = '微信支付';//支付方式名称
            $data['user_address_id'] = $address_info['id'];//收货地址编号
            $data['user_address'] = $address_info['province'] . $address_info['city'] . $address_info['district'] . $address_info['address'];//收货地址编号
            $data['order_status'] = 100;//订单状态
            $data['user_id'] = $this->user_id;//用户ID
            $data['order_sn'] = $this->getOrderSn();//订单编号
            $data['is_separate'] = 0;//分销结算状态 0，未分成或等待分成；1，已分成；2，取消分成；

            $order_id = M('order')->data($data)->add();
            if ($order_id) {
                /*删除购物车记录*/
                foreach ($goods_info as $value) {
                    M('cart')->where(array('goods_id' => $value['goods_id'], 'user_id' => $this->user_id))->delete();
                    M('goods')->where(array('id' => $value['goods_id']))->setInc('store_count', $value['goods_num']);
                }
                $this->delGoodsInfo();//删除产品信息

                $order_sn = $data['order_sn'];
                $order_info = M('order')->where(array('order_sn' => $order_sn, 'user_id' => $this->user_id))->field('id,pay_fee,order_sn,pay_status')->find(); //订单详情
                if (!$order_info) {
                    $this->_returnError(10024, '订单不存在');
                }
                if (in_array($order_info['pay_status'], array(1, 2))) {
                    $this->_returnError(10025, '订单已支付，请勿重复支付');
                }
                $jsApiParameters = $this->payInfo($order_info);
                $data2['order_sn'] = $order_sn;
                $data2['jsApiParameters'] = $jsApiParameters;
                $this->_returnData($data2, '下单成功');
            } else {
                $this->_returnError(1, '操作失败，请重试');
            }
        } else {
            die('MISS');
        }
    }

    /**
     * 检查订单支付状态
     * @access public
     * @since 1.0
     */
    public function checkPayStatus()
    {
        $order_sn = trim(I('order_sn')); //订单ID
        if (!preg_match_all('/^[1-9][0-9]*$/', $order_sn)) {
            $this->_returnError(1, '网络不稳定，请重试');
        }

        $order_info = M('order')->where(array('order_sn' => $order_sn, 'user_id' => $this->user_id))->field('id,pay_fee,order_sn,pay_status')->find();
        if (in_array($order_info['pay_status'], array(1, 2))) {
            $this->_returnError(10023, '订单已支付,请勿重复支付');
        } else if ($order_info['pay_status'] == 0) {
            if (!$order_info) {
                $this->_returnError(10024, '订单不存在');
            }
            $jsApiParameters = $this->payInfo($order_info);
            $data2['order_sn'] = $order_sn;
            $data2['jsApiParameters'] = $jsApiParameters;
            $this->_returnData($data2, '未支付');
        } else {
            $this->_returnError(1, '网络不稳定，请重试');
        }
    }

    /**
     * 确认收货
     * @access public
     * @since 1.0
     */
    public function confirmGoods()
    {
        $order_sn = trim(I('order_sn')); //订单ID
        if (!preg_match_all('/^[1-9][0-9]*$/', $order_sn)) {
            $this->_returnError(1, '网络不稳定，请重试');
        }
        $order_info = M('order')->where(array('order_sn' => $order_sn))->field('id,order_status')->find();
        if ($order_info && $order_info['order_status'] == 210) {
            M('order')->where(array('order_id' => $order_info['order_id']))->setField(array('confirm_time' => $this->now, 'order_status' => 222));
        }
        $order_status = C('ORDER_STATUS');
        $this->_returnData(array('order_status' => $order_status[222]), '修改成功');
    }

    /**
     * 取消订单
     * @access public
     * @since 1.0
     */
    public function cancelOrder()
    {
        $order_id = trim(I('order_id'));//订单ID
        $order_info = M('order')->where(array('user_id' => $this->user_id, 'order_id' => $order_id))->field('id,order_status,pay_status')->find();
        if ($order_info && $order_info['order_status'] == 100 && $order_info['pay_status'] == 0) {
            M('order')->where(array('id' => $order_info['id']))->setField(array('cancel_time' => $this->now, 'order_status' => 101));
            $order_status = C('ORDER_STATUS');
            $this->_returnData(array('order_status' => $order_status[101]));
        } else {
            $this->_returnError(1, '订单不存在');
        }
    }

}//end
