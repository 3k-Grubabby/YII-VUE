<template>
<div id="outbox">
    <el-row>
      <el-col :span="3">
          <membermenu></membermenu>

      </el-col>
        <el-col :span="21">
            <router-view>

            </router-view>
          
      </el-col>
    </el-row>

</div>
</template>
<style>
  #outbox{
    width: 80%;
    margin: 50px auto;
  }

</style>
<script>
import membermenu from "./menu.vue";
export default {
  components:{
      membermenu
  }
}
</script>
