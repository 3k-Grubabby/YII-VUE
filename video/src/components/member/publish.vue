<template>
    <div>
            <el-row>
                <el-col :span="12">
                    <h3>视频基本信息</h3>
                        <el-form ref="video" :model="video" label-width="80px">
                            <el-form-item label="活动名称" prop="v_title">
                                <el-input v-model="video.v_title" placeholder="请填写视频标题"></el-input>
                            </el-form-item>

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
                                   
                                <el-dialog :visible.sync="dialogVisible" size="small">
                                <img width="100%" :src="dialogImageUrl" alt="">
                                </el-dialog>

                              </el-form-item>   

                        </el-form>
                </el-col>
                <el-col :span="12">

                </el-col>
            </el-row>
    </div>
</template>
<style>
    h3{
        color: #5e6d82;
        margin-bottom: 15px;
    }
</style>

<script>
export default {
  
  data(){
      return {
          video:{
              v_title:"",
              v_class:"2",
              v_pic:{
                  name:'',
                  url:""
              }
          },
         dialogVisible: false,
         dialogImageUrl: '',
      }
  },
  methods: {
      handleSuccess(file){
          //响应成功
            if(file.status==1){
                this.video.v_pic.url = file.url;
                this.video.v_pic.name = file.name;
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
      


      }

  }
}
</script>

