<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 10:34
 */

namespace  app\m;
use yii\db\ActiveRecord;
class News extends  ActiveRecord
{
    public static function tableName()
    {
        return 'news';
    }

    public function getNewsClass()
    {
        return $this->hasOne(newsClass::className(), ['class_id' => 'news_classid']);
    }
}