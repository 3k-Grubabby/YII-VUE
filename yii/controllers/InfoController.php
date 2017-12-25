<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 11:46
 */

namespace app\controllers;

use yii\filters\auth\QueryParamAuth;
use yii\rest\ActiveController;

class InfoController extends ActiveController
{
    public $modelClass = 'app\m\News';

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => QueryParamAuth::className(),
        ];
        return $behaviors;
    }

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
        \Yii::$app->user->enableSession =false;
    }
}