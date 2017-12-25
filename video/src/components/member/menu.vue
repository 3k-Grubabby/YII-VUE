<template>
  
      <el-menu
      default-active="2"
      class="el-menu-vertical-demo"
      :router='true'
        >

        <el-menu-item-group title="视频管理" class="menutitle">
          <el-menu-item index="/pub">发布视频</el-menu-item>
          <el-menu-item index="/vlist">视频列表</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="个人资料">
          <el-menu-item index="1-3">个人信息</el-menu-item>
            <el-menu-item index="1-4">修改密码</el-menu-item>
        </el-menu-item-group>
    </el-menu>
</template>
<style>

  .menutitle div{
    font-size: 20px;
  }
</style>

<script>
export default {
  
}
</script>
