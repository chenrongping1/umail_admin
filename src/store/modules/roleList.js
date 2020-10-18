import { reqRoleList } from "../../untils/request"
const state = {
    list: [],
}

const mutations = {
    //修改菜单list
    changeRoleList(state, arr) {
        state.list = arr
    },


}
const actions = {
    requestRoleList(context) {
        //缓存
        /*  if (context.state.list.length > 0) {
             return;
         } */
        reqRoleList().then(res => {
            context.commit("changeRoleList", res.data.list)
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