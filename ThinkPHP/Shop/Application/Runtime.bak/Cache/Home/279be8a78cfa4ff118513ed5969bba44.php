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
        <div class="back" ></div>
    </a>
    我的会员
</header>

<section class="wealth">
    <article class="tixian_list" style="margin-top: 0px; border-top:0px;">
        <ul class="tixian_tab_title">
            <li>订单编号</li>
            <li>下级名称</li>
            <li>提成金额</li>
        </ul>

        <div class="list_box">
            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><ul class="list">
                    <li><?php echo ($vo["order_sn"]); ?></li>
                    <li><?php echo ($vo["nickname"]); ?></li>
                    <li>￥<?php echo ($vo["money"]); ?></li>
                </ul><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </article>

    <button onclick="location.href='<?php echo U('User/withdraw');?>'"  class="tixian">我要提现</button>
</section>


<div class="clear" style="height:6rem;"></div>


</body>

</html>