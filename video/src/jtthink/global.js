import functions from "./functions.js";
import APIConfig from "./../config/APIConfig";
export default{
    install(Vue){
        Vue.prototype.functions = functions;
        Vue.prototype.APIConfig = APIConfig;
    }
}