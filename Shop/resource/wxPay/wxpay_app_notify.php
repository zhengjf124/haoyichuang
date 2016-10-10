<?php
error_reporting(0);
header("Content-type:text/html;charset=utf-8");

/**
 * 微信类
 * @author         xiaoxu<997998478@qq.com>
 * @since          1.0
 */
class wxPay
{
    /**
     * 微信支付
     * @access public
     * @since 1.0
     */
    public function buyPay()
    {
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $out_trade_no = strval($postObj->out_trade_no);
        $total_fee = intval($postObj->total_fee);
        if ($postObj->result_code == 'SUCCESS') {
            $url = 'http://' . $_SERVER['SERVER_NAME'] . '/index.php/Clearing/buyClearing';
            $data['order_sn'] = $out_trade_no;
            $data['pay_money'] = $total_fee / 100;
            $res = json_decode($this->_curlPost($url, $data), true);
            if ($res['code'] == 0) {
                $this->logger($out_trade_no . '   yes_ok');
            } else {
                $this->logger($out_trade_no . '   yes_0');
            }
        } else {
            $this->logger($out_trade_no . '   no');
        }
        if (isset($_GET)) {
            echo "success";
        }
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
        $log_filename = "app_wx_log.xml";
        if (file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)) {
            unlink($log_filename);
        }
        file_put_contents('../log/' . $log_filename, date('H:i:s') . " " . $log_content . "\r\n", FILE_APPEND);
    }

    /**
     * 模拟表单提交
     * @access protected
     * @param string $url 链接
     * @param array $data 数据
     * @since 1.0
     * @return string
     */
    private function _curlPost($url, $data)
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

$pay = new wxPay();
$pay->buyPay();


