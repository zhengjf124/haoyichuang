<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <link href="/Public/home/css/cloud.min.css" rel="stylesheet">
    <script type="text/javascript" src="/Public/home/js/html-font-size.js" ></script>
    <script type="text/javascript" src="/Public/home/js/jquery-1.10.1.min.js" ></script>
    <script type="text/javascript" src="/Public/home/js/cloud.min.js"></script>
    <link href="/Public/home/css/style.css" rel="stylesheet" type="text/css">
    <title>好易创</title>
</head>
<body>
<!--
    作者：181331251@qq.com
    时间：2016-08-27
    描述：头部
-->
<header>
    <a href="<?php echo U('User/index');?>">
        <div class="back"></div>
    </a>
    我的订单
</header>

<section class="order">
    <!--
        作者：181331251@qq.com
        时间：2016-08-28
        描述：列表开始
    -->
    <ul class="item_ul">
        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                <a href="<?php echo U('Order/details',array('order_sn'=>$vo['order_sn']));?>">
                <div class="order_code">
                    订单编号：<?php echo ($vo["order_sn"]); ?>
                    <time style="color: red;"><?php echo ($vo["order_status_name"]); ?></time>
                </div>
                <?php if(is_array($vo["goods_info"])): $i = 0; $__LIST__ = $vo["goods_info"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$go): $mod = ($i % 2 );++$i;?><div class="left_img">
                        <img src="<?php echo ($go["goods_img"]); ?>">
                    </div>
                    <div class="right_tex">
                        <h1><?php echo ($go["goods_name"]); ?></h1>
                        <p><?php echo ($go["goods_brief"]); ?></p>
                        <div class="price"><span>￥</span><?php echo ($go["goods_price"]); ?><code>x<?php echo ($go["goods_num"]); ?></code></div>
                    </div>
                    <div class="clear"></div><?php endforeach; endif; else: echo "" ;endif; ?>
                </a>
                <div class="tatal">
                    <span style="float: left;font-size: 16px;">订单总额：<span
                            style="color: red;font-size: 18px;">￥<?php echo ($vo["order_amount"]); ?></span></span>
                    <?php echo ($vo["html"]); ?>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</section>

<div class="clear" style="height:6rem;"></div>


</body>
<script src="/Public/home/js/myAjax.js"></script>
</html>