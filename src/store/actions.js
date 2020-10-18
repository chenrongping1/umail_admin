export const actions={
    reqUserInfo(store,info){
        store.commit('changeUserInfo',info);
    }
}