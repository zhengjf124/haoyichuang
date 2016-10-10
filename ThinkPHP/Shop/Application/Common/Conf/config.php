<?php
return array(
    /* 加载公共函数 */
    'LOAD_EXT_FILE' =>'common',
	//'配置项'=>'配置值'
	'DB_TYPE' => 'mysql',
    'DB_HOST' => '211.149.163.216',
    'DB_PORT' => '3306',
    'DB_NAME' => 'txdemo',
    'DB_USER' => 'root',
    'DB_PWD' => 'da2m27f8',
    'DB_PREFIX' => 'gwshop_',

    'DEFAULT_MODULE'       =>    'Home',//默认模块
    'MODULE_ALLOW_LIST'    =>    array('Home','Admin'),//允许访问的模块

    'site_url' => SITE_URL,//网站域名
    'ORDER_STATUS' => array(
        100 => '待付款',
        200 => '待发货',
        101 => '已取消',
        210 => '待收货',
        220 => '待评价',
        222 => '交易结束',
        300 => '退款中',
        310 => '退款成功',
    ),
    'SHIPPING_STATUS' => array(
        0 => '未发货',
        1 => '已发货',
        2 => '部分发货'
    ),
    'PAY_STATUS' => array(
        0 => '未支付',
        2 => '已支付'
    ),
    'COUPON_TYPE' => array(
        0 => '面额模板',
        1 => '按用户发放',
        2 => '注册发放',
        3 => '邀请发放',
        4 => '线下发放'
    ),
    'FINANCIAL_REASON' => array(  //消费原因 对应financial_log表中 reason 字段
	    10 => '购买商品付款',
	    20 => '获得分销佣金',
	    30 => '提现',
	    40 => '退款',
    ),
    'USER_LEVEL' =>  array( //会员等级
    	0 => '普通会员',
    	10 => '一级会员',
    	20 => '二级会员',
    	30 => '三级会员',
    ),    
    'WITHDRAWAL_STATUS' => array(   //提现状态
        10 => '审核中',
        20 => '提现成功',
        30 => '提现失败',
    ),


);