import axios from 'axios'
import qs from 'qs'
import Vue from 'vue'
import router from '../router'
import store from '../store'
import {warningAlert}from './alert'
Vue.prototype.$imgUrl='http://localhost:3000'
let baseUrl = '/api'


axios.interceptors.request.use(req=>{
    req.headers.authorization=store.state.userInfo.token;
    return req
})


axios.interceptors.response.use(res => {
/*     console.group('=========本次请求的地址是' + res.config.url)

    console.log(res)
    console.groupEnd(); */
    if(res.data.msg=='登录已过期或访问权限受限'){
        warningAlert(res.data.msg)
        router.push('/login')
        return
    }
    return res;

})



//获取列表
export const reqMenuList = () => {
    return axios({
        url: baseUrl + '/api/menulist',
        params:{
            istree:true
        }
    })
}

//添加列表
export const reqAddList = (addlist) => {
    return axios({
        url: baseUrl + '/api/menuadd',
        method: 'post',
        data: qs.stringify(
            addlist
        )

    })
}


//编辑列表
export const reqEditList = (editlist) => {
    return axios({
        url: baseUrl + '/api/menuedit',
        method: 'post',
        data: qs.stringify(
            editlist
        )

    })
}


//获取一条列表
export const reqOneList = (id) => {
    return axios({
        url: baseUrl + '/api/menuinfo',
        params: {
            id
        }
    })
}

//删除
export const reqDelList = (id) => {
    return axios({
        url: baseUrl + '/api/menudelete',
        method: 'post',
        data: qs.stringify({ id })

    })
}



//-----角色-------



//获取列表
export const reqRoleList = () => {
    return axios({
        url: baseUrl + '/api/rolelist',
        params:{
            istree:true
        }
    })
}

//添加列表
export const reqRoleAddList = (addRole) => {
    return axios({
        url: baseUrl + '/api/roleadd',
        method: 'post',
        data: qs.stringify(
            addRole
        )

    })
}


//编辑列表
export const reqRoleEditList = (roleEditlist) => {
    return axios({
        url: baseUrl + '/api/roleedit',
        method: 'post',
        data: qs.stringify(
            roleEditlist
        )

    })
}


//获取一条列表
export const reqRoleOneList = (id) => {
    return axios({
        url: baseUrl + '/api/roleinfo',
        params: {
            id
        }
    })
}

//删除
export const reqRoleDelList = (id) => {
    return axios({
        url: baseUrl + '/api/roledelete',
        method: 'post',
        data: qs.stringify({ id })

    })
}


//-------管理员----

//管理员添加
export const reqUserAdd = (params) => {
    return axios({
        url: baseUrl + '/api/useradd',
        method:'post',
        data:qs.stringify(params)
    })
}

//管理员总数
export const reqUserCount = () => {
    return axios({
        url: baseUrl + '/api/usercount',
    })
}


//管理员列表（分页）** 
export const reqUserPage = (size,page) => {
    return axios({
        url: baseUrl + '/api/userlist',
     params: {
         size,
         page,
     }

    })
}


//获取一条管理员列表
export const reqUserInfo = (uid) => {
    return axios({
        url: baseUrl + '/api/userinfo',
        params: {
            uid
        }
    })
}

//管理员修改
export const reqUserEditList = (params) => {
    return axios({
        url: baseUrl + '/api/useredit',
        method: 'post',
        data: qs.stringify( params )

    })
}

//管理员删除
export const reqUserDel = (uid) => {
    return axios({
        url: baseUrl + '/api/userdelete',
        method: 'post',
        data: qs.stringify( {uid})

    })
}

export const reqLogin = (params) => {
    return axios({
        url: baseUrl + '/api/userlogin',
        method: 'post',
        data: qs.stringify(params)
    })
}


//-------分类----

//分类添加
export const reqCateAdd = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i]);
    }
    return axios({
        url: baseUrl + '/api/cateadd',
        method:'post',
        data:data,
    })
}

//商品分类列表
export const reqCateList = (params) => {
    return axios({
        url: baseUrl + '/api/catelist',
        params:params
    })
}





//获取一条商品分类列表
export const reqCateInfo = (id) => {
    return axios({
        url: baseUrl + '/api/cateinfo',
        params: {
            id
        }
    })
}

//商品分类修改
export const reqCateEditList = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i]);
    }
    return axios({
        url: baseUrl + '/api/cateedit',
        method: 'post',
        data: data

    })
}

//商品分类删除
export const reqCateDel = (id) => {
    return axios({
        url: baseUrl + '/api/catedelete',
        method: 'post',
        data: qs.stringify({id})

    })
}


//-------规格----

//规格添加
export const reqSpecsAdd = (params) => {
    return axios({
        url: baseUrl + '/api/specsadd',
        method:'post',
        data:qs.stringify(params),
    })
}

//规格列表
export const reqSpecsList = (params) => {
    return axios({
        url: baseUrl + '/api/specslist',
        params:params
    })
}





//获取一条规格列表
export const reqSpecsInfo = (id) => {
    return axios({
        url: baseUrl + '/api/specsinfo',
        params: {
            id
        }
    })
}

//规格修改
export const reqSpecsEditList = (params) => {

    return axios({
        url: baseUrl + '/api/specsedit',
        method: 'post',
        data: params

    })
}

//规格删除
export const reqSpecsDel = (id) => {
    return axios({
        url: baseUrl + '/api/specsdelete',
        method: 'post',
        data: qs.stringify({id})

    })
}

//规格总数
export const reqSpecsCount = () => {
    return axios({
        url: baseUrl + '/api/specscount',
    })
}



//-------商品管理----

//商品添加
export const reqGoodsAdd = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i])
    }
    return axios({
        url: baseUrl + '/api/goodsadd',
        method:'post',
        data:data,
    })
}

//商品列表
export const reqGoodsList = (params) => {
    return axios({
        url: baseUrl + '/api/goodslist',
        params:params
    })
}





//获取一条商品列表
export const reqGoodsInfo = (id) => {
    return axios({
        url: baseUrl + '/api/goodsinfo',
        params: {
            id
        }
    })
}

//商品修改
export const reqGoodsEditList = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i])
    }
    return axios({
        url: baseUrl + '/api/goodsedit',
        method: 'post',
        data: data

    })
}

//商品删除
export const reqGoodsDel = (id) => {
    return axios({
        url: baseUrl + '/api/goodsdelete',
        method: 'post',
        data: qs.stringify({id})

    })
}

//商品总数
export const reqGoodsCount = () => {
    return axios({
        url: baseUrl + '/api/goodscount',
    })
}


//------会员管理----------
export const reqMemberList=()=>{
    return axios({
        url:baseUrl+'/api/memberlist'
    })
}

export const reqMemberInfo=(uid)=>{
    return axios({
        url:baseUrl+'/api/memberinfo',
        params:{uid}
    })
}

export const reqMemberEdit=(params)=>{
    return axios({
        url:baseUrl+'/api/memberedit',
        method:'post',
        data:qs.stringify(params)
    })
}


//-------轮播图管理----

//轮播添加
export const reqBannerAdd = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i])
    }
    return axios({
        url: baseUrl + '/api/banneradd',
        method:'post',
        data:data,
    })
}

//轮播图列表
export const reqBannerList = () => {
    return axios({
        url: baseUrl + '/api/bannerlist',
        params:{

        }
    })
}





//获取一条轮播列表
export const reqBannerInfo = (id) => {
    return axios({
        url: baseUrl + '/api/bannerinfo',
        params: {
            id
        }
    })
}

//轮播图修改
export const reqBannerEditList = (params) => {
    let data=new FormData();
    for(let i in params){
        data.append(i,params[i])
    }
    return axios({
        url: baseUrl + '/api/banneredit',
        method: 'post',
        data: data

    })
}

//轮播图删除
export const reqBannerDel = (id) => {
    return axios({
        url: baseUrl + '/api/bannerdelete',
        method: 'post',
        data: qs.stringify({id})

    })
}


//----秒杀-------


//秒杀添加
export const reqSeckillAdd = (data) => {

    return axios({
        url: baseUrl + '/api/seckadd',
        method:'post',
        data:qs.stringify(data),
    })
}

//秒杀列表
export const reqSeckillList = () => {
    return axios({
        url: baseUrl + '/api/secklist',
        params:{
    }})
}





//获取一条秒杀列表
export const reqSeckillInfo = (id) => {
    return axios({
        url: baseUrl + '/api/seckinfo',
        params: {
            id
        }
    })
}

//秒杀修改
export const reqSeckillEditList = (data) => {
    return axios({
        url: baseUrl + '/api/seckedit',
        method: 'post',
        data: qs.stringify(data)

    })
}

//秒杀删除
export const reqSeckillDel = (id) => {
    return axios({
        url: baseUrl + '/api/seckdelete',
        method: 'post',
        data: qs.stringify({id})

    })
}
