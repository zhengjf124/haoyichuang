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
	<header class="bg_none">
		<a href="<?php echo U('Index/index');?>"><div class="back" ></div></a>
		个人中心
	</header>
	
	<section class="spokesman">		
		<div class="header_ico bg_none" style="height: 6rem;">
			<img src="<?php echo ($user_info["headimgurl"]); ?>">
			<div class="text">
				<h1><?php echo ($user_info["nick_name"]); ?></h1>
				<code><!-- <?php echo ($user_level); ?> --><?php echo ($info); ?></code>
			</div>
		</div>	
	</section>
	
	<div class="center_bg"></div>
	<section class="center">
		<ul class="my_price_ul">
			<div class="line"></div>
			<li>
				<div class="cont">
					<h1>销售额  </h1>
					<p><?php echo ($sales); ?><code>元</code></p>
				</div>				
			</li>	
			<li>
				<div class="cont">
					<h1>我的奖励  </h1>
					<p><?php echo ($reward); ?><code>元</code></p>
				</div>				
			</li>	
		</ul>

		<ul class="list_ul">			
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_address.png"></div>
				<a href="<?php echo U('Useraddr/index');?>">收货地址管理</a>
				<div class="after_ico"></div>
			</li>
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_order.png"></div>
				<a href="<?php echo U('Order/index');?>">我的订单</a>
				<div class="after_ico"></div>
			</li>				
		</ul>
		

		<ul class="list_ul">			
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_diyuan.png"></div>
				<a href="<?php echo U('User/spokesman');?>">我的会员</a>
				<div class="after_ico"></div>
			</li>			
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_tuiguan.png"></div>
				<a href="<?php echo U('User/extension');?>">推广收益明细</a>
				<div class="after_ico"></div>
			</li>
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_tuiguan.png"></div>
				<a href="<?php echo U('User/qrcode');?>">推广二维码</a>
				<div class="after_ico"></div>
			</li>
		</ul>
		
		
		<ul class="list_ul">
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_price.png"></div>
				<a href="<?php echo U('User/wealth');?>">我的财富</a>
				<div class="after_ico"></div>
			</li>
			<li>
				<div class="before_ico"><img src="/Public/home/images/center_ico_tixian.png"></div>
				<a href="<?php echo U('User/withdraw');?>">申请提现</a>
				<div class="after_ico"></div>
			</li>	
		</ul>
	</section>
	
	
	<div class="clear" style="height:6rem;"></div>

	<div class="footer">
		<a href="<?php echo U('Index/index');?>"><img src="/Public/home/images/new_home.png" class="img1"><img
				src="/Public/home/images/new_home_active.png" class="img2">
			<h3>商城</h3></a>
		<a href="<?php echo U('Goods/categoryList');?>"><img src="/Public/home/images/new_cate.png" class="img1"><img
				src="/Public/home/images/new_cate_active.png" class="img2">
			<h3>分类</h3></a>
		<a href="<?php echo U('Cart/index');?>"><img src="/Public/home/images/new_cart.png" class="img1"><img
				src="/Public/home/images/new_cart_active.png" class="img2">
			<h3>购物车</h3></a>
		<a href="<?php echo U('User/index');?>" class="active"><img src="/Public/home/images/new_user.png" class="img1"><img
				src="/Public/home/images/new_user_active.png" class="img2">
			<h3>个人中心</h3></a>
	</div>

</body>

</html>