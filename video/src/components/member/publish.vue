<template>
    <div>
            <el-row>
                <el-col :span="12">
                    <h3>视频基本信息</h3>
                        <el-form ref="video" :model="form" label-width="80px">
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
              v_class:"2"
          }
      }
  }
}
</script>

