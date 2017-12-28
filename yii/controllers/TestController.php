<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/27 0027
 * Time: 15:26
 */

namespace app\controllers;

use Qiniu\Auth;
// 引入上传类
use Qiniu\Storage\UploadManager;

class TestController extends ComBaseController
{
    function actionIndex(){

        // 用于签名的公钥和私钥
        $accessKey = '6U9HazqxK_1DQWVqEYKHPex4-_I2HWBDnPRtXIBC';
        $secretKey = 'MQ-WajX45v3YfrKzjt_Mu2APW6IxB_r-3323F1Zv';

        // 初始化签权对象
        $auth = new Auth($accessKey, $secretKey);

        //要上传的空间
        $bucket = '77talk';

        // 生成上传 Token
        $token = $auth->uploadToken($bucket);


        // 要上传文件的本地路径
            $filePath = 'images/videos/201712260650380.jpg';

        // 上传到七牛后保存的文件名
            $key = '201712260650380.jpg';

        // 初始化 UploadManager 对象并进行文件的上传。


        $uploadMgr = new UploadManager();

        // 调用 UploadManager 的 putFile 方法进行文件的上传。
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
        echo "\n====> putFile result: \n";
        if ($err !== null) {
            var_dump($err);
        } else {
            var_dump($ret);
        }

        return "test";
    }
}