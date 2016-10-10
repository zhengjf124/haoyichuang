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
    好易创
</header>


<section class="car">
    <div class="title">
        购物车（<span class="tatal_num" style="font-size: 1.7rem;">0</span>）
        <div class="edit">编辑</div>
    </div>

    <ul class="item_ul" id="shopCartBox">
        <?php if(is_array($cart_list)): $i = 0; $__LIST__ = $cart_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                <div class="left_img">
                    <div class="check_img" data-id="<?php echo ($vo["id"]); ?>">
                        <input name="" type="checkbox" id="<?php echo ($vo["id"]); ?>" cartlevel='2' class="check" style="display: none;">
                    </div>
                    <div class="img_box"><label for="<?php echo ($vo["id"]); ?>"><img
                            src="<?php echo ($vo["goods_img"]); ?>"></label></div>
                </div>
                <div class="right_tex">
                    <a href="<?php echo U('Goods/detail',array('gid'=>$vo['id']));?>"><h1 style="display: block; height: 1.5rem; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; line-height: 1.5rem;"><?php echo ($vo["goods_name"]); ?></h1></a>
                    <p><?php echo ($vo["goods_desc"]); ?></p>
                    <div class="price">
                        <span>￥</span><code style="float:none;" class="CartShopPrice"><?php echo ($vo["goods_price"]); ?></code>
                        <code>
                            <button class="del bt_CartReduce">-</button>
                            <input class="text Input_CartListNum" disabled type="text" value="<?php echo ($vo["goods_num"]); ?>"/>
                            <button class="add bt_CartPlus">+</button>
                        </code>
                    </div>
                </div>
                <div class="clear"></div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>

    <div class="buy">总计（不含运费）：<code class="price"><span>￥</span><code id="TotalAmount">0.00</code></code>
        <button id="cart_buy_submit">去结算（<span id="selectNum" style="font-size: 1.3rem;">0</span>）</button>
    </div>

    <div class="bt_bottom" style="display: none;">删除</div>
</section>

<div class="clear" style="height:6rem;"></div>

<div class="footer">
    <a href="<?php echo U('Index/index');?>" ><img src="/Public/home/images/new_home.png" class="img1"><img src="/Public/home/images/new_home_active.png" class="img2">
        <h3>商城</h3></a>
    <a href="<?php echo U('Goods/categoryList');?>"><img src="/Public/home/images/new_cate.png" class="img1"><img src="/Public/home/images/new_cate_active.png" class="img2">
        <h3>分类</h3></a>
    <a href="<?php echo U('Cart/index');?>" class="active"><img src="/Public/home/images/new_cart.png" class="img1"><img src="/Public/home/images/new_cart_active.png" class="img2">
        <h3>购物车</h3></a>
    <a href="<?php echo U('User/index');?>"><img src="/Public/home/images/new_user.png" class="img1"><img src="/Public/home/images/new_user_active.png" class="img2">
        <h3>个人中心</h3></a>
</div> 

</body>
<script src="/Public/home/js/myAjax.js"></script>
<script src="/Public/home/js/shoppingcart.js"></script>
<script>
    $(function () {

        $('.edit').click(function () {
            var edit = $(this).attr('edit');
            if (edit == 1) {
                $(this).attr('edit', 0);
                $(this).html('编辑');
                $('.bt_bottom').hide();
                $('.buy').show();
            } else {
                $(this).attr('edit', 1);
                $(this).html('完成');
                $('.bt_bottom').show();
                $('.buy').hide();
            }
        });

        var b = new $.shopCart({
            shopCartBoxId: 'shopCartBox',//订单列表根目录ID
            TotalAmountBoxId: 'TotalAmount',//用于存放计算总金额的ID
        });

        b.starShoppingCart();


    })
</script>
</html>