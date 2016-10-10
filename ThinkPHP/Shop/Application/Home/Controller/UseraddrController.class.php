<?php
/**
 * 用户地址类
 * @author         xiaoxu<997998478@qq.com>
 * @since          1.0
 */
namespace Home\Controller;
class UseraddrController extends CommonController
{
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * 用户地址列表
     * @access public
     * @since 1.0
     */
    public function index()
    {
        $address_list = M('user_address')->where(array('user_id' => $this->user_id, 'is_delete' => 0))->field('id,consignee,country,province,city,district,address,mobile,is_default')->order('is_default desc, id desc')->select();
        if ($address_list) {
            foreach ($address_list as &$value) {
                $value['address'] = $value['province'] . $value['city'] . $value['district'] . $value['address'];
            }
        }
        //echo json_encode($address_list);
        $this->assign('address_list', $address_list);
        $type = trim(I('type'));
        $this->assign('type', $type);
        $this->display();
    }

    /**
     * 添加收货地址
     * @access public
     * @since 1.0
     */
    public function add()
    {
        if (IS_AJAX) {
            $type = trim(I('type')); //类型 当type等于order时说明需要跳转到确定订单页面
            $data['consignee'] = trim(I('consignee'));//收货人
            $data['mobile'] = trim(I('mobile'));//手机号码
            $data['province'] = trim(I('province'));//省
            $data['city'] = trim(I('city'));//市
            $data['district'] = trim(I('district'));//区
            $data['address'] = trim(I('address'));//详细地址

            $data['user_id'] = $this->user_id;//用户ID
            $is_default = M('user_address')->where(array('user_id' => $this->user_id, 'is_delete' => 0))->field('user_id')->find();
            $data['is_default'] = $is_default ? 0 : 1;//默认地址 0-不是 1-是
            $address_id = M('user_address')->add($data);
            if ($address_id) {
                $data2['address_id'] = $address_id;
                $data2['type'] = $type == 'order' ? 'order' : '';
                $this->_returnData($data2, '添加成功');
            } else {
                $this->_returnError(1, '网络不稳定，请重试');
            }
        } else {
            $type = trim(I('type'));
            $this->assign('type', $type);
            $this->display();
        }
    }

    /**
     * 修改收货地址
     * @access public
     * @since 1.0
     */
    public function edit()
    {
        if (IS_AJAX) {
            $type = trim(I('type')); //类型 当type等于order时说明需要跳转到确定订单页面
            $data['consignee'] = trim(I('consignee'));//收货人
            $data['mobile'] = trim(I('mobile'));//手机号码
            $data['province'] = trim(I('province'));//省
            $data['city'] = trim(I('city'));//市
            $data['district'] = trim(I('district'));//区
            $data['address'] = trim(I('address'));//详细地址
            $address_id = trim(I('address_id'));//收货地址ID

            $res = M('user_address')->where(array('id' => $address_id, 'user_id' => $this->user_id))->save($data);
            if ($res === false) {
                $this->_returnError(1, '网络不稳定，请重试');
            } else {
                $data2['type'] = $type == 'order' ? 'order' : '';
                $this->_returnData($data2, '修改成功');
            }
        } else {
            $address_id = trim(I('address_id'));
            $address_info = M('user_address')->where(array('id' => $address_id, 'user_id' => $this->user_id, 'is_delete' => 0))->find();
            $this->assign('info', $address_info);
            $this->display('add');
        }
    }

    /**
     * 删除收货地址
     * @access public
     * @since 1.0
     */
    public function delUserAddress()
    {
        if (IS_AJAX) {
            $address_id = trim(I('address_id')); //商品ID
            if (!preg_match_all('/^[1-9][0-9]*$/', $address_id)) {
                $this->_returnError(1, '网络不稳定，请重试');
            }
            M('user_address')->where(array('id' => $address_id, 'user_id' => $this->user_id))->setField('is_delete', 1);
            $this->_returnData($address_id);
        }
    }

    /**
     * 设置默认收货地址
     * @access public
     * @since 1.0
     */
    public function setDefaultAddress()
    {
        if (IS_AJAX) {
            $address_id = trim(I('address_id')); //商品ID
            if (!preg_match_all('/^[1-9][0-9]*$/', $address_id)) {
                $this->_returnError(1, '网络不稳定，请重试');
            }
            M('user_address')->where(array('user_id' => $this->user_id, 'is_default' => 1))->setField('is_default', 0);
            M('user_address')->where(array('id' => $address_id, 'user_id' => $this->user_id))->setField('is_default', 1);
            $this->_returnData($address_id);
        }
    }
}