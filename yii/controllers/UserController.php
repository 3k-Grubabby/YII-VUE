<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 9:23
 */

namespace app\controllers;
use yii\rest\ActiveController;
use  yii\web\Controller;
use app\m\News;
use yii\web\Response;

class UserController extends ActiveController
{


    public $modelClass = 'app\m\Users';

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }

    public function init()
    {

        $this->enableCsrfValidation =false;
    }

    public function actionSay()
    {
//        \Yii::$app->response->format = "json";
//        $arr = ['name'=>'wangyoucheng','age'=>'18'];
//        return $arr ;
//           echo \Yii::$app->request->post('name','null');
        $news = new News();
//        $news->news_title = 'yii';
//        $news->news_classid =3;
//        $news->user_id =5;
//        $news->save();
//        echo  $news->news_id;

//        return   $news::find()->joinWith("newsClass")->all()[1]->newsClass->class_name;

        return $news::find()->count();


    }
}