import VueRouter from "vue-router";
import memberindex from "./../components/member/index.vue";
import vpublish from "./../components/member/publish.vue";
import vlist from "./../components/member/vlist.vue";

    


//前台用户管理页面
export const RouterConfig = new VueRouter({
    routes:[
        {path:'/',component:memberindex ,name:'memberindex',
        children:[
            {path:'/pub',component:vpublish,name:'pub'},
            {path:'/vlist',component:vlist,name:'vlist'}
        ]
    }
    ]
});

//以下为用户登录相关组件
import useraction from "./../components/users/useraction.vue";
import userlogin from   "./../components/users/userlogin.vue";

export const routerConfig_users = new VueRouter({
    routes:[
        {path:"/",component:useraction,name:"useraction",
            children:[
                {path:'',component:userlogin,name:"userlogin"}
            ]
        }
    ]
})