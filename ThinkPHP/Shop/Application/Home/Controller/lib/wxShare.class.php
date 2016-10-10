<?php

class wxShare
{
    private $token;

    public function __construct($appid, $appsecret)
    {
        $this->token = 'zujafi1473946152';
    }

    /**
     * 获取微信分享内容
     * @access protected
     * @param string $theme 标题
     * @param string $desc 描述
     * @param string $webImg 引导图
     * @param string $url 链接
     * @since 1.0
     * @return array
     */
    public function index($theme = '', $desc = '', $webImg = '', $url = '')
    {
        $info = array();
        $info['url'] = $url;
        $info['title'] = $theme;
        $info['desc'] = $desc;
        $info['img'] = $webImg;
        $data['shareinfo'] = $info;//分享内容
        $data['config'] = $this->wxShare();
        return $data;
    }

    /**
     * 获取微信分享信息
     * @access protected
     * @since 1.0
     * @return string
     */
    private function wxShare()
    {
        $access_token = $this->getAccessToken();//获取access
        /*注意 URL 一定要动态获取，不能 hardcode.*/
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $config['url'] = $url;
        $config['token'] = $this->token;
        $config['nonceStr'] = 'Wm3WZYTOIUOz0azccnZjf' . time();
        $config['timestamp'] = time();
        $signature = $this->getJsapiTicket($access_token, $config); //分享签名
        $config['signature'] = $signature;
        $config['appId'] = M('wx_user')->where(array('token' => $this->token))->getField('appid');
        return $config;
    }


    /**
     * 获取jsapi_ticket
     * @access protected
     * @since 1.0
     * @return string
     */
    protected function getJsapiTicket($access_token, $share)
    {

        $info = M('wx_user')->where(array('token' => $this->token))->field('share_dated,share_ticket')->find();
        $now = time();
        /*access_token 7200过期*/
        if ($info['share_dated'] && $info['share_dated'] > $now) {//没过期
            $share_ticket = $info['share_ticket'];
        } else {
            $TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" . $access_token . "&type=jsapi";
            $json = $this->_httpsRequest($TOKEN_URL);
            $result = json_decode($json, true);
            $share_ticket = $result['ticket'];

            //保存
            $data['share_ticket'] = $share_ticket;
            $data['share_dated'] = $now + 7100;
            M('wx_user')->where(array('token' => $this->token))->save($data);
        }

        //生成JS-SDK权限验证的签名
        $noncestr = $share['nonceStr'];
        $timestamp = $share['timestamp'];
        $signature = "jsapi_ticket=" . $share_ticket . "&noncestr=" . $noncestr . "&timestamp=" . $timestamp . "&url=" . $share['url'];
        $signature = sha1($signature);
        return $signature;
    }

    private function _httpsRequest($url, $data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (!empty($data)) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }


    /**
     * 获取access_token
     * @access protected
     * @since 1.0
     * @return string
     */
    protected function getAccessToken()
    {
        $info = M('wx_user')->where(array('token' => $this->token))->field('appid,appsecret,web_expires,web_access_token')->find();
        $now = time();
        /*access_token 7200过期*/
        if ($info['web_expires'] && $info['web_expires'] > $now) {//没过期
            $access_token = $info['web_access_token'];
        } else {
            $token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" . $info['appid'] . "&secret=" . $info['appsecret'];
            $json = $this->_httpsRequest($token_url);
            $result = json_decode($json, true);
            $access_token = $result['access_token'];

            //保存
            $data['web_access_token'] = $access_token;
            $data['web_expires'] = $now + 7100;
            M('wx_user')->where(array('token' => $this->token))->save($data);
        }
        return $access_token;
    }

}


