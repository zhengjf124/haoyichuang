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
    <a onclick="history.go(-1)">
        <div class="back"></div>
    </a>
    赖小姐卫生巾
</header>

<section class="order">
    <?php if($address_info['id'] > 0): ?><div onclick="location.href='<?php echo U('Useraddr/index',array('type'=>'order'));?>'" class="address">
            <h1>收货人：<?php echo ($address_info["consignee"]); ?>&nbsp;&nbsp;&nbsp;<?php echo ($address_info["mobile"]); ?></h1>
            <p><img src="/Public/home/images/ico_address.png"><?php echo ($address_info["address"]); ?></p>
        </div>
        <?php else: ?>
        <div class="address" onclick="location.href='<?php echo U('Useraddr/index',array('type'=>'order'));?>'"
             style="height: auto; padding: 15px; box-sizing:border-box; font-size: 16px;">
            <div>请选择收货地址</div>
        </div><?php endif; ?>
    <input type="hidden" id="address_id" value="<?php echo ($address_info['id']); ?>">
    <!--
        作者：181331251@qq.com
        时间：2016-08-28
        描述：列表开始
    -->
    <ul class="item_ul">
        <?php if(is_array($goods_list)): $i = 0; $__LIST__ = $goods_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                <div class="left_img">
                    <img src="<?php echo ($vo["goods_img"]); ?>">
                </div>
                <div class="right_tex">
                    <h1><?php echo ($vo["goods_name"]); ?></h1>
                    <!--<p><?php echo ($vo["goods_desc"]); ?></p>-->
                    <div class="price"><span>￥</span><?php echo ($vo["goods_price"]); ?><code>x<?php echo ($vo["goods_num"]); ?></code></div>
                </div>
                <div class="clear"></div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        <li>
            <div class="tatal">
                共<?php echo ($total_num); ?>件商品 合计： <span class="price"><span>￥</span><?php echo ($total_money); ?></span>
            </div>
            <input type="hidden" id="order_sn" value="0">
        </li>
    </ul>
    <button id="add_order_submit" class="tixian">提交订单</button>
</section>

<div class="clear" style="height:6rem;"></div>

</body>
<script src="/Public/home/js/myAjax.js"></script>
<script type="text/javascript">



</script>
</html>