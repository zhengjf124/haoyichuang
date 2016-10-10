<?php
namespace Application;
use Think\Controller;

class ApiController extends Controller
{
    protected $_app = '';

    protected $_platform = '';

    protected $_url = '';

    public function __construct()
    {
        parent::__construct();
        header("Access-Control-Allow-Origin: *");
        if (I('_app')) {
            $this->_app = I('_app');
        } else {
            // $this->_returnError('10000', '_app is null');
        }
        if (I('_platform')) {
            $this->_platform = I('_platform');
        } else {
            $this->_platform = 'weixin';
            // $this->_returnError('10000', '_platform is null');
        }

        if($this->_platform =='weixin'){
            $this->_url = C("site_url").'/index.php?m=Home&c=wxLogin&a=ind&redirect_uri=';
        }else{
            //$this->_url = C("site_url").'/index.php?m=Home&c=Login&a=login&redirect_uri=';
            $this->_url = '';
        }


    }



    /**
     * 验证passport 返回登录的用户信息
     * @param bool|true $require
     * @return bool|mixed
     */
    protected function _checkPassport()
    {
        $passport = I('_passport');

        if (!$passport) {
            $this->_returnError('10000', 'passport is null', $this->_url);
        }

        $res = M('UserPassport')->where(['passport' => $passport])->find();

        $userInfo = M('User')->where(['id' => $res['user_id']])->find();


        if ($userInfo) {
            return $userInfo;
        } else {

            $this->_returnError('10001', 'passport is error', $this->_url);

        }


    }

    protected function _createPassport($user) {

        $passport = M('UserPassport')->where(['user_id' => $user['id']])->getField('passport');
        if(!$passport){
            $passport = md5(rand(1, 99999));
            //$code = md5(rand(1, 99999));
            M("UserPassport")->data(['passport' => $passport, 'user_id' => $user['id'], 'add_time' => time(),'type'=>'weixin'])->add();
        }
        return $passport;
    }




    protected function _returnError($code, $message, $url='')
    {
        $this->ajaxReturn([
            'error_code' => $code,
            'message' => $message,
            'url'     => $url
        ]);
    }

    protected function _returnData($data)
    {
        $this->ajaxReturn([
            'error_code' => 0,
            'message' => '',
            'data' => $data
        ]);
    }

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
            echo 'Errno'.curl_error($ch);
        }

        curl_close($ch);

        return $info;

    }

    protected function _curlPost($url,$data)
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
            echo 'Errno'.curl_error($ch);
        }

        curl_close($ch);

        return $info;

    }


}