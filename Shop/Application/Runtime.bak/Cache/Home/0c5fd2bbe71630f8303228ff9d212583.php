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
<script type="text/javascript" src="/Public/home/js/json-array-of-province.js"></script>
<script type="text/javascript" src="/Public/home/js/json-array-of-city.js"></script>
<script type="text/javascript" src="/Public/home/js/json-array-of-district.js"></script>
<link href="/Public/home/css/address.css?id=2" rel="stylesheet" type="text/css">
<body>
	<!--
    	作者：181331251@qq.com
    	时间：2016-08-29
    	描述：地址
    -->

		<div class="sheng_box" style="display:none;" id="province">
	        <div class="titleWrap"><h2><strong>省份选择</strong></h2><span class="back"><a onClick="backdiv('1')">返回</a></span></div>
	        <ul id="provinceDiv">

	        </ul>
	    </div>

	    <div class="city_box"  style="display:none;" id="city">
	        <div class="titleWrap"><h2><strong>市选择</strong></h2><span class="back"><a onClick="backdiv('2')">返回</a></span></div>
	        <ul id="cityDiv">

	        </ul>
	    </div>

	    <div class="district_box" style="display:none;" id="district">
	        <div class="titleWrap"><h2><strong>区/县选择</strong></h2><span class="back"><a onClick="backdiv('3')">返回</a></span></div>
	        <ul id="districtDiv">
	            <li></li>
	            <li></li>
	        </ul>
	    </div>

	<!--
    	作者：181331251@qq.com
    	时间：2016-08-27
    	描述：头部
    -->
	<header>
		<a href="<?php echo U('Useraddr/index');?>"><div class="back"></div></a>
		新增地址
	</header>

	<div class="clear" style="height:1rem;"></div>
	<section class="address">
		<ul class="list_ul">
			<input type="hidden" id="address_id" value="<?php echo ($info["id"]); ?>">
			<li><label>收货人</label><input type="text" value="<?php echo ($info["consignee"]); ?>" id="consignee" placeholder="请输入姓名"></li>
			<li><label>手机号</label><input type="text" value="<?php echo ($info["mobile"]); ?>" id="mobile" placeholder="请输入手机"></li>
			<li onClick="showProvince();"><label>省/直辖市</label><input id="sheng" value="<?php echo ($info["province"]); ?>" type="text" name="" placeholder=""><div class="after_ico"></div></li>
			<li onClick="showProvince();"><label>市</label><input id="shiqu" type="text" value="<?php echo ($info["city"]); ?>" name="" placeholder=""><div class="after_ico"></div></li>
			<li onClick="showProvince();"><label>区/县</label><input id="xuang" type="text" value="<?php echo ($info["district"]); ?>" name="" placeholder=""><div class="after_ico"></div></li>
			<li><label>详细地址</label><input type="text" id="address" value="<?php echo ($info["address"]); ?>" placeholder="请输入详细地址"></li>
			<input type="hidden" id="type" value="<?php echo ($type); ?>">
		</ul>
	</section>

	<button <?php if(ACTION_NAME == 'add'): ?>id="add_address_submit" <?php elseif(ACTION_NAME == 'edit'): ?> id="edit_address_submit"<?php endif; ?> class="add_button">确定</button>

	<div class="clear" style="height:6rem;"></div>
</body>
<script type="text/javascript" src="/Public/home/js/myAjax.js"></script>
<script>
function showProvince(){
	var list = eval(json_provice);
	var html = '';
	$.each(list,function(i,item){
		html += ' <li onclick="showCityOfProvince(\''+item.code+'\''+','+'\''+item.name+'\')"><a href="javascript:;">'+item.name+'</a></li>'
	});
	$('#provinceDiv').append(html);
	showhidediv('province');
}

function showCityOfProvince(p_code,p_name){
	document.getElementById('sheng').value=p_name;
	var city_list = eval(json_city);
	var city_html = '';
		//alert(pcode.substr(0,2));
	$.each(city_list,function(i,item){
		if(item.code.substr(0,2) == p_code.substr(0,2)){
			city_html += ' <li onclick="showDistrictOfCity(\''+item.code+'\''+','+'\''+item.name+'\')"><a href="#">'+item.name+'</a></li>';
		}
	});
	$('#cityDiv').empty();
	$('#cityDiv').append(city_html);
	showhidediv('city');
}

function showDistrictOfCity(city_code,city_name){
	document.getElementById('shiqu').value=city_name;
	var district_list = eval(json_district);
	var district_html = '';
		//alert(pcode.substr(0,2));
	$.each(district_list,function(i,item){
		if(item.code.substr(0,4) == city_code.substr(0,4)){
			//district_html += ' <li><a href="#">'+item.name+'</a></li>';
			district_html += ' <li onclick="okProvinceCity(\''+item.code+'\''+','+'\''+item.name+'\')"><a href="#">'+item.name+'</a></li>';
		}
	});
	$('#districtDiv').empty();
	$('#districtDiv').append(district_html);
	showhidediv('district');
}

function okProvinceCity(d_code,d_name){
	document.getElementById('xuang').value=d_name;
	showhidediv('province');
	showhidediv('city');
	showhidediv('district');
}

function backdiv(whereNum){
	if(whereNum == 1){
		showhidediv('province');
	}else if(whereNum == 2){
		showhidediv('city');
	}else if(whereNum == 3){
		showhidediv('district');
	}
}

//创建一个showhidediv的方法，直接跟ID属性
function showhidediv(id){
	var sbtitle=document.getElementById(id);
	if(sbtitle){
	   if(sbtitle.style.display=='block'){
			sbtitle.style.display='none';
	   }else{
			sbtitle.style.display='block';
	   }
	}
}
</script>
</html>