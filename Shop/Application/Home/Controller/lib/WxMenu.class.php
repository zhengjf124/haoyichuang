<?php

class WxMenu
{
    private $appid;
    private $appsecret;
    private $token;

    public function __construct($appid, $appsecret)
    {
        if (!isset($appid) || !isset($appsecret)) {
            return false;
        } else {
            $this->appid = $appid;
            $this->appsecret = $appsecret;
            $this->token = 'laixiaojie7383';
        }
    }

    /**
     * 发布微信自定义菜单
     * @access public
     * @since 1.0
     * @return array
     */
    public function sendMenu()
    {
        $menus = M('diymen_class')->where(array('parent_id' => 0))->order('rank')->limit(3)->select();//一级菜单
        $menustr = '';
        $sum2 = count($menus) - 1;
        foreach ($menus as $k => $val) {
            $submenus = M('diymen_class')->where(array('parent_id' => $val['id']))->order('sort')->limit(5)->select();//二级菜单
            $sum = count($submenus) - 1;
            if (!empty($submenus))//如果有二级菜单
            {
                $menustr2 = "";
                foreach ($submenus as $key => $value) {

                    if ($value['keyword']) {//如果有关键字
                        $value['url'] = $value['keyword'];
                        $style = '{
					   "type":"click",
					   "name":"%s",
					   "key":"%s"
						}';
                    } else {
                        $style = '{
					   "type":"view",
					   "name":"%s",
					   "url":"%s"
						}';
                    }
                    $menustr2 .= sprintf($style, $value['title'], $value['url']);
                    if ($key < $sum) {
                        $menustr2 .= ",";
                    }
                }
                $style2 = '{
				   "name":"%s",
				   "sub_button":[
					   	' . $menustr2 . '					
					]
				},';

                $menustr .= sprintf($style2, $val['title']);
            } else {
                if ($val['keyword']) {//如果有关键字
                    $val['url'] = $val['keyword'];
                    $style = '{
					   "type":"click",
					   "name":"%s",
					   "key":"%s"
						}';
                } else {
                    $style = '{
					   "type":"view",
					   "name":"%s",
					   "url":"%s"
						}';
                }

                $menustr .= sprintf($style, $val['title'], $val['url']);
                if ($k < $sum2) {
                    $menustr .= ",";
                }
            }
        }

        $jsonmenu = '{
			"button":[
				' . $menustr . '
			]
		}';

        $access_token = $this->getAccessToken();
        $url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" . $access_token;
        $result = $this->_httpsRequest($url, $jsonmenu);
        return $result;
    }


    /**
     * 模拟表单提交
     * @access protected
     * @since 1.0
     * @param string $url 表单提交的链接
     * @param array $data 表单提交的数据
     * @return string
     */
    private function _httpsRequest($url, $data = array())
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (empty($data) === false) {
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
        $info = M('diymen_set')->where(array('token' => $this->token))->field('token_expire_time,access_token')->find();
        $now = time();
        /*access_token 7200过期*/
        if ($info['token_expire_time'] && $info['token_expire_time'] > $now) {//没过期
            $access_token = $info['access_token'];
        } else {
            $TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" . $this->appid . "&secret=" . $this->appsecret;
            $json = $this->_httpsRequest($TOKEN_URL);
            $result = json_decode($json, true);
            $access_token = $result['access_token'];

            //保存
            $data['access_token'] = $access_token;
            $data['token_expire_time'] = $now + 7100;
            M('diymen_set')->where(array('token' => $this->token))->save($data);
        }

        return $access_token;
    }

}


