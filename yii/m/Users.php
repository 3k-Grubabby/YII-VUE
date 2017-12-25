<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/25 0025
 * Time: 11:17
 */

namespace app\m;
use yii\db\ActiveRecord;


class Users extends ActiveRecord
{
    public static function tableName()
    {
        return 'users';
    }
    public function scenarios()
    {
        return [
            'default'=>["user_name"]
        ];
    }
}