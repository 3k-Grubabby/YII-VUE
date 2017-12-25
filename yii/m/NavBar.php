<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 14:05
 */

namespace app\m;


use yii\db\ActiveRecord;

class NavBar extends ActiveRecord
{
    public static function tableName()
    {
        return 'navbar';
    }
}