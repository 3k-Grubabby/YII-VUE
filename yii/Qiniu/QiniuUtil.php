<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/27 0027
 * Time: 16:47
 */

namespace Qiniu;

use Qiniu\Auth;
// 引入上传类
use Qiniu\Storage\UploadManager;

class QiniuUtil
{
    public  $auth;
    public  $bucket = '77talk';  //要上传的空间
    public  $token;
    function  __construct()
    {
        // 用于签名的公钥和私钥
        $accessKey = '6U9HazqxK_1DQWVqEYKHPex4-_I2HWBDnPRtXIBC';
        $secretKey = '';
        // 初始化签权对象
        $this->auth = new Auth($accessKey, $secretKey);
        // 生成上传 Token
        $this->token = $this->auth->uploadToken($this->bucket);


//
//        $this->auth->uploadToken($this->bucket,null,3600,[
//            "callbackUrl"=>"http://www.jtthink.php/test.php",
//            "callbackBody"=>'key=$(key)',
//            "mimeLimit"=>"image/jpeg;image/png"
//        ]);



    }

    function  uploadVImg($imgName,$imgPath){ //上传视频图片

        // 初始化 UploadManager 对象并进行文件的上传。
        $uploadMgr = new UploadManager();

        // 调用 UploadManager 的 putFile 方法进行文件的上传。
        list($ret, $err) = $uploadMgr->putFile($this->token, $imgName, $imgPath);
        if ($err !== null) {
            return false;
        } else {
            return true;
        }
    }
    function getUploadToken($userid){//生成视频上传专用的token
        $fileName =  "video".$userid.date("Ymdhis");//视频文件名，暂时么有后缀
        $token = $this->auth->uploadToken($this->bucket,null,3600,["saveKey"=>"$fileName"]);

        $res = new \stdClass();
        $res->uptoken =$token;
        return $res;
    }

}