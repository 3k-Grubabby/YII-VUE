<template>
    <div>
        <el-row>
            <el-col :span="18">
                <el-menu theme="light" default-active="/" class="el-menu-demo" mode="horizontal"  >
                    <el-menu-item :index="item.nav_url"
                                  v-for="item in this.$store.state.res.NavBar"
                    >{{item.nav_text}}</el-menu-item>
                </el-menu>
            </el-col>
            <el-col :span="6">
                <el-menu theme="light" default-active="/" class="el-menu-demo" mode="horizontal"  >
                    <el-menu-item   >
                        <a href="#"  @click="userLoginAndReg" class="user_link">用户登录/注册</a>
                    </el-menu-item>
                </el-menu>
            </el-col>

        </el-row>
    </div>
</template>
<style>
     .header_img{width:30px;border-radius: 50%;margin-top: 50%}
    .user_link{color:#475669; font-size: 14px;text-decoration: none}
</style>
<script >

    export default{
        created(){
            alert(this.$store.state.users.CurrentUser.UserName)
            this.$store.dispatch("loadData",{url:this.APIConfig.API_NavBar,key:"NavBar"})
        },
        data(){
            return{

            }
        },
        methods:{
            userLoginAndReg()
            {
                //这里其实未来可以做 判断用户是否登录的 代码
                self.location="/user/";
            }
        }
    }
</script>
