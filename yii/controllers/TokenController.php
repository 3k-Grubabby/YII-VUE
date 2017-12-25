<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 12:48
 */

namespace app\controllers;


use yii\rest\ActiveController;
use yii\web\Response;

class TokenController extends ActiveController
{
    public $modelClass = 'app\m\Clients';

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }


    function actions()
    {
        return [
            'index' => [
                'class' => 'app\myactions\TokenAction',
                'modelClass' => $this->modelClass,
            ]
        ];
    }
}