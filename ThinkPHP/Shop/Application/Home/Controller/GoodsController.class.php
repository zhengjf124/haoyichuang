<?php
namespace Home\Controller;
/**
 * 商品接口
 * @author wubuze
 * @package Home\Controller
 */
class GoodsController extends CommonController
{

    /**
     * 我是构造函数
     *
     */
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * 商品(或商品搜索)列表接口 \n
     * URI : /Home/goods/index
     * @param :
     *
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     * order_by | string   | 选填   |综合排序 order_sort-desc \n 销量最高 order_sales-desc \n 销量最低 order_sales-asc \n 价格最高 order_price-desc \n 价格最低 order_price-asc
     *  offset  |   int    | 选填   |分页开始
     *  limit   |   int    | 选填   |每页几条
     *  cat_id  |   int    | 选填   |分类id
     *  keyword |   string | 选填   |搜索关键字
     *
     * @return
     * name   | type     | description
     * --------|----------|----------------------
     * list     | array   | 商品列表二维数组
     * count    | int     | 商品总数
     *
     * list :
     * name   | type     | description
     * -------|----------|----------------------
     * id     | int      | 商品id
     * goods_name | string  | 商品名称
     * market_price | decimal | 市场价
     * goods_price | decimal   | 价格
     * goods_brief | string   | 商品简介,卖点
     * goods_img | string   | 商品图片url
     * is_new | int  | 是否是新品（1-是，0-否）
     * is_hot | int  | 是否是热卖 （同上）
     * is_best | int | 是否精品 （同上）
     * comment_count | int   | 评论数量
     *
     */
    public function index()
    {
        $cat_id = I('cat_id', 0);
        $where = [];
        $where['is_on_sale'] = 1;
        $where['gtype'] = 0;//0-普通商品，1-团购商品，2-限时抢购
        $order = [];
        $offset = I('offset') ? I('offset') : 0;
        $limit = I('limit') ? I('limit') : 20;
        $keyword = I('keyword') ? I('keyword') : '';
        if (intval($cat_id) > 0) {
            $where['cat_id'] = $cat_id;
        }

        if ($keyword) {
            $where['goods_name'] = array('like', '%' . $keyword . '%');
        }
        if (I('order_by')) {
            $order_by = explode('-', I('order_by'));
            if ($order_by[0] == 'order_sort') {
                $order = 'sort_order desc';
            } elseif ($order_by[0] == 'order_sales') {
                $order = 'goods_sales ' . $order_by[1];

            } elseif ($order_by[0] == 'order_price') {
                $order = 'goods_price ' . $order_by[1];
            } else {
                $order = 'sort_order desc';
            }
        }

        $count = M('Goods')->where($where)->count();
        $goods = M('Goods')->field('id,goods_name,goods_price,market_price,goods_brief,is_hot,is_new,is_best,goods_img')
            ->limit($offset, $limit)
            ->where($where)->order($order)->select();
        foreach ($goods as &$g) {
            $g['comment_count'] = M('Comments')->where(['goods_id' => $g['id']])->count();
        }

        $data = ['list' => $goods, 'count' => $count];
        $this->_returnData($data);

    }

    /**
     * 商品分类列表
     */
    public function categoryList()
    {

        $list = M('goods_category')->where(array('is_show' => 1, 'parent_id' => 0))->field('id,type_name,type_img')->order('sort_order asc')->select();
        $pid = I('pid');
        if (!preg_match('/^[1-9][0-9]*$/', $pid)) {
            $pid = $list[0]['id'];
        }
        $second_list = M('goods_category')->where(array('is_show' => 1, 'parent_id' => $pid))->field('id,type_name,type_img')->order('sort_order asc')->select();

        foreach ($list as &$value) {
            if ($value['id'] == $pid) {
                $value['show'] = 1;
            } else {
                $value['show'] = 0;
            }
        }
        unset($value);        
        $this->assign('list', $list);
        $this->assign('second_list', $second_list);
        $this->display();
    }

    public function goodsList()
    {
        $cat_id = trim(I('cid'));
        $this->assign('cat_id', $cat_id);
        $this->display();
    }

    public function getGoodsList()
    {
        //排序未完成
        $where = array();
        $where['is_on_sale'] = 1;
        $where['is_delete'] = 0;
        $nowPage = I('page');//当前页码
        if (!preg_match('/^[1-9][0-9]*$/', $nowPage)) {
            $this->_returnError(1, '页码不正确');
        }

        $cid = I('cid');
        if (preg_match('/^[1-9][0-9]*$/', $cid)) {
            $category_id = M('goods_category')->where(array('parent_id' => $cid, 'is_show' => 1))->getField('id', true);
            $category_id[] = $cid;//分类ID
            $where['cat_id'] = array('in', $category_id);
        } else {
            $where['is_recommend'] = 1;
        }
        $totalRows = M('goods')->where($where)->count();
        $listRows = 8;//一页8条
        $Page = new \Common\Util\Page($totalRows, $listRows, $nowPage);
        $list = M('goods')->where($where)->field('id,goods_name,goods_brief,goods_price,goods_img,once_distribution_price,second_distribution_price,third_distribution_price')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $totalPages = ceil($totalRows / $listRows);//总页数
        $data['next_page'] = $nowPage + 1;
        $data['total_page'] = $totalPages;
        $data['list'] = $list;
        $this->_returnData($data);
    }


    /**
     * 商品详细页面接口 \n
     * URI : /Home/Goods/detail
     * @param :
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     * id       | int      | 必填   |商品id  （id为空错误码 error_code = 50001）
     *
     * @return
     * name   | type     | description
     * -------|----------|----------------------
     * goods  | array    | 商品信息
     * goods_images| array | 商品相册二维数组
     * goods_comment|int   | 商品评价数量
     * specList     |array|商品规格列表 [查看详情](http://demo.gnwai.com/wbz/images/specList.jpg)
     * spec_goods_price|array|商品规格对应价格列表 [查看详情](http://demo.gnwai.com/wbz/images/spec_goods_price.jpg)
     *
     * goods :
     * name   | type     | description
     * -------|----------|----------------------
     * id     | int      | 商品id
     * goods_name | string      | 商品名称
     * market_price | decimal   | 市场价
     * goods_price | decimal   | 商品价格
     * goods_brief | string   | 商品简介
     * store_count | string   | 商品库存
     * is_best     | int   | 促销 （是否精品 1-是 0-不是）
     * is_hot      | int   | 促销 （是否热卖 1-是 0-不是）
     * is_new      | int   | 促销 （是否新品 1-是 0-不是）
     * limit_time  | string | 限时抢购结束时间
     * gtype       | int    | 0-普通商品，2-限时抢购商品
     *
     * goods_images
     * name   | type     | description
     * -------|----------|----------------------
     * image_url   | string      | 商品图片url
     *
     *
     */
    public function detail()
    {
        /*绑定用户关系*/
        /*        if ($this->user_info['parent_id'] == 0) {
                    $code = trim(I('rec_code')); //推荐码
                    if (preg_match('/^[0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]{32}$/', $code)) {
                        $parent_id = M('user')->where(array('user_number' => $code))->getField('user_id');
                        $all_users = M('user')->field('user_id,parent_id')->select();
                        $son_ids = $this->getChildId($all_users, $this->user_id);
                        $son_ids = $son_ids ? $son_ids : array();
                        if (preg_match('/^[1-9][0-9]*$/', $parent_id) && $parent_id != $this->user_id && !in_array($parent_id, $son_ids)) {
                            M('user')->where(array('user_id' => $this->user_id))->setField('parent_id', $parent_id);
                        }
                    }
                }*/

        $goods_id = trim(I('gid'));
        if (!preg_match_all('/^[1-9][0-9]*$/', $goods_id)) {
            die("<script>alert('未知错误');location.href='" . U('Index/index') . "';</script>");
        }
        $info = M('goods')->where(array('id' => $goods_id, 'is_on_sale' => 1, 'is_delete' => 0))->field('id,goods_name,goods_price,goods_desc')->find();
        if (!$info) {
            die("<script>alert('对不起，商品不存在');location.href='" . U('Index/index') . "';</script>");
        }
        $info['goods_imgs'] = M('goods_images')->where(array('goods_id' => $info['id']))->field('image_url')->select();
        //$info['goods_desc'] = htmlspecialchars($info['goods_desc']);
        $info['goods_desc'] = htmlspecialchars_decode($info['goods_desc']);
        $this->assign('info', $info);

        /**/
        /*        $weicaht_info = M('diymen_set')->where(array('id' => 1))->field('appid,appsecret')->find();
                $s = new wxShare($weicaht_info['appid'], $weicaht_info['appsecret']);
                $theme = $info['goods_name'];
                $desc = trim($info['goods_desc']);
                $img = DOMAIN_NAME . $info['goods_img'];
                $user_number = $this->user_info['user_number'];
                $url = DOMAIN_NAME . '/index.php/Index/cont/gid/' . $goods_id . '/rec_code/' . $user_number;
                $data = $s->index($theme, $desc, $img, $url);
                $this->assign('shareinfo', $data['shareinfo']);
                $this->assign('config', $data['config']);*/
        $this->display();

    }

    /**
     * 商品详情猜你喜欢商品列表
     * URI : /Home/Goods/youLike
     * @param :
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     * _passport| string   | 选填   | 用户票据没有的时候可以不需要
     *
     * @return
     * name   | type     | description
     * -------|----------|----------------------
     * goods_list|array  | 商品列表
     *
     * goods_list
     * name   | type     | description
     * -------|----------|----------------------
     * id      | int | 商品id
     * goods_name |string|商品名称
     * goods_price|decimal|商品价格
     * goods_img|string|商品图片
     *
     */

    public function youLike()
    {
        $passport = I('_passport');
        $where['goods_type'] = 0;//0-普通商品，1-团购商品，2-限时抢购

        if ($passport) {
            $goods = M('Goods')->where($where)->field('id,goods_name,goods_price,goods_img')->limit(4)->select();
        } else {
            $goods = M('Goods')->where($where)->field('id,goods_name,goods_price,goods_img')->limit(4)->select();
        }

        $data['goods_list'] = $goods;
        $this->_returnData($data);
    }

    /**
     * 商品内容详情 \n
     * URI : /Home/Goods/content
     * @param :
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     * id       | int      | 必填   |商品id
     *
     * @return
     * name   | type     | description
     * --------|----------|----------------------
     * id      | int      | 商品id
     * goods_desc | html   | 商品详细内容
     *
     */
    public function content()
    {
        $id = I("id");
        if (!$id) {
            $this->_returnError('50001', '商品id不能为空');
        }
        $goods = M('Goods')->field('id,goods_desc')->where(['id' => $id])->find();
        $data = $goods;
        $this->_returnData($data);


    }


    /**
     * ###限时抢购商品列表
     * URI : /Home/goods/buyLimit
     * @param :
     *
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     *  offset  |   int    | 选填   |分页开始
     *  limit   |   int    | 选填   |每页几条
     *
     * @return
     * name   | type     | description
     * --------|----------|----------------------
     * list     | array   | 商品列表二维数组
     * count    | int     | 商品总数
     * limit_time| string   | 结束时间
     *
     * list :
     * name   | type     | description
     * -------|----------|----------------------
     * id     | int      | 商品id
     * goods_name | string  | 商品名称
     * market_price | decimal | 市场价
     * goods_price | decimal   | 价格
     * goods_img | string   | 商品图片url
     */
    public function buyLimit()
    {

        $where = [];
        $where['is_on_sale'] = 1;
        $where['goods_type'] = 2;//0-普通商品，1-团购商品，2-限时抢购
        $offset = I('offset') ? I('offset') : 0;
        $limit = I('limit') ? I('limit') : 20;
        $where['limit_time'] = array('gt', time());
        $order = 'id desc';

        $count = M('Goods')->where($where)->count();
        $goods = M('Goods')->field('id,goods_name,goods_price,market_price,goods_img')
            ->limit($offset, $limit)
            ->where($where)->order($order)->select();
        $endtime = M('active')->where(['type' => 'limit_goods'])->getField('end_time');
        $endtime = date('Y/m/d H:i:s', $endtime);
        $data = ['list' => $goods, 'count' => $count, 'limit_time' => $endtime];
        $this->_returnData($data);

    }

    /**
     * ###团购商品列表
     * URI : /Home/goods/buyGroup
     * @param :
     *
     * name     | type     |  null |description
     * ---------|----------|-------|-------------
     *  offset  |   int    | 选填   |分页开始
     *  limit   |   int    | 选填   |每页几条
     *
     * @return
     * name   | type     | description
     * --------|----------|----------------------
     * list     | array   | 商品列表二维数组
     * count    | int     | 商品总数
     *
     * list :
     * name   | type     | description
     * -------|----------|----------------------
     * id     | int      | 商品id
     * goods_name | string  | 商品名称
     * market_price | decimal | 市场价
     * goods_price | decimal   | 价格
     * goods_img | string   | 商品图片url
     * end_time | string   | 团购结束时间
     */
    public function buyGroup()
    {

        $where = [];
        $where['is_on_sale'] = 1;
        $where['goods_type'] = 1;//0-普通商品，1-团购商品，2-限时抢购
        $offset = I('offset') ? I('offset') : 0;
        $limit = I('limit') ? I('limit') : 20;
        $where['limit_time'] = array('gt', time());
        $order = 'id desc';

        $count = M('Goods')->where($where)->count();
        $goods = M('Goods')->field('id,goods_name,goods_price,market_price,goods_img,end_time')
            ->limit($offset, $limit)
            ->where($where)->order($order)->select();
        foreach ($goods as &$val) {
            $val['end_time'] = date('Y/m/d H:i:s', $val['end_time']);
        }
        $data = ['list' => $goods, 'count' => $count];
        $this->_returnData($data);

    }


}//end
