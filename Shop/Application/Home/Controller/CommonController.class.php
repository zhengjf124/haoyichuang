<?php
namespace Home\Controller;
require_once 'lib/WeChatQrcode.class.php';
require_once 'lib/wxPay/WxPayPubHelper.class.php';
use Think\Controller;

/**
 * 公共类
 * @author xiaoxu<997998478@qq.com>
 * @package Home\Controller
 */
class CommonController extends Controller
{
    protected $now; //当前时间
    protected $user_id; //用户ID
    protected $user_info; //用户信息

    public function __construct()
    {
        parent::__construct();
        $this->checkIsWeChat();
        define('WECHAT_ID', 'haoyichang_wechat_id');//微信open_id
        $this->now = time();
        $this->user_info = $this->getUserInfo(); //获取用户信息
        $this->user_id = $this->user_info['id'];
    }

    /**
     * 获取用户信息
     * @access protected
     * @since 1.0
     * @return array|bool
     */
    protected function getUserInfo()
    {
        $info = $this->_checkLoginStatus();
        return M('user')->where(array('id' => $info['id']))->field('id,nick_name,headimgurl,parent_id,account_balance,wechat_qrcode,user_level')->find();
    }


    /**
     * 获取微信ID(wechat_id)
     * @return int|mixed
     */
    protected function getWeChatId()
    {
        return cookie(WECHAT_ID);
    }


    /**
     * 判断是否为微信浏览器
     * @return bool|mixed
     */
    protected function checkIsWeChat()
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($agent, "icroMessenger")) {
            return true;
        } else {
            die('请使用微信浏览器');
        }
    }


    /**
     * 检查登录状态
     * @return array
     */
    protected function _checkLoginStatus()
    {
        /*微信ID*/
        $openid = $this->getWeChatId();
        if (!$openid) {
            return $this->oauth();
        }
        $data = M('user')->where(array('openid' => $openid))->field("id,nick_name,headimgurl")->find();
        if ($data && empty($data['nick_name']) === false && empty($data['headimgurl']) === false) {
            return $data;
        } else {
            return $this->oauth();
        }
    }

    /**
     * 保存用户编号
     * @access protected
     * @param int $user_id 用户ID
     * @param int $seller_id 商家ID（活动ID）
     * @since 1.0
     * @return string
     */
    protected function saveUserNumber($user_id, $seller_id = 0)
    {
        $res = M('user_number')->where(array('seller_id' => $seller_id, 'user_id' => $user_id))->field('user_number')->find();
        if (!$res) {
            $user_number = $this->_getRandomString();
            M('user_number')->data(array('user_id' => $user_id, 'user_number' => $user_number, 'seller_id' => $seller_id, 'add_time' => $this->now))->add();
            return $user_number;
        } else {
            return $res['user_number'];
        }
    }

    /**
     * 获取用户编号
     * @access protected
     * @param int $user_id 用户ID
     * @param int $seller_id 商家ID（活动ID）
     * @since 1.0
     * @return string
     */
    protected function getUserNumber($user_id, $seller_id)
    {
        if (!preg_match('/^[0-9]*$/', $seller_id)) {
            return false;
        }
        $user_number = M('user_number')->where(array('seller_id' => $seller_id, 'user_id' => $$user_id))->getField('user_number');
        if (!$user_number) {
            $user_number = $this->saveUserNumber($user_id);
        }
        return $user_number;
    }

    /**
     * 微信授权登录
     * @return bool|mixed
     */
    protected function oauth()
    {
        $code = I('code');
        $app = M('wx_user')->where(array('1=1'))->field('appid,appsecret')->find();

        if (!$code) {
            $uri = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];//当前页面完整url
            $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $app['appid'] . '&redirect_uri=' . $uri . '&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
            header("Location: " . $url);
            exit;
        } else { //网页授权第二步 使用code换取openid
            $url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $app['appid'] . '&secret=' . $app['appsecret'] . '&code=' . $code . '&grant_type=authorization_code';
            $info = json_decode($this->_curlGet($url), true);
            $info3 = $this->_curlGet('https://api.weixin.qq.com/sns/userinfo?access_token=' . $info['access_token'] . '&openid=' . $info['openid'] . '&lang=zh_CN');
            $info2 = json_decode($info3, true);

            cookie(WECHAT_ID, $info2['openid']);

            $wxinfo = M('user')->where(array('openid' => $info2['openid']))->field("wechat_qrcode,openid,id,nick_name,sex,headimgurl")->find();
            $data['nick_name'] = $info2['nickname']; //昵称
            $data['sex'] = $info2['sex']; //性别
            //$data['city'] = $info2['city']; //城市
            //$data['province'] = $info2['province']; //省份
            //$data['country'] = $info2['country']; //国家
            $data['headimgurl'] = $info2['headimgurl']; //头像
            $w = new WeChatQrcode($app['appid'], $app['appsecret']);
            if (!$wxinfo) { //用户不存在
                $data['openid'] = $info2['openid']; //微信ID（唯一）

                //$data['user_number'] = $this->_getRandomString();

                $data['user_name'] = 'wx' . $this->now . rand(100, 999);
                //$data['wechat_qrcode'] = $w->getWChatQrcode($data['user_number']);
                $data['reg_time'] = $this->now;
                $user_id = M('user')->data($data)->add();
                $this->saveUserNumber($user_id);//保存用户编号
                $data['id'] = $user_id;
            } else {
                if (empty($data['nick_name']) === false && in_array($data['sex'], array(0, 1, 2))) {
                    M('user')->where(array('openid' => $info2['openid']))->save($data);
                }
                if (empty($wxinfo['wechat_qrcode'] === true) || !file_exists(trim($wxinfo['wechat_qrcode'], '/'))) {
                    $wechat_qrcode = $w->getWChatQrcode($this->getUserNumber($wxinfo['id'], 0));
                    M('user')->where(array('openid' => $info2['openid']))->setField('wechat_qrcode', $wechat_qrcode);
                }
                $data['openid'] = $info2['openid'];
                $data['id'] = $wxinfo['id'];
            }
            return $data;
        }
    }

    /**
     * 获取支付信息
     * @access protected
     * @param array $order_info 订单信息
     * @since 1.0
     * @return array
     */
    protected function payInfo($order_info)
    {
        $openid = $this->getWeChatId();
        $money = $order_info['pay_fee'] * 100;
        //使用jsapi接口
        $jsApi = new \JsApi_pub();
        //=========步骤2：使用统一支付接口，获取prepay_id============
        //使用统一支付接口
        $unifiedOrder = new \UnifiedOrder_pub();
        $unifiedOrder->setParameter("openid", $openid);//
        $unifiedOrder->setParameter("body", "好易创");//商品描述
        //自定义订单号，此处仅作举例
        $unifiedOrder->setParameter("out_trade_no", $order_info['order_sn']);//商户订单号
        $money = 1;
        $unifiedOrder->setParameter("total_fee", $money);//总金额
        $notifyUrl = DOMAIN_NAME . "/wxPay/wxpay_app_notify.php";
        $unifiedOrder->setParameter("notify_url", $notifyUrl);//通知地址
        $unifiedOrder->setParameter("trade_type", "JSAPI");//交易类型
        //非必填参数，商户可根据实际情况选填
        $prepay_id = $unifiedOrder->getPrepayId();
        //=========步骤3：使用jsapi调起支付============
        $jsApi->setPrepayId($prepay_id);
        $jsApiParameters = $jsApi->getParameters();
        return $jsApiParameters;
    }

    /**
     * 保存产品信息
     * @access protected
     * @param array $data 需要保存的数据
     * @since 1.0
     * @return bool
     */
    protected function saveGoodsInfo($data)
    {
        session('tampon_goods_info', null);
        session('tampon_goods_info', $data);
    }

    /**
     * 获取产品信息
     * @access protected
     * @since 1.0
     * @return array
     */
    protected function getGoodsInfo()
    {
        return session('tampon_goods_info');
    }

    /**
     * 删除产品信息
     * @access protected
     * @since 1.0
     * @return array
     */
    protected function delGoodsInfo()
    {
        return session('tampon_goods_info', null);
    }

    /**
     * 获取订单编号
     * @access protected
     * @since 1.0
     * @return int
     */
    protected function getOrderSn()
    {
        return date('YmdHis', $this->now) . rand(10000, 99999);
    }

    /**
     * 获取随机字符串
     * @access protected
     * @param int $n 随机数的长度(默认32位)
     * @since 1.0
     * @return string
     */
    protected function _getRandomString($n = 32)
    {
        $str = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';//输出字符集
        $len = strlen($str) - 1;
        $s = '';
        for ($i = 0; $i < $n; $i++) {
            $s .= $str[rand(0, $len)];
        }
        return $s;
    }

    /**
     * 保存财务日志
     * @access protected
     * @param array $data 需要保存的数据
     * @since 1.0
     * @return bool
     */
    protected function financialLog($data)
    {
        $data['add_time'] = time();
        $result = M('financial_log')->add($data);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 密码加密
     * @access protected
     * @param string $string 需要加密字符串
     * @since 1.0
     * @return string
     */
    protected function passwordEncryption($string)
    {
        return sha1(sha1($string));
    }


    /**
     * 返回错误信息（JSON）
     * @access protected
     * @param string $code 返回的错误码
     * @param string $message 需要返回提示信息
     * @since 1.0
     * @return string
     */
    protected function _returnError($code, $message)
    {
        $this->ajaxReturn([
            'code' => $code,
            'reason' => $message
        ]);
    }

    /**
     * 返回数据（JSON）
     * @access protected
     * @param array $data 需要返回的数据
     * @param string $message 需要返回提示信息
     * @since 1.0
     * @return string
     */
    protected function _returnData($data = array(), $message = '操作成功')
    {
        $this->ajaxReturn(array(
            'code' => 0,
            'reason' => $message,
            'data' => $data
        ));
    }

    /**
     * 保存短信验证码和接收手机号码
     * @access protected
     * @param array $data 需要保存的数据
     * @since 1.0
     * @return bool
     */
    protected function saveNoteCode($data)
    {
        /*5分钟内有效*/
        cookie('woyaomai_mobile_code_info', null);
        cookie('mobile_code_info', $data, array('expire' => 300, 'prefix' => 'woyaomai_'));
        return true;
    }

    /**
     * 获取短信验证码和接收手机号码
     * @access protected
     * @since 1.0
     * @return bool
     */
    protected function getNoteCode()
    {
        return cookie('woyaomai_mobile_code_info');
    }


    /**
     * 模拟GET表单提交
     * @access protected
     * @param string $url 链接
     * @since 1.0
     * @return string
     */
    protected function _curlGet($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Errno' . curl_error($ch);
        }
        curl_close($ch);
        return $info;
    }

    /**
     * 模拟表单提交
     * @access protected
     * @param string $url 链接
     * @param array $data 数据
     * @since 1.0
     * @return string
     */
    protected function _curlPost($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Errno' . curl_error($ch);
        }
        curl_close($ch);
        return $info;
    }
}
