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
    提现申请
</header>
<div class="cash">
    <div class="cash-top"><span>支付信息</span></div>
    <div class="cash-bottom">
        <ul>
            <li>
                <span>支付方式</span>
                <!-- <input type="text" id="pay_type" class="txt" placeholder="支付宝/微信/银行卡"> -->
                <select id="pay_type" class="txt" >
                    <option value="支付宝" >支付宝</option>
                    <option value="银行卡" >银行卡</option>
                </select>
            </li>
            <li>
                <span>支付帐号</span>
                <input type="text" id="pay_accounts" class="txt" placeholder="请输入帐号">
            </li>
            <li>
                <span>提现金额</span>
                <input type="text" id="money" class="txt" placeholder="请输入金额">
            </li>
        </ul>
    </div>
</div>
<section class="wealth">
    <article class="tixian_list">
        <ul class="tixian_tab_title">
            <li>编号</li>
            <li>金额</li>
            <li>状态</li>
        </ul>
        <div class="list_box">
            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><ul class="list">
                    <li><?php echo ($vo["sn"]); ?></li>
                    <li>￥<?php echo ($vo["reality_money"]); ?></li>
                    <li><?php echo ($vo["withdrawal_status"]); ?></li>
                </ul><?php endforeach; endif; else: echo "" ;endif; ?>
            <!--<ul class="list">
                <li>2016010112</li>
                <li>￥20</li>
                <li><span class="c-fe9423">审核中</span></li>
            </ul>-->
        </div>
    </article>
    <button id="withdraw_deposit_submit" class="tixian">我要提现</button>
</section>
<div class="clear" style="height:6rem;"></div>
</body>
<script type="text/javascript" src="/Public/home/js/myAjax.js"></script>
</html>