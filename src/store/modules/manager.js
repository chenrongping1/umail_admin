import { reqUserPage,reqUserCount } from "../../untils/request"
const state = {
    list: [],
    page:1,
    total:0,
    size:2,
}

const mutations = {
    //修改菜单list
    changeUserList(state, arr) {
        state.list = arr
    },
    //改变页数
    changeUserPage(state, page) {
        state.page = page
    },
      //改变总数
      changeUserCount(state, total) {
        state.total = total
    },

}
const actions = {
    requestUserList(context) {
        //缓存
        /*  if (context.state.list.length > 0) {
             return;
         } */
         reqUserPage(context.state.size,context.state.page).then(res => {

            let list=res.data.list?res.data.list:[];
            if(context.state.page>1 && list.length==0){
                context.dispatch('changeUserPage',context.state.page-1)
                return
            }

            context.commit("changeUserList", list)

        })
    },

    //通知改变页数
    changeUserPage(context,e) {
  
            context.commit("changeUserPage", e)
            context.dispatch('requestUserList')
    },
    //总数
    requestUserCount(context) {
        //缓存
        /*  if (context.state.list.length > 0) {
             return;
         } */
         reqUserCount().then(res => {
            context.commit("changeUserCount", res.data.list[0].total)

        })
    },

}

const getters = {

    list(state) {
        return state.list
    },
    page(state) {
        return state.page
    },
    total(state) {
        return state.total
    },
    size(state) {
        return state.size
    },
}

export default {
    state,
    mutations,
    actions,
    getters,
    namespaced: true
}