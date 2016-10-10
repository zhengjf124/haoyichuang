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
    我的会员
</header>

<section class="spokesman">

    <div class="header_ico">
        <img src="<?php echo ($user_info["headimgurl"]); ?>">
        <div class="text">
            <h1><?php echo ($user_info["nick_name"]); ?></h1>
            <code><?php echo ($user_level); ?></code>
        </div>
    </div>
    <!--
        作者：181331251@qq.com
        时间：2016-08-28
        描述：搜索
    -->
    <div class="search_box">
        <form action="" method="get">
            <div class="clear" style="height: 0.6rem;"></div>
            <div class="search">
                <input type="text" value="<?php echo ($_GET['nickname']); ?>" name="nickname" placeholder="请输入关键词">
                <div class="ico"></div>
                <button type="submit">搜 索</button>
            </div>
        </form>
    </div>

    <!--
        作者：181331251@qq.com
        时间：2016-08-28
        描述：内容区块
    -->
    <div class="tab_box">
        <ul class="tab_title_ul">
            <li onclick="location.href='<?php echo U('spokesman');?>'"
            <?php if($_GET['type'] != 'second' && $_GET['type'] != 'third'): ?>class="active"<?php endif; ?>
            style="width: 33.33%">一级会员</li>
            <li onclick="location.href='<?php echo U('spokesman',array('type'=>'second'));?>'"
            <?php if($_GET['type'] == 'second'): ?>class="active"<?php endif; ?>
            style="width: 33.33%">二级会员</li>
            <li onclick="location.href='<?php echo U('spokesman',array('type'=>'third'));?>'"
            <?php if($_GET['type'] == 'third'): ?>class="active"<?php endif; ?>
            style="width: 33.33%">三级会员</li>
        </ul>

        <ul class="tab_list_ul">
            <li class="active">
                <?php if(is_array($user_list)): $i = 0; $__LIST__ = $user_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><p><?php echo ($vo["nick_name"]); ?> <span><?php echo ($vo["user_name"]); ?></span></p><?php endforeach; endif; else: echo "" ;endif; ?>
            </li>
        </ul>
    </div>

</section>


<div class="clear" style="height:6rem;"></div>


</body>

</html>