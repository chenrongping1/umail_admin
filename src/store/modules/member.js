import { reqMemberList } from "../../untils/request"
const state = {
    list: [],
}

const mutations = {
    //修改菜单list
    changeList(state, arr) {
        state.list = arr
    },


}
const actions = {
    requestList(context) {
        //缓存
        /*  if (context.state.list.length > 0) {
             return;
         } */
         reqMemberList().then(res => {
            context.commit("changeList", res.data.list)
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