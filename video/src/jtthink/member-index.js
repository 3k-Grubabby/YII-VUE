/**
 * Created by Administrator on 2016/12/16.
 */

import Vue from "vue";
import Vuex from "vuex";
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css'
import global from "./global.js";//全局插件
import navbar from "./../components/member/navbar.vue";//加载导航栏
import "./../css/common.css";
import VueResource from "vue-resource";
import {RouterConfig} from "./../config/RouterConfig";

require("qiniu-js/dist/qiniu.min.js");

//引用路由
import VueRouter from "vue-router";
Vue.use(VueRouter);

Vue.use(Vuex);
Vue.use(ElementUI);
Vue.use(global);
Vue.use(VueResource);

import ResModule from "./../Store/modules/resModules"; //引用资源模块
import VideoModule from "./../Store/modules/VideoModule";//视频提交模块
import UserModule from "./../Store/modules/UserModule"; //引用用户模块
const vuex_config= new Vuex.Store({
    modules:{
        res:ResModule,
        video:VideoModule,
        users:UserModule
    }
});


Vue.component("navbar",navbar);

new Vue({
    el: '.container',
    store:vuex_config,
    router:RouterConfig //设置路由

})