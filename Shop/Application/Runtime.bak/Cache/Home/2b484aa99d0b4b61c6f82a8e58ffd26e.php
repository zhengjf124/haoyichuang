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
    <div class="container ct-pdt ct-pdb">
        <!--顶部-->
        <div class="header">
            <div class="new-search">
                <input type="text" name="" class="txt" placeholder="请输入关键词">
                <input type="submit" name="" class="btn" value="">
            </div>
            <a href="<?php echo U('User/qrcode');?>" class="qr-code"></a>
        </div>
        <!--顶部:over-->
        <!--分类-->
        <div class="cate">
            <div class="swiper-container swiper2">
                <div class="swiper-wrapper" id="adv">
                    <?php if(is_array($category_list)): $i = 0; $__LIST__ = $category_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
                            <ul>
                                <?php if(is_array($vo)): $i = 0; $__LIST__ = $vo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$se): $mod = ($i % 2 );++$i;?><li>
                                        <a href="<?php echo U('Goods/goodsList',array('cid'=>$se['id']));?>"><img src="<?php echo ($se["type_img"]); ?>">
                                            <h3><?php echo ($se["type_name"]); ?></h3></a>
                                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div class="pagination pagination2"></div>
            </div>
        </div>
        <!--分类:over-->
        <!--banner-->
        <div class="new-bn">
            <div class="swiper-container swiper1">
                <div class="swiper-wrapper" id="adv">
                    <?php if(is_array($ad_liost)): $i = 0; $__LIST__ = $ad_liost;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
                            <a href="<?php echo ($vo["ad_link"]); ?>"><img src="<?php echo ($vo["ad_code"]); ?>"></a>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div class="pagination pagination1"></div>
            </div>
        </div>
        <!--banner:over-->
        <!--特价-->
        <div class="special-offer">
            <ul>
                <?php if(is_array($tejia_goods)): $i = 0; $__LIST__ = $tejia_goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                        <a href="<?php echo U('Goods/detail',array('gid'=>$vo['id']));?>">
                            <div class="name">今日特价</div>
                            <div class="brief"><?php echo ($vo["goods_name"]); ?></div>
                            <div class="img"><span></span><img src="<?php echo ($vo["goods_img"]); ?>"></div>
                        </a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
<!--                 <li>
                    <a href="#">
                        <div class="name">今日特价</div>
                        <div class="brief">全新产品上架</div>
                        <div class="img"><span></span><img src="/Public/home/images/pic_spec2.png"></div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="name">今日特价</div>
                        <div class="brief">新品特价</div>
                        <div class="img"><span></span><img src="/Public/home/images/pic_spec3.png"></div>
                    </a>
                </li> -->
            </ul>
        </div>
        <!--特价:over-->
        <!--创业推荐-->
        <div name="test_md" class="recommend">
            <div class="recommend-top">
                <img src="/Public/home/images/icon_tuijian.png"><strong>创业推荐</strong>
            </div>
            <div class="recommend-bottom" id="list_container">
                <ul id="lists">
                </ul>
            </div>
        </div>
        <!--创业推荐:over-->
        <!--底部-->
        <div class="footer">
            <a href="<?php echo U('Index/index');?>" class="active"><img src="/Public/home/images/new_home.png" class="img1"><img src="/Public/home/images/new_home_active.png" class="img2">
                <h3>商城</h3></a>
            <a href="<?php echo U('Goods/categoryList');?>"><img src="/Public/home/images/new_cate.png" class="img1"><img src="/Public/home/images/new_cate_active.png" class="img2">
                <h3>分类</h3></a>
            <a href="<?php echo U('Cart/index');?>"><img src="/Public/home/images/new_cart.png" class="img1"><img src="/Public/home/images/new_cart_active.png" class="img2">
                <h3>购物车</h3></a>
            <a href="<?php echo U('User/index');?>"><img src="/Public/home/images/new_user.png" class="img1"><img src="/Public/home/images/new_user_active.png" class="img2">
                <h3>个人中心</h3></a>
        </div>
        <!--底部:over-->
    </div>
    <script src="/Public/home/js/idangerous.swiper-1.9.1.min.js"></script>
    <script src="/Public/home/js/new.js"></script>
    <script src="/Public/home/js/dropload.min.js"></script>
    <script src="/Public/home/js/drapDown.js"></script>
</body>

</html>