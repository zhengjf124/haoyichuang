<?php
namespace Home\Controller;

/**
 * 购物车
 * @author xiaoxu
 * @package Home\Controller
 */
class CartController extends CommonController
{

    /**
     *构造函数
     *
     */
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * 购物车列表
     * @access public
     * @since 1.0
     */
    public function index()
    {
        $cart_info = M('cart')->where(array('user_id' => $this->user_id))->field('goods_id,goods_num')->select();
        if ($cart_info) {
            $cart_list = array();
            $i = 0;
            foreach ($cart_info as $value) {
                $value['goods_info'] = M('goods')->where(array('id' => $value['goods_id']))->field('id,goods_name,goods_img,goods_price')->find();
                if ($value['goods_info']) {
                    $cart_list[$i] = $value['goods_info'];
                    $cart_list[$i]['goods_num'] = $value['goods_num'];
                    $i++;
                }
            }
        }
        //echo json_encode($cart_list);
        $this->assign('cart_list', $cart_list);
        $this->display();
    }

    /**
     * 删除购物车商品
     * @access public
     * @since 1.0
     */
    public function delGoods()
    {
        $goods_id = I('goods_id');
        M('cart')->where(array('goods_id' => array('in', $goods_id), 'user_id' => $this->user_id))->delete();
        $this->_returnData($goods_id);
    }

    /**
     * 添加商品到购物车
     * @access public
     * @since 1.0
     */
    public function add()
    {
        $goods_id = trim(I('goods_id')); //商品ID
        if (!preg_match_all('/^[1-9][0-9]*$/', $goods_id)) {
            $this->_returnError(1, '网络不稳定，请重试');
        }
        $goods_info = M('goods')->where(array('is_on_sale' => 1, 'is_delete' => 0, 'id' => $goods_id))->field('id,goods_sn,goods_name,market_price,goods_price')->find();
        if (!$goods_info) {
            $this->_returnError(10001, '商品已下架');
        }
        $cart_info = M('cart')->where(array('goods_id' => $goods_id, 'user_id' => $this->user_id))->field('id,goods_num')->find();
        if ($cart_info) {
            $res = M('cart')->where(array('id' => $cart_info['id']))->setInc('goods_num');
        } else {
            $data['user_id'] = $this->user_id;
            $data['goods_id'] = $goods_info['id'];
            $data['goods_sn'] = $goods_info['goods_sn'];
            $data['goods_name'] = $goods_info['goods_name'];
            $data['market_price'] = $goods_info['market_price'];
            $data['goods_price'] = $goods_info['goods_price'];
            $data['goods_num'] = 1;
            $res = M('cart')->data($data)->add();
        }
        if ($res === false) {
            $this->_returnError(1, '网络不稳定，请重试');
        } else {
            $this->_returnData('', '添加成功');
        }
    }


}//end