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
<script src="/Public/jweixin-1.0.0.js"></script>
<script>
    /*
     * 注意：
     * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入"公众号设置"的"功能设置"里填写"JS接口安全域名"。
     * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
     * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
     *
     * 如有问题请通过以下渠道反馈：
     * 邮箱地址：weixin-open@qq.com
     * 邮件主题：【微信JS-SDK反馈】具体问题
     * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
     */
    wx.config({
        debug: false,
        appId: '<?php echo ($config["appId"]); ?>',
        timestamp: '<?php echo ($config["timestamp"]); ?>',
        nonceStr: '<?php echo ($config["nonceStr"]); ?>',
        signature: '<?php echo ($config["signature"]); ?>',
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo'
        ]
    });

    var wxData = {
        "appId": "",
        "imgUrl": "<?php echo ($shareinfo["img"]); ?>",
        "shared":  "",
        "link":  "<?php echo ($shareinfo["url"]); ?>",

        "desc": '<?php echo ($shareinfo["desc"]); ?>',
        "title": '<?php echo ($shareinfo["title"]); ?>'
    };

    wx.ready(function () {
        // 2. 分享接口
        // 2.1 监听"分享给朋友"，按钮点击、自定义分享内容及分享结果接口
        wx.onMenuShareAppMessage({
            title: wxData.title,
            desc: wxData.desc,
            link: wxData.link,
            imgUrl: wxData.imgUrl,
            trigger: function (res) {
            },
            success: function (res) {
                location.href = wxData.shared;
            },
            cancel: function (res) {
            },
            fail: function (res) {
                //alert(JSON.stringify(res));
            }
        });

        wx.onMenuShareTimeline({
            title: wxData.title,
            desc: wxData.desc,
            link: wxData.link,
            imgUrl: wxData.imgUrl,
            trigger: function (res) {
            },
            success: function (res) {
                location.href = wxData.shared;
            },
            cancel: function (res) {
            },
            fail: function (res) {
                //alert(JSON.stringify(res));
            }
        });

		wx.onMenuShareQQ({
            title: wxData.title,
            desc: wxData.desc,
            link: wxData.link,
            imgUrl: wxData.imgUrl,
		    success: function () { 
		    	location.href = wxData.shared;
		       // 用户确认分享后执行的回调函数
		    },
		    cancel: function () { 
		       // 用户取消分享后执行的回调函数
		    },
            fail: function (res) {
                //alert(JSON.stringify(res));
            }
		});
    });

    wx.error(function (res) {
        //alert(res.errMsg);
        //alert('nnnnnnnnnnnnnnno');
    });
</script>
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
    推广二维码
</header>

<img src="<?php echo ($wechat_qrcode); ?>" style="width: 100%" alt="">
</body>

</html>