import { reqMenuList } from "../../untils/request"
const state = {
    list: [],
}

const mutations = {
    //修改菜单list
    changeMenuList(state, arr) {
        state.list = arr
    },


}
const actions = {
    requestMenuList(context) {
        //缓存
        /*  if (context.state.list.length > 0) {
             return;
         } */
        reqMenuList().then(res => {
            context.commit("changeMenuList", res.data.list)
        })
    },

}

const getters = {

    list(state) {
        return state.list
    },

}

export default {
    state,
    mutations,
    actions,
    getters,
    namespaced: true
}