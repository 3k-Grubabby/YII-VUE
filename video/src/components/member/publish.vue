<template>
    <div>


    <el-dialog :visible.sync="dialogVisible" size="small">
            <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>
            <el-row>
                <el-col :span="12">
                    <h3>视频基本信息</h3>
                        <el-form ref="videoForm1" :rules="rules" :model="video" label-width="80px">
                            <el-form-item label="视频标题" prop="v_title">
                                <el-input v-model="video.v_title" placeholder="请填写视频标题"></el-input>
                            </el-form-item>

                    <el-form-item label="视频封面" prop="v_class">
                                    <el-upload
                                    class="upload-demo"
                                    action="http://localhost:9090/video/uploadpic"
                                    :on-preview="handlePreview"
                                    :on-remove="handleRemove"
                                    :on-success="handleSuccess"
                                    :multiple="false"
                                    list-type="picture-card"
                                    name="Uploader[file]"
                                     >
                                   <i class="el-icon-plus"></i>
                                    </el-upload>

                    </el-form-item>  
                    <el-form-item label="视频简介" prop="v_intr">
                         <el-input
                                 type="textarea"
                                 :rows="2"
                                 placeholder="视频简介(不超过300字)"
                                 v-model="video.v_intr">
                         </el-input>
                     </el-form-item>


          

    
                                <el-form-item label="上传视频"   >
                                    <div id="videoContainer" v-if="!showProgress">
                                         <el-button id="selectVideo" type="primary">选择视频<i class="el-icon-upload el-icon--right"></i></el-button>
                                        
                                  </div>

                                  <div class="video-progress" v-if="showProgress">
                                      <el-progress :text-inside="true" :stroke-width="15" :percentage="videoProgress"></el-progress>
                                            <div >
                                                <br>
                                            </div>
                                        <img :src="options.iconsrc" alt="" @click="pauseUpload" class="myicon">  
                                  </div>
                               
                                </el-form-item>
                                <el-form-item label="测试按钮"  >
                                    <button @click="testBtn">测试按钮</button>
                                </el-form-item>

                        </el-form>
                </el-col>
             <el-col :span="10" :push="2">

                    <h3>选项</h3>
                    <el-form :model="video" :rules="rules"  ref="videoForm2" label-width="100px" class="demo-ruleForm">
                            <el-form-item label="视频类别" prop="v_class">
                                  <el-select v-model="video.v_class" placeholder="请选择">
                                        <el-option
                                        v-for="item in this.$store.getters.navForVideoClass"
                                        :key="item.nav_id"
                                        :label="item.nav_text"
                                        :value="item.nav_id">
                                        </el-option>
                                 </el-select>
                            </el-form-item>
                        <el-form-item label="视频标签" prop="v_class">
                                        <input-tag  :tags="video.v_tags" placeholder="输入标签"></input-tag>
                        </el-form-item>
                        <el-form-item label="是否收费" prop="v_isfree">
                            <el-radio class="radio" v-model="video.v_mode" label="free">免费</el-radio>
                            <el-radio class="radio" v-model="video.v_mode" label="pay">收费</el-radio>
                    </el-form-item>
                        <el-form-item label="收费金额" prop="v_money">
                            <el-input v-model="video.v_money" placeholder="输入0到500之间的正整数" v-bind:disabled="showMoneyText"></el-input>

                        </el-form-item>

                        <el-form-item   >
                            <el-button type="danger" size="large" @click="submitVideo">发布视频</el-button>
                        </el-form-item>
                        </el-form>
            </el-col>
            </el-row>
    </div>
</template>
<style>
    h3{
        color: #5e6d82;
        margin-bottom: 15px;
    }
    .vue-input-tag-wrapper .input-tag{
        border-radius: 10px!important;
        color: #fff!important;
        background: #0082e6!important    
      
    }
    .vue-input-tag-wrapper .input-tag .remove:before{
        color: #ffffff!important;
    }
    .video-progress{
        margin-top: 8px;
    }
    .myicon{
        width: 20px;
        margin-top: 5px;
        cursor: pointer;
    }
</style>

<script>
import inputTag from 'vue-input-tag'
export default {

  mounted () {
      var myVue = this;
      this.uploader = Qiniu.uploader({
      runtimes: 'html5,flash,html4',      // 上传模式，依次退化
      browse_button: 'selectVideo',         // 上传选择的点选按钮，必需
      // 在初始化时，uptoken，uptoken_url，uptoken_func三个参数中必须有一个被设置
      // 切如果提供了多个，其优先级为uptoken > uptoken_url > uptoken_func
      // 其中uptoken是直接提供上传凭证，uptoken_url是提供了获取上传凭证的地址，如果需要定制获取uptoken的过程则可以设置uptoken_func
      // uptoken : '<Your upload token>', // uptoken是上传凭证，由其他程序生成
       uptoken_url: 'http://127.0.0.1:9090/video/uptoken',         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
      // uptoken_func: function(){    // 在需要获取uptoken时，该方法会被调用
      //    // do something
      //    return uptoken; 
      // },
      get_new_uptoken: false,             // 设置上传文件的时候是否每次都重新获取新的uptoken
      // downtoken_url: '/downtoken',
      // Ajax请求downToken的Url，私有空间时使用，JS-SDK将向该地址POST文件的key和domain，服务端返回的JSON必须包含url字段，url值为该文件的下载地址
      // unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
       save_key: true,                  // 默认false。若在服务端生成uptoken的上传策略中指定了sava_key，则开启，SDK在前端将不对key进行任何处理
      domain: '77talk',     // bucket域名，下载资源时用到，必需
      container: 'videoContainer',             // 上传区域DOM ID，默认是browser_button的父元素
      max_file_size: '500mb',             // 最大文件体积限制
      flash_swf_url: '../plupload/Moxie.swf',  //引入flash，相对路径
      max_retries: 3,                     // 上传失败最大重试次数
      dragdrop: true,                     // 开启可拖曳上传
      drop_element: 'videoContainer',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
      chunk_size: '1mb',                  // 分块上传时，每块的体积
      auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
      //x_vars : {
      //    查看自定义变量
      //    'time' : function(up,file) {
      //        var time = (new Date()).getTime();
                // do something with 'time'
      //        return time;
      //    },
      //    'size' : function(up,file) {
      //        var size = file.size;
                // do something with 'size'
      //        return size;
      //    }
      //},
        filters: {
            mime_types : [ //只允许上传图片和zip文件
                { title : "图片文件", extensions : "jpg,gif,png" },
            ],
        },
      init: {
          'FilesAdded': function(up, files) {
              plupload.each(files, function(file) {
                  // 文件添加进队列后，处理相关的事情
              });
          },
          'BeforeUpload': function(up, file) {
                 // 每个文件上传前，处理相关的事情
                  myVue.showProgress = true;
          },
          'UploadProgress': function(up, file) {
                 // 每个文件上传时，处理相关的事情

                myVue.videoProgress = file.percent;
          },
          'FileUploaded': function(up, file, info) {
     
               
                 // 每个文件上传成功后，处理相关的事情
                 // 其中info.response是文件上传成功后，服务端返回的json，形式如：
                 // {
                 //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                 //    "key": "gogopher.jpg"
                 //  }
                 // 查看简单反馈
                 // var domain = up.getOption('domain');
                 // var res = parseJSON(info.response);
                 // var sourceLink = domain +"/"+ res.key; 获取上传成功后的文件的Url
                        // var res = parseJSON(info);
                        // myVue.video.v_videokey=res.key; //这一步需要设置，否则上传后获取不到值

                   
                        var res = eval("("+info.response+")")
                     
                        myVue.video.v_videokey=res.key; //这一步需要设置，否则上传后获取不到值
              
          },
          'Error': function(up, err, errTip) {
                 //上传出错时，处理相关的事情
          },
          'UploadComplete': function() {
                            // console.log(up);
       
            
                 //队列文件处理完毕后，处理相关的事情
                 myVue.showProgress = false;
          },
          'Key': function(up, file) {
              // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
              // 该配置必须要在unique_names: false，save_key: false时才生效
              var key = "";
              // do something with key here
              return key
          }
      }
  });
  },
  data(){
    let moneyValidator = (rule, value, callback) => {
                //视频金额验证
                 let isValidate=false
                if(/\d+/.test(value) && value>=0 && value<=500)
                {
                    callback();
                }
                else
                {
                    callback(new Error('请输入0~500之间的数字'));
                }

    };
      return {
          uploader:null,
          options:{
              iconsrc:"/icons/pause.png",
              uploadpause:"/icons/pause.png",
              uploadstart:"/icons/start.png",
          },
          video:{
              v_title:"",
              v_class:"2",
              v_pic:{
                  name:'',
                  url:"",
                  id:0
              },
              v_money:0,
              v_tags:[],
              v_mode:"free", //是否收费费用 ,如果是0代表免费,反之则收费
              v_videokey:"" //上传到七牛后的key
          },
         dialogVisible: false,
         dialogImageUrl: '',
         videoProgress:0,
         showProgress:false,
        rules: {
                    v_title: [
                        { required: true, message: '视频标题必填', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20个字符', trigger: 'blur' }
                    ],
                    v_intr: [
                        { required: true, message: '视频简介必填', trigger: 'blur' },
                        { min: 1, max: 30, message: '长度在 1 到 30个字符', trigger: 'blur' }
                    ],
                    v_money: [
                        { validator: moneyValidator, trigger: 'blur' }
                    ],

        }
      }
  },
  methods: {
      handleSuccess(file){
            console.log(file);
          //响应成功
            if(file.status==1){
                this.video.v_pic.url = file.url;
                this.video.v_pic.name = file.name;
                this.video.v_pic.id = file.id;
            }else{
                alert('上传失败，请重启上传！');
            }
        
      },
      handlePreview(file){
          //预览
        this.dialogVisible = true;
        this.dialogImageUrl = this.video.v_pic.url;
      },
      handleRemove(file){
          //移除图片
     
        this.video.v_pic.url ='';
        this.video.v_pic.name ='';
      


      },
      testBtn(){
          alert(this.video.v_tags);
      },
    submitVideo()
        {
            
              this.$refs.videoForm1.validate((v1)=>{
                  if(v1){
                      this.$refs.videoForm2.validate((v2)=>{

                          if(v2){
                  
                              if(this.video.v_videokey=="" || this.video.v_pic.id==0) //粗糙的做个判断
                               {
                                 alert("请上传视频封面和视频");
                               }else
                                {
                    
                                    //这里可以 入库了
                                        this.$store.dispatch("submitVideo",this.video);
                                }
                          }else{
                                 alert("请正确填写视频信息");
                          }
                      })
                  }else{
                         alert("请正确填写视频信息");
                  }
              });
            // this.$refs.videoForm1.validate(function(v1){
            //     if(v1) //如果验证第一个表单完成，还要验证第二个表单
            //     {
            //         this.$refs.videoForm2.validate(function(){
            //             if(v2)  //第二个验证完成，还需要判断对象里的值是否有
            //             {
            //                 if(video.v_videokey=="" || video.v_pic.id==0) //粗糙的做个判断
            //                 {
            //                     alert("请上传视频封面和视频");
            //                 }
            //                 else
            //                 {
            //                     //这里可以 入库了
            //                         myvue.$store.dispatch("submitVideo",myvue.video);
            //                 }
            //             }
            //             else
            //             {
            //                 alert("请正确填写视频信息")
            //             }
            //         })
            //     }
            //     else
            //     {
            //         alert("请正确填写视频信息")
            //     }
            // })
    },
      pauseUpload(){

          if(this.options.iconsrc==this.options.uploadpause){
            this.uploader.stop();
             //如果是暂停 
             this.options.iconsrc=this.options.uploadstart//改成开始图标
          }else{
              
                 this.uploader.start();
               this.options.iconsrc=this.options.uploadpause;
        
          }
      }
  },
computed:{
    showMoneyText()
    {
        if(this.video.v_mode=="free")
        {
            this.video.v_money=0;
            return true;
        }
        return false;
    }
},
  components:{
      "input-tag":inputTag
  }
}
</script>

