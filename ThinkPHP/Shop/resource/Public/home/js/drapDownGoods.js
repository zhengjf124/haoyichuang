/**
 * Created by ＸＩＡＯＸＵ＿ＣＣ on 2016/9/23.
 */
;(function ($) {
    var Page = function () {
        this.init();
    };
    Page.prototype = {
        params: {
            offset: 0,
            total: 0,
            cid: $('#cat_id').val()
        },
        init: function () {
            this.loadData();
        },

        getData: function (me) {
            var _this = this;
            ++_this.params.offset;
            console.log(_this.params.offset);

            $.ajax({
                url: '/index.php/Goods/getGoodsList',
                type: "post",
                data: {
                    page: _this.params.offset,
                    cid: _this.params.cid
                },
                success: function (response) {
                    console.log(response);
                    _this.params.total = response.data.total_page;
                    _this.listData(me, response.data.list);
                }
            })


        },
        listData: function (me, data) {
            var _this = this;
            var html = '';
            if (data.length > 0) {
                for (var i in data) {
                    html += '<li>' +
                        '<a href="/index.php/Goods/detail/gid/' + data[i]['id'] + '">' +
                        '<div class="img"><img src="' + data[i]['goods_img'] + '"></div>' +
                        '<div class="info">' +
                        '<div class="name">' + data[i]['goods_name'] + '</div>' +
                        '<div class="brief">' + data[i]['goods_brief'] + '</div>' +
                        '<div class="price">￥<span>' + data[i]['goods_price'] + '</span></div>' +
                        '</div>' +
                        '<div class="caption">推广收益：一级（' + data[i]['once_distribution_price'] + '元）   二级（' + data[i]['second_distribution_price'] + '元）   三级（' + data[i]['third_distribution_price'] + '元）</div>' +
                        '</a>' +
                        '</li>';
                    if (_this.params.offset > _this.params.total) {
                        // 锁定
                        me.lock('down');
                        // 无数据
                        me.noData();
                        break;
                    }

                }
                $('#lists').append(html);
                me.resetload();
            } else {
                $('#lists').append('<div class="nothing">-- 暂无数据 --</div>');
                $('#lists').siblings().remove();
            }
            if (_this.params.offset == _this.params.total) {
                $('#lists').append('<div class="nothing">-- 已经全部加载 --</div>');
                $('#lists').siblings().remove();
            }

        },
        loadData: function () {
            var _this = this;
            $('#list_container').dropload({
                scrollArea: window,
                domUp: {
                    domClass: 'dropload-up',
                    domRefresh: '<div class="dropload-refresh">↓下拉刷新</div>',
                    domUpdate: '<div class="dropload-update">↑释放刷新</div>',
                    domLoad: '<div class="dropload-load"><span class="loading"></span>刷新中...</div>'
                },
                domDown: {
                    domClass: 'dropload-down',
                    domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
                    domLoad: '<div class="dropload-load"><span class="loading"></span>数据加载中...</div>',
                    domNoData: '<div class="dropload-noData"><!--数据已全部加载！--></div>'
                },
                loadUpFn: function (me) {
                    setTimeout(function () {
                        window.location.reload();
                    }, 600);
                    me.resetload();
                },
                loadDownFn: function (me) {
                    _this.getData(me);
                },
                threshold: 150,
                autoLoad: true,
                distance: 50
            });
        }
    };
    new Page();
})(jQuery);