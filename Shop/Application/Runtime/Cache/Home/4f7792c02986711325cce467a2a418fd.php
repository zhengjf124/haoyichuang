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
		<a ><div class="back"></div></a>
		赖小姐卫生巾
	</header>
	
	
	<section class="success">
		<img src="/Public/home/images/success_ico.png">
		<h1>购买成功！</h1>
		<button onclick="location.href='<?php echo U('Order/index');?>'" >查看详情>></button>
	</section>
	
	<div class="clear" style="height:6rem;"></div>

    <!--底部-->
    <div class="footer">
        <a href="<?php echo U('Index/index');?>"><img src="/Public/home/images/new_home.png" class="img1"><img src="/Public/home/images/new_home_active.png" class="img2">
            <h3>商城</h3></a>
        <a href="<?php echo U('Goods/categoryList');?>"><img src="/Public/home/images/new_cate.png" class="img1"><img src="/Public/home/images/new_cate_active.png" class="img2">
            <h3>分类</h3></a>
        <a href="<?php echo U('Cart/index');?>"><img src="/Public/home/images/new_cart.png" class="img1"><img src="/Public/home/images/new_cart_active.png" class="img2">
            <h3>购物车</h3></a>
        <a href="<?php echo U('User/index');?>"><img src="/Public/home/images/new_user.png" class="img1"><img src="/Public/home/images/new_user_active.png" class="img2">
            <h3>个人中心</h3></a>
    </div>
    <!--底部:over-->
</body>
<script>
	$(function(){
		$('.menu li').click(function(){
			$('.menu li').siblings().removeClass('active');
			$('.menu li').siblings().find('.ico').removeClass('active');
			$(this).addClass('active');
			$(this).find('.ico').addClass('active')
		});
		
	})
	
</script>
</html>