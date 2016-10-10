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
    我的财富
</header>

<section class="wealth">
    <article>
        <ul class="tixain_title_ul">
            <li>
                <h1>已提现财富</h1>
                <p><code>￥</code><?php echo ($withdraw); ?></p>
            </li>
            <li>
                <h1>可提现财富</h1>
                <p><code>￥</code><?php echo ($account_balance); ?></p>
            </li>
        </ul>
    </article>

    <article class="tixian_list">
        <ul class="tixian_tab_title">
            <li>时间</li>
            <li>金额</li>
            <li>操作</li>
        </ul>
        <div class="list_box">
            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><ul class="list">
                    <li><?php echo ($vo["add_time"]); ?></li>
                    <li>￥<?php echo ($vo["money"]); ?></li>
                    <li><?php echo ($vo["money_type"]); ?></li>
                </ul><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </article>

    <button onclick="location.href='<?php echo U('User/withdraw');?>'" class="tixian">我要提现</button>
</section>


<div class="clear" style="height:6rem;"></div>


</body>

</html>