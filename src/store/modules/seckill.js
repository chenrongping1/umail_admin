import { reqSeckillList } from "../../untils/request"
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
      /*    if (context.state.list.length > 0) {
             return;
         } */

         reqSeckillList().then(res => {
            //  console.log('list',res.data.list)
           res.data.list.forEach(val => {
                val.date=[];
                val.date[0]=val.begintime;
                val.date[1]=val.endtime;   
             });
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