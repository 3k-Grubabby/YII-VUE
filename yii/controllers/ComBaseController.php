<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/26 0026
 * Time: 10:38
 */

namespace app\controllers;


use yii\web\Controller;

class ComBaseController extends Controller
{
    public function init()
    {
        require "../Qiniu/functions.php";
        parent::init(); // TODO: Change the autogenerated stub

        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET,POST');
        header('Access-Control-Allow-Headers:x-requested-with,content-type,if-modified-since');


    }
}