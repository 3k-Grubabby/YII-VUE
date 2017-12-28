<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/26 0026
 * Time: 10:15
 */

namespace app\m;


use Qiniu\QiniuUtil;
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

        $result = new \stdClass();
        $result->name = '';
        $result->status = 0;
        $result->url = "";
        $result->id=0;


        $userid = "0";//用户id 默认0
        $imgName = date("Ymdhis").$userid.'.' . $this->imageFile->extension;

        if ($this->validate()) {

           $vi= ModelFactory::loadModel('videos_img');
           $vi->img_name = $imgName;
           $vi->img_url = 'http://p1ly8xazk.bkt.clouddn.com/'.$imgName;

           if($vi->save()){//数据库插值成功

               $qutil = new QiniuUtil();
               $img_path = 'images/videos/' .$vi->img_name;//图片保存的真实路径

               $this->imageFile->saveAs($img_path);//保存到真实路径

              if($qutil->uploadVImg($vi->img_name,$img_path))//上传到七牛
              {

                  $result->name = $vi->img_name;
                  $result->url = $vi->img_url;
                  $result->status =1;
                  $result->id =$vi->img_id;

                  return json_encode($result);
              }



           }

        }

        return json_encode($result);

    }

}