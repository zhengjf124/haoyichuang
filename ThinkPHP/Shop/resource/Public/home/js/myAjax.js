var ids = [], vals = [];
$(function () {
    //添加购物车
    $("#add_cart_submit").click(function () {
        var goods_id = $('#goods_id').val();
        $.ajax({
            url: '/index.php/Cart/add',
            type: 'POST',
            data: {goods_id: goods_id},
            success: function (data) {
                console.log(data);
                cloud.explain(data.reason, '');
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });

    //添加地址
    $("#add_address_submit").click(function () {
        var consignee = $('#consignee');//收货人
        var mobile = $('#mobile');//手机号码
        var province = $('#sheng');//省
        var city = $('#shiqu');//市
        var district = $('#xuang');//地区
        var address = $('#address');//具体地址
        var type = $('#type');//跳转类型
        if (consignee.val() == '') {
            cloud.explain('请填写收货人姓名', '');
            consignee.focus();
            return false;
        }

        if (!(/^1[3|4|5|7|8]\d{9}$/.test(mobile.val()))) {
            cloud.explain('手机号码不正确，请重新输入', '');
            mobile.val('');
            mobile.focus();
            return false;
        }

        if (province.val() == '') {
            cloud.explain('请选择省/直辖市', '');
            return false;
        }
        if (city.val() == '') {
            cloud.explain('请选择市', '');
            return false;
        }
        if (district.val() == '') {
            cloud.explain('请选择区/县', '');
            return false;
        }
        if (address.val() == '') {
            cloud.explain('请填写详细地址', '');
            address.focus();
            return false;
        }
        $.ajax({
            url: '/index.php/Useraddr/add',
            type: 'POST',
            data: {
                consignee: consignee.val(),
                mobile: mobile.val(),
                province: province.val(),
                city: city.val(),
                district: district.val(),
                address: address.val(),
                type: type.val()
            },
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    consignee.val('');
                    mobile.val('');
                    province.val('');
                    city.val('');
                    district.val('');
                    address.val('');
                    if (data.data.type == 'order') {
                        cloud.alert(data.reason, function () {
                            window.location.href = '/index.php/Order/confirm/address_id/' + data.data.address_id;
                        })
                    } else {
                        cloud.alert(data.reason, function () {
                            window.location.href = '/index.php/Useraddr/index';
                        })
                    }
                } else {
                    cloud.explain(data.reason, '');
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });

    //修改地址
    $("#edit_address_submit").click(function () {

        var address_id = $('#address_id');//收货地址ID
        var consignee = $('#consignee');//收货人
        var mobile = $('#mobile');//手机号码
        var province = $('#sheng');//省
        var city = $('#shiqu');//市
        var district = $('#xuang');//地区
        var address = $('#address');//具体地址
        var type = $('#type');//跳转类型
        if (consignee.val() == '') {
            cloud.explain('请填写收货人姓名', '');
            consignee.focus();
            return false;
        }

        if (!(/^1[3|4|5|7|8]\d{9}$/.test(mobile.val()))) {
            cloud.explain('手机号码不正确，请重新输入', '');
            mobile.val('');
            mobile.focus();
            return false;
        }

        if (province.val() == '') {
            cloud.explain('请选择省/直辖市', '');
            return false;
        }
        if (city.val() == '') {
            cloud.explain('请选择市', '');
            return false;
        }
        if (district.val() == '') {
            cloud.explain('请选择区/县', '');
            return false;
        }
        if (address.val() == '') {
            cloud.explain('请填写详细地址', '');
            address.focus();
            return false;
        }
        $.ajax({
            url: '/index.php/Useraddr/edit',
            type: 'POST',
            data: {
                consignee: consignee.val(),
                mobile: mobile.val(),
                province: province.val(),
                city: city.val(),
                district: district.val(),
                address: address.val(),
                type: type.val(),
                address_id: address_id.val()
            },
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    if (data.data.type == 'order') {
                        cloud.alert(data.reason, function () {
                            window.location.href = '/index.php/Order/confirm/address_id/' + data.data.address_id;
                        })
                    } else {
                        cloud.alert(data.reason, function () {
                            window.location.href = '/index.php/Useraddr/index';
                        })
                    }
                } else {
                    cloud.explain(data.reason, '');
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });


    //立即购买
    $("#buy_now_submit").click(function () {
        var goods_id = $('#goods_id').val();
        $.ajax({
            url: '/index.php/Order/toBuying',
            type: 'POST',
            data: {goods_id: goods_id},
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    window.location.href = '/index.php/Order/confirm/address_id/';
                } else {
                    cloud.explain(data.reason);
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });

    $('.check_img').click(function () {
        var thisId = $(this).attr('data-id');
        var thisVal = $(this).parent().siblings('.right_tex').find('input').val();
        if ($(this).is('.active')) {
            delArray(ids, thisId);
            delArray(vals, thisVal);
        } else {
            ids.push(thisId);
            vals.push(thisVal);
        }
    });

    //购物车去结算
    $("#cart_buy_submit").click(function () {
        if (ids.length == 0) {
            cloud.explain('请选择商品！', '');
            return false;
        }
        $.ajax({
            url: '/index.php/Order/toBuying',
            type: 'POST',
            dataType: "json",
            data: {goods_id: ids, goods_num: vals},
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    window.location.href = '/index.php/Order/confirm/address_id/';
                } else {
                    cloud.explain(data.reason);
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });
    //添加订单
    $("#add_order_submit").click(function () {
        var address_id = $('#address_id');//收货地址ID
        if (address_id.val() == 0) {
            cloud.explain('请选择收货地址', '');
            return false;
        }
        var order_sn = $('#order_sn').val();
        var partten = /^[1-9][0-9]*$/;
        if (partten.test(order_sn)) {
            $.ajax({
                url: '/index.php/Order/checkPayStatus',
                type: 'POST',
                data: {order_sn: order_sn},
                success: function (data) {
                    //console.log(data);
                    if (data.code == 0) {
                        callpay(data.data.jsApiParameters);
                    } else if (data.code == 10023) {
                        cloud.alert(data.reason, function () {
                            window.location.href = '/index.php/Order/index';
                        });
                    } else {
                        cloud.explain(data.reason, '');
                    }
                },
                error: function () {
                    cloud.explain('网络连接失败，请重试', '');
                },
                timeout: 5000
            });
            return false;
        }

        $.ajax({
            url: '/index.php/Order/addOrder',
            type: 'POST',
            data: {address_id: address_id.val()},
            success: function (data) {
                console.log(data);
                if (data.code == 0) {
                    $('#order_sn').val(data.data.order_sn);
                    callpay(data.data.jsApiParameters);
                } else {
                    cloud.explain(data.reason, '');
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });
    //删除收货地址
    $('.btn-delete').on('click', function () {
        var _this = this;
        var addressId = $(this).attr('data-id');
        cloud.asked('您确定要删除吗', function () {
            $.ajax({
                url: '/index.php/Useraddr/delUserAddress',
                type: 'POST',
                data: {address_id: addressId},
                success: function (data) {
                    //console.log(data);
                    $(_this).parent().parent().parent().fadeOut();
                    cloud.explain('删除成功!', 'success', 2000);
                },
                error: function () {
                    cloud.explain('网络连接失败，请重试', '');
                },
                timeout: 5000
            });

        }, function () {

        });

    });

    //确认收货
    $('.confirm_goods_submit').on('click', function () {
        var _this = this;
        var order_sn = $(this).attr('data-id');
        cloud.asked('您确定要确认收货吗', function () {
            $.ajax({
                url: '/index.php/Order/confirmGoods',
                type: 'POST',
                data: {order_sn: order_sn},
                success: function (data) {
                    //console.log(data);
                    cloud.explain(data.reason, 'success', 2000);
                    if (data.code == 0) {
                        $(_this).parent().parent().siblings().find('time').text(data.data.order_status);
                        $(_this).fadeOut();
                    }
                },
                error: function () {
                    cloud.explain('网络连接失败，请重试', '');
                },
                timeout: 5000
            });

        }, function () {
            //cloud.msg('您选择了“取消”');
        });

    });
    //默认地址
    $('.moren').on('click', function () {
        if (!$(this).is('.active')) {
            var _this = this;
            var address_id = $(this).siblings().children('.btn-delete').attr('data-id');
            $.ajax({
                url: '/index.php/Useraddr/setDefaultAddress',
                type: 'POST',
                data: {address_id: address_id},
                success: function (data) {
                    //console.log(data);
                    if (data.code == 0) {
                        $('.moren').removeClass('active');
                        $('.moren').text('设为默认地址');
                        $(_this).addClass('active');
                        $(_this).text('默认地址');
                    } else {
                        cloud.explain(data.reason, '');
                    }
                },
                error: function () {
                    cloud.explain('网络连接失败，请重试', '');
                },
                timeout: 5000
            });
        }
    });

    //购物车去结算
    $("#withdraw_deposit_submit").click(function () {
        var pay_type = $('#pay_type');
        var pay_accounts = $('#pay_accounts');
        var money = $('#money');

        if (pay_type.val() == '') {
            cloud.explain('请输入支付方式', '');
            pay_type.val('');
            pay_type.focus();
            return false;
        }

        if (pay_accounts.val() == '') {
            cloud.explain('请输入支付帐号', '');
            pay_accounts.val('');
            pay_accounts.focus();
            return false;
        }

        if (!(money.val() > 0)) {
            cloud.explain('请输入提现金额', '');
            money.val('');
            money.focus();
            return false;
        }
        if (money.val() % 100 != 0) {
            cloud.explain('输入的提现金额必须是100的倍数', '');
            money.val('');
            money.focus();
            return false;
        }

        $.ajax({
            url: '/index.php/User/withdraw',
            type: 'POST',
            dataType: "json",
            data: {pay_type: pay_type.val(), pay_accounts: pay_accounts.val(), money: money.val()},
            success: function (data) {
                console.log(data);
                if (data.code == 0) {
                    pay_type.val('');
                    pay_accounts.val('');
                    money.val('');
                    cloud.alert(data.reason, function () {
                        location.reload();
                    });
                } else {
                    cloud.explain(data.reason, '');
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });

    //取消订单
    $('.cancel_order_submit').on('click', function () {
        var _this = this;
        var order_id = $(this).attr('data-id');
        $.ajax({
            url: '/index.php/Order/cancelOrder',
            type: 'POST',
            data: {order_id: order_id},
            success: function (data) {
                console.log(data);
                if (data.code == 0) {
                    cloud.explain(data.reason, 'success');
                    $(_this).parent().parent().siblings().find('time').text(data.data.order_status);
                    $(_this).fadeOut();
                } else {
                    cloud.explain(data.reason, '');
                }
            },
            error: function () {
                cloud.explain('网络连接失败，请重试', '');
            },
            timeout: 5000
        });
    });

});

//调用微信JS api 支付
function jsApiCall(jsApiParameters) {
    var obj = jQuery.parseJSON(jsApiParameters);
    WeixinJSBridge.invoke(
        'getBrandWCPayRequest',
        obj,
        function (res) {
            if (res.err_msg == "get_brand_wcpay_request:ok") {
                location.href = "/index.php/Pay/success";
            }
        }
    );
}

function callpay(WeixinJSBridge) {
    if (typeof WeixinJSBridge == "undefined") {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', jsApiCall);
            document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
        }
    } else {
        jsApiCall(WeixinJSBridge);
    }
}


function delArray(arr, val) {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == val) {
            arr.splice(i, 1);
            break;
        }
    }
}




