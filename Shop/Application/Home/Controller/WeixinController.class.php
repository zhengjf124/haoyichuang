<?php
/**
 * gwshop
 * 微信交互类
 */ 
namespace Home\Controller;
use Think\Controller;
class WeixinController extends Controller {
    public $client;
    public function _initialize(){
        //parent::_initialize();
        //获取微信配置信息
        $wechat_config = M('wx_user')->where('1=1')->find();
        $this->token = $wechat_config['w_token'];
//        $options = array(
// 			//'token'=>$wechat_config['w_token'], //填写你设定的token
// 			'encodingaeskey'=>$wechat_config['aeskey'], //填写加密用的EncodingAESKey
// 			'appid'=>$wechat_config['appid'], //填写高级调用功能的app id
// 			'appsecret'=>$wechat_config['appsecret'], //填写高级调用功能的密钥
//        		);


    }

    public function index(){

        if (isset($_GET['echostr'])) {
            $this->valid();//验证成为开发者

        }else{
            $this->responseMsg();
        }
    }




    
    public function responseMsg()
    {
		//get post data, May be due to the different environments
		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
      	//extract post data
	 if (empty($postStr))                 	
        	exit("");
         
                /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
                   the best way is to check the validity of xml by yourself */
                libxml_disable_entity_loader(true);
              	$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
                $fromUsername = $postObj->FromUserName;
                $toUsername = $postObj->ToUserName;

				$RX_TYPE = trim($postObj->MsgType);
				if($RX_TYPE == 'event') { //事件消息
					$result = $this->receiveEvent($postObj);
					echo $result;exit();
				}

                $keyword = trim($postObj->Content);
                $time = time();
                if(empty($keyword))
                    exit("Input something...");

                
                // 图文回复
                $wx_img = M('wx_img')->where("keyword like '%$keyword%'")->find();
                if($wx_img)
                {
                    $textTpl = "<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <ArticleCount><![CDATA[%s]]></ArticleCount>
                                <Articles>
                                    <item>
                                        <Title><![CDATA[%s]]></Title> 
                                        <Description><![CDATA[%s]]></Description>
                                        <PicUrl><![CDATA[%s]]></PicUrl>
                                        <Url><![CDATA[%s]]></Url>
                                    </item>                               
                                </Articles>
                                </xml>";                                        
                    $resultStr = sprintf($textTpl,$fromUsername,$toUsername,$time,'news','1',$wx_img['title'],$wx_img['desc']
                            , $wx_img['pic'], $wx_img['url']);
                    exit($resultStr);                   
                }
                
                
                // 文本回复
                $wx_text = M('wx_text')->where("keyword like '%$keyword%'")->find();
                if($wx_text)
                {
                    $textTpl = "<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <Content><![CDATA[%s]]></Content>
                                <FuncFlag>0</FuncFlag>
                                </xml>";                    
                    $contentStr = $wx_text['text'];
                    $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
                    exit($resultStr);                   
                }

                
                
                // 其他文本回复                
                    $textTpl = "<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <Content><![CDATA[%s]]></Content>
                                <FuncFlag>0</FuncFlag>
                                </xml>";                    
                    $contentStr = '你好，欢迎关注好易创!';
                    $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
                    exit($resultStr);                   
      
    }


    /**
     * 接收到事件，返回消息
     * @param $object
     * @return string
     */
    private function receiveEvent($object)
    {
        $content = "";
        switch ($object->Event) {

            case "unsubscribe"://取消关注事件
                $openid = trim($object->FromUserName);
                M('user')->where(array('openid' => $openid))->setField("subscribe", 0);
                break;

            case "SCAN"://扫描了带参数（注意）的二维码
                //保存扫描记录，创建新用户
                $this->setUserInfo($object);
                //$content = "你好，欢迎关注好易创!";
                //$content = "hi,欢迎您来到”好易创“全民消费创业服务平台！“好易创”是一家集购物创业为一体的综合性服务平台。本着“无假货、无次品、假货十倍赔偿”的原则。以消费者与创业者为一体的服务理念，我们将竭诚为您服务！";
                $content = "hi,欢迎您来到“好易创”全民消费创业服务平台！“好易创”是一家集购物创业为一体的综合性服务平台。本着“无假货、无次品、假货十倍赔偿”的原则。以消费者与创业者为一体的服务理念，我们将竭诚为您服务！";
                $result = $this->transmitText($object, $content);
                break;

            case "subscribe": //关注事件

                //保存扫描记录，创建新用户
                $this->setUserInfo($object);
                $content = "hi,欢迎您来到“好易创”全民消费创业服务平台！“好易创”是一家集购物创业为一体的综合性服务平台。本着“无假货、无次品、假货十倍赔偿”的原则。以消费者与创业者为一体的服务理念，我们将竭诚为您服务！";
                $result = $this->transmitText($object, $content);
                break;
            case "CLICK":
                switch ($object->EventKey){
                    case "关于我们":
                        $wx_img['title'] = '关于好易创';
                        $wx_img['desc'] = '“好易创”是一家集购物创业为一体的综合性服务平台。以全民消费创业理念，整合现在已有的资源，满足社会生活广域的需求，并提供丰富的售后服务与保障。';
                        $wx_img['pic'] = 'http://mmbiz.qpic.cn/mmbiz_png/dLaUldaO3F3mBEHBOzcOs7d3Y8LBxAEhQsetBJDOUXHCceBqfPVRmFrunIcCtROcNVNaJVZP0ibI7CibqicHZejiaw/0?wx_fmt=gif';
                        $wx_img['url'] = 'http://mp.weixin.qq.com/s?__biz=MzI3NDQ1NTYxMA==&mid=100000011&idx=1&sn=36a92307213362cf27a896ae8c3aeecd&chksm=6b128c5e5c65054868c9bbf3ca1867fa9912c89d3f7d80e85be50b0e36d2cba6a116d67c1c02#rd';
                        $result = $this->transmitNews($object, $wx_img);
                        break;
                    case "创客模式":
                        $wx_img['title'] = '创客模式';
                        $wx_img['desc'] = '好易创---创客模式：零成本开启创客梦想，1+1>2的整合效应  ，“好易创”与传统行业最大的区别在于：省掉中间商挣差价费用，作为创业者的分享收益。';
                        $wx_img['pic'] = 'http://mmbiz.qpic.cn/mmbiz_png/dLaUldaO3F3mBEHBOzcOs7d3Y8LBxAEhQsetBJDOUXHCceBqfPVRmFrunIcCtROcNVNaJVZP0ibI7CibqicHZejiaw/0?wx_fmt=gif';
                        $wx_img['url'] = 'http://mp.weixin.qq.com/s?__biz=MzI3NDQ1NTYxMA==&mid=100000017&idx=1&sn=1ffd5a532131f87e3f828e41cf4edf68&chksm=6b128c445c650552cd14c5c4980cc805433cdd844d27dd97af8e49587f2273740e58efc7f77c#rd';
                        $result = $this->transmitNews($object, $wx_img);
                        break;
                    case "联系客服":
                            $content = "您好！我是好易创很高兴为您服务。\r\n请输入问题序号：\r\nA：退款提现\r\nB：支付问题\r\nC：账户问题\r\nD : 售后维权（物流类）\r\nE : 消费维权（本地消费类）\r\nF ：意见建议\r\nG：商务合作\r\nH：人工服务\r\n例如：您有退款提现方面的问题，您可直接在对话框输入A。";
                            $result = $this->transmitText($object, $content);
                        break;
                }
                break;
        }
        return $result;  //返回xml消息给微信服务器
    }


    //回复文本消息
    private function transmitText($object, $content)
    {
        $textTpl = "<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[%s]]></Content></xml>";
        $result = sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(), $content);
        return $result;
    }

    //回复图文消息
    public function transmitNews($object, $wx_img){
        $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <ArticleCount><![CDATA[%s]]></ArticleCount>
                    <Articles>
                        <item>
                            <Title><![CDATA[%s]]></Title> 
                            <Description><![CDATA[%s]]></Description>
                            <PicUrl><![CDATA[%s]]></PicUrl>
                            <Url><![CDATA[%s]]></Url>
                        </item>                               
                    </Articles>
                    </xml>";                                        
        $resultStr = sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(), 'news', '1', $wx_img['title'], $wx_img['desc']
                , $wx_img['pic'], $wx_img['url']);
        exit($resultStr);    
    }

    //回复图片消息
    private function transmitImage($object, $MediaId){

      //$result = "<xml><ToUserName><![CDATA[" . $object->FromUserName . "]]></ToUserName><FromUserName><![CDATA[" . $object->ToUserName . "]]></FromUserName><CreateTime>" . time() . "</CreateTime><MsgType><![CDATA[image]]></MsgType><Image><MediaId><![CDATA[" . $MediaId . "]]></MediaId></Image></xml>";
      $textTpl = "<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime><MsgType><![CDATA[image]]></MsgType><Image><MediaId><![CDATA[%s]]></MediaId></Image></xml>";
      $result = sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(), $MediaId);
      //$this->logger($result);
      return $result;
    }

    /**
     * 生成日志
     * @access public
     * @param string $log_content 日志内容
     * @since 1.0
     */
    private function logger($log_content)
    {
        $max_size = 100000;
        $log_filename = "app_wx_loga.xml";
        if (file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)) {
            unlink($log_filename);
        }
        file_put_contents($log_filename, date('H:i:s') . " " . $log_content . "\r\n", FILE_APPEND);
    }

    private function setUserInfo($object)
    {
        $openid = trim($object->FromUserName);
        $user_number = substr($object->EventKey, -32);
        $this->logger($user_number);
        $parent_id = M('user_number')->where(array('user_number' => $user_number, 'seller_id' => 0))->getField('user_id');
        if (!$parent_id) {
            $parent_id = 0;
        }
        $user_info = M('user')->where(array('openid' => $openid))->field('id,parent_id')->find();
        if ($user_info) {
            if (preg_match('/^[1-9][0-9]*$/', $parent_id) && $user_info['parent_id'] == 0 && $parent_id != $user_info['id']) {               
                $all_users = M('user')->field('id,parent_id')->select();
                $son_ids = $this->getChildId($all_users, $user_info['id']);
                $son_ids = $son_ids ? $son_ids : array();
                if (!in_array($parent_id, $son_ids)) {
                    $data['parent_id'] = $parent_id;
                }
            }
            $data['subscribe'] = 1;
            M('user')->where(array('id' => $user_info['id']))->save($data);
        } else {
            //$data['user_number'] = $this->_getRandomString();
            $data['user_name'] = 'wx' . time() . rand(100,999);
            $data['parent_id'] = $parent_id;
            $data['subscribe'] = 1;
            $data['openid'] = $openid;
            $data['reg_time'] = time();            
            $user_id = M('user')->add($data);
            $this->saveUserNumber($user_id);
        }
    }

    /**
     * 保存用户编号
     * @access private
     * @param int $user_id 用户ID
     * @param int $seller_id 商家ID（活动ID）
     * @since 1.0
     * @return string
     */
    private function saveUserNumber($user_id, $seller_id = 0)
    {
        $res = M('user_number')->where(array('seller_id' => $seller_id, 'user_id' => $user_id))->field('user_number')->find();
        if (!$res) {
            $user_number = $this->_getRandomString();
            M('user_number')->data(array('user_id' => $user_id, 'user_number' => $user_number, 'seller_id' => $seller_id, 'add_time' => time()))->add();
            return $user_number;
        } else {
            return $res['user_number'];
        }
    }

    /**
     * 传递一个父级分类ID返回所有子分类ID
     * @access private
     * @since 1.0
     * @param array $cate 所有用户信息
     * @param int $pid 父级ID
     * @return array
     */
    private function getChildId($cate, $pid)
    {
        $arr = array();
        foreach ($cate as $val) {
            if ($val['parent_id'] == $pid) {
                $arr[] = $val['id'];
                $arr = array_merge($arr, $this->getChildId($cate, $val['id']));
            }
        }
        return $arr;
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

    public function valid()
    {
        $echoStr = $_GET["echostr"];
        if($this->checkSignature()){
            echo $echoStr;
            exit;
        }
    }
    //验证
    private function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];

        $token = $this->token;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }






}