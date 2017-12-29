import Vue from "vue";
export default{
    state:{
            CurrentUser:{
                get UserName(){
                    let getUName =  localStorage.getItem('CurrentUser_Name');
                    if(getUName==null || getUName==undefined)
                        return "guest";
                        return getUName;
                },
                get UserToken(){
                    return localStorage.getItem('CurrentUser_Token');
                }
            }
    },
    mutations:{
        setUser(state,{user_name,user_token,success}){
            localStorage.setItem("CurrentUser_Name",user_name);
            localStorage.setItem("CurrentUser_Token",user_token);
            success();

        }

    },
    actions:{
        userLogin(context,{user_name,user_pass,success}){
            Vue.http.get('http://127.0.0.1:9090/token?client_appid='+user_name+'&client_appkey='+user_pass).then(
                (res)=>{
                    if(res!=null && res.body!=undefined && "access-token" in res.body){
                        if(res.body['access-token']!=""){
                         
                            //后端API验证通过
                            context.commit("setUser",{user_name:user_name,"user_token":res.body['access-token'],success});
                        }else{
                            alert('用户名密码错误！');
                        }
                    }else{
             
                        alert('用户名密码错误');
                    }
                },(res)=>{
                    alert('用户名密码错误');
                }
            )
        },
        userUnlog(context,callback){
            var getToken = context.state.CurrentUser.UserToken;
     
            if(getToken!=''){
                Vue.http.get('http://localhost:9090/user/unlog?access-token='+getToken).then((res)=>{
                    if(res.body.status=="success"){
                        localStorage.removeItem('CurrentUser_Name');
                        localStorage.removeItem('CurrentUser_Token');
                        callback();
                    }
                },(res)=>{})
            }
           
        }
    }
}