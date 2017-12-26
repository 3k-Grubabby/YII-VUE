import Vue from "vue";
export default{

    state: {
        NavBar:[]//导航栏
    },
    mutations: {
        setData(state,{key,data}){ //更改 state的通用函数
            state[key] = data;

          
        }
    },
    actions: {
        loadData(context,{url,key}){//params是一个对象函数，里面包含URl（api地址） 属性名
            Vue.http.get(url).then((res)=>{
               context.commit("setData",{key,data:res.body});
            },(res)=>{
          
            })
        } 
    },
    getters:{
        navForVideoClass:(state)=>{
            return state.NavBar.filter((item)=>{
                    return item.nav_text!='首页';
            })
        }
    }
}