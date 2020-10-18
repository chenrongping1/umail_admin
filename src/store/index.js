import Vue from "vue"
import Vuex from "vuex"
Vue.use(Vuex)



import {actions} from "./actions"
import { state, getters, mutations } from "./mutations"
import list from  './modules/list'
import role from './modules/roleList'
import manager from './modules/manager'
import type from './modules/type'
import specs from './modules/specs'
import member from './modules/member'
import banner from './modules/banner'
import goods from './modules/goods'
import seckill from './modules/seckill'
export default new Vuex.Store({
    //state 状态
    state,
    //修改state
    mutations,
    //组件派发的动作
    actions,
    //导出数据
    getters,

    //模块
    modules: {
        list,
        role,
        manager,
        type,
        specs,
        member,
        banner,
        goods,
        seckill
    }
})