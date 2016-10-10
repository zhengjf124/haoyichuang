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
<style>
    .active{
        font-size: 1.2rem; color: #ee2e49;
    }
</style>
<body>
<!--
    作者：181331251@qq.com
    时间：2016-08-27
    描述：头部
-->
<header>
    <a>
        <?php if($type == 'order'): ?><div class="back" onclick="history.go(-1)"></div>
            <?php else: ?>
            <div class="back" onclick="location.href='<?php echo U('User/index');?>'"></div><?php endif; ?>
    </a>
    收货地址
</header>


<section class="address">
    <?php if($type == 'order'): ?><ul class="address_list_ul">
            <?php if(is_array($address_list)): $i = 0; $__LIST__ = $address_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                    <h1 onclick="location.href='<?php echo U('Order/confirm',array('address_id'=>$vo['id']));?>'">
                        <?php echo ($vo["consignee"]); ?>&nbsp;&nbsp;&nbsp;<?php echo ($vo["mobile"]); ?></h1>
                    <p onclick="location.href='<?php echo U('Order/confirm',array('address_id'=>$vo['id']));?>'">
                        <?php echo ($vo["address"]); ?></p>
                    <div class="bt_group">
                        <?php if($vo['is_default'] == 1): ?><span class="moren active">默认地址</span>
                            <?php else: ?>
                            <span class="moren">设为默认地址</span><?php endif; ?>
                        <code>
                            <span onclick="location.href='<?php echo U('Useraddr/edit',array('type'=>$_GET['type'],'address_id'=>$vo['id']));?>'"
                                  class="button"><img src="/Public/home/images/address_edit.png"> 修改</span>
                            <span data-id="<?php echo ($vo["id"]); ?>" class="button btn-delete"><img
                                    src="/Public/home/images/address_del.png"> 删除</span>
                        </code>
                    </div>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <?php else: ?>
        <ul class="address_list_ul">
            <?php if(is_array($address_list)): $i = 0; $__LIST__ = $address_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                    <h1><?php echo ($vo["consignee"]); ?>&nbsp;&nbsp;&nbsp;<?php echo ($vo["mobile"]); ?></h1>
                    <p><?php echo ($vo["address"]); ?></p>
                    <div class="bt_group">
                        <?php if($vo['is_default'] == 1): ?><span class="moren active">默认地址</span>
                            <?php else: ?>
                            <span class="moren">设为默认地址</span><?php endif; ?>
                        <code>
                            <span onclick="location.href='<?php echo U('Useraddr/edit',array('type'=>$_GET['type'],'address_id'=>$vo['id']));?>'"
                                  class="button"><img src="/Public/home/images/address_edit.png"> 修改</span>
                            <span data-id="<?php echo ($vo["id"]); ?>" class="button btn-delete"><img
                                    src="/Public/home/images/address_del.png"> 删除</span>
                        </code>
                    </div>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul><?php endif; ?>
    <div onclick="location.href='<?php echo U('Useraddr/add',array('type'=>$_GET['type']));?>'" class="bt_bottom">新增收货地址</div>
</section>

<div class="clear" style="height:6rem;"></div>

</body>
<script src="/Public/home/js/myAjax.js"></script>
</html>