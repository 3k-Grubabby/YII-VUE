<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 10:54
 */

namespace app\m;
use yii\db\ActiveRecord;


class newsClass extends ActiveRecord
{

    public static function tableName()
    {
        return 'news_class';
    }
}