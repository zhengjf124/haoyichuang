<?php
namespace Home\Controller;

/**
 * 首页
 * @author xiaoxu <997998478@qq.com>
 * @package Home\Controller
 */
class IndexController extends CommonController
{


    public function index()
    {


        $categoryList = M('goods_category')->where(array('is_show' => 1, 'parent_id' => 0))->field('id,type_name,type_img')->order('sort_order asc')->select();
        $list = array();
        foreach ($categoryList as $key => $value) {
            $a = intval($key/10);
            $list[$a][] = $value;
        }
        $this->assign('category_list', $list);
        //广告图
        $ad_liost = M('ad')->where(array('pid' => 1, 'enabled' => 1))->field('ad_link,ad_code')->order('orderby asc')->limit(4)->select();
		$this->assign('ad_liost', $ad_liost);
		//今日特价
		$tejia_goods = M('goods')->where(array('is_new'=>1,'is_on_sale'=>1))->field('id,goods_name,goods_img')->limit(3)->select();
		$this->assign('tejia_goods', $tejia_goods);
        $this->display();
    }

    public function index_tj()
    {

        //$categoryList = M('goods_category')->where(array('is_show' => 1, 'parent_id' => 0))->field('id,type_name,type_img')->order('sort_order asc')->select();
        //$this->assign('category_list', $categoryList);
        $this->display();
    }

    public function cont()
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


}