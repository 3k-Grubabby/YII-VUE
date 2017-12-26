<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/26 0026
 * Time: 10:15
 */

namespace app\m;


use yii\base\Model;

class Uploader extends Model
{
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => false],
        ];
    }


    public function upload()
    {
        $userid = "0";//用户id 默认0
        $imgName = date("Ymdhis").$userid;

        if ($this->validate()) {

            $this->imageFile->saveAs('images/videos/' . $imgName . '.' . $this->imageFile->extension);
            return $imgName;
        } else {

            return false;
        }
    }

}