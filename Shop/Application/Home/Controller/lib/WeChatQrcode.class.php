<?php
namespace Home\Controller;
class WeChatQrcode
{
    private $token;

    public function __construct()
    {
        $this->token = 'zujafi1473946152';
    }

    /**
     * 获取微信二维码图片
     * @access public
     * @since 1.0
     * @param string $user_number 用户唯一标识
     * @param string $file 背景图片
     * @return string
     */
    public function getWChatQrcode($user_number = null, $file = 'ewm.jpg')
    {
        if ($user_number == null) {
            return false;
        }
        $token = $this->getAccessToken();
        $url = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=' . $token;
        $data = '{"action_name": "QR_LIMIT_STR_SCENE", "action_info": {"scene": {"scene_str": "' . $user_number . '"}}}';
        $a = $this->_httpsRequest($url, $data);
        $b = json_decode($a, true);
        if ($b['ticket']) {
            $url2 = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" . urlencode($b['ticket']);
            $imageInfo = $this->dowmloadImgFromWeixin($url2);
        } else {
            return false;
        }
        $filename = 'uploads/qrcode/' . date('YmdHis') . rand(1000, 9999) . '.jpg';
        $local_file = fopen($filename, 'w');
        fwrite($local_file, $imageInfo['body']);
        fclose($local_file);
        $this->smartResizeImage($filename, 245, 245);

        $im1 = imagecreatefromjpeg(trim($file, '/'));
        $im2 = imagecreatefromjpeg($filename);
        imagecopymerge($im1, $im2, 145, 580, 0, 0, 245, 245, 100);
        imagejpeg($im1, $filename);
        imagedestroy($im1);
        return '/' . $filename;
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

    /**
     * 下载微信二维码
     * @access private
     * @since 1.0
     * @param string $url 表单提交的链接
     * @param array $data 表单提交的数据
     * @return string
     */
    private function dowmloadImgFromWeixin($url, $data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_NOBODY, 0); //只取body头
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (!empty($data)) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $package = curl_exec($curl);
        $httpinfo = curl_exec($curl);
        curl_close($curl);
        return array_merge(array('body' => $package), array('header' => $httpinfo));
    }

    /**
     * 修改图片尺寸
     * @access private
     * @param int $file 图片完整路径
     * @param int $width 宽度
     * @param int $height 高度
     * @since 1.0
     * @return bool
     */
    private function smartResizeImage($file, $width = 0, $height = 0)
    {
        if ($height <= 0 && $width <= 0) {
            return false;
        }
        $info = getimagesize($file);
        $proportional = false;
        $output = 'file';
        $delete_original = true;
        $use_linux_commands = false;

        $image = '';
        $final_width = 0;
        $final_height = 0;
        list($width_old, $height_old) = $info;
        if ($proportional) {
            if ($width == 0) $factor = $height / $height_old;
            elseif ($height == 0) $factor = $width / $width_old;
            else $factor = min($width / $width_old, $height / $height_old);
            $final_width = round($width_old * $factor);
            $final_height = round($height_old * $factor);
        } else {
            $final_width = ($width <= 0) ? $width_old : $width;
            $final_height = ($height <= 0) ? $height_old : $height;
        }
        switch ($info[2]) {
            case IMAGETYPE_GIF:
                $image = imagecreatefromgif($file);
                break;
            case IMAGETYPE_JPEG:
                $image = imagecreatefromjpeg($file);
                break;
            case IMAGETYPE_PNG:
                $image = imagecreatefrompng($file);
                break;
            default:
                return false;
        }
        $image_resized = imagecreatetruecolor($final_width, $final_height);
        if (($info[2] == IMAGETYPE_GIF) || ($info[2] == IMAGETYPE_PNG)) {
            $trnprt_indx = imagecolortransparent($image);
            // If we have a specific transparent color
            if ($trnprt_indx >= 0) {
                // Get the original image's transparent color's RGB values
                $trnprt_color = imagecolorsforindex($image, $trnprt_indx);
                // Allocate the same color in the new image resource
                $trnprt_indx = imagecolorallocate($image_resized, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
                // Completely fill the background of the new image with allocated color.
                imagefill($image_resized, 0, 0, $trnprt_indx);
                // Set the background color for new image to transparent
                imagecolortransparent($image_resized, $trnprt_indx);
            } // Always make a transparent background color for PNGs that don't have one allocated already
            elseif ($info[2] == IMAGETYPE_PNG) {
                // Turn off transparency blending (temporarily)
                imagealphablending($image_resized, false);
                // Create a new transparent color for image
                $color = imagecolorallocatealpha($image_resized, 0, 0, 0, 127);
                // Completely fill the background of the new image with allocated color.
                imagefill($image_resized, 0, 0, $color);
                // Restore transparency blending
                imagesavealpha($image_resized, true);
            }
        }
        imagecopyresampled($image_resized, $image, 0, 0, 0, 0, $final_width, $final_height, $width_old, $height_old);
        if ($delete_original) {
            if ($use_linux_commands)
                exec('rm ' . $file);
            else
                @unlink($file);
        }
        switch (strtolower($output)) {
            case 'browser':
                $mime = image_type_to_mime_type($info[2]);
                header("Content-type: $mime");
                $output = NULL;
                break;
            case 'file':
                $output = $file;
                break;
            case 'return':
                return $image_resized;
                break;
            default:
                break;
        }
        switch ($info[2]) {
            case IMAGETYPE_GIF:
                imagegif($image_resized, $output);
                break;
            case IMAGETYPE_JPEG:
                imagejpeg($image_resized, $output);
                break;
            case IMAGETYPE_PNG:
                imagepng($image_resized, $output);
                break;
            default:
                return false;
        }
        return true;
    }
}
