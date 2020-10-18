import Vue from 'vue'
import Router from 'vue-router'
import store from '../store'

Vue.use(Router)



function checkedEnter(path,next){
      let menus_url=store.state.userInfo.menus_url;
      if(menus_url.includes(path)){
          console.log('s',menus_url)
        next();
        return;
      }
      next('/');
}

export let indexRoutes = [
    { path: 'menu', name: '菜单列表', component: () =>
            import ('../pages/menu/menu.vue'),
        beforeEnter(to,from,next){
            checkedEnter('/menu',next)
        }
        },
    { path: 'role', name: '角色列表', component: () =>
            import ('../pages/role/role.vue'),
            beforeEnter(to,from,next){
                checkedEnter('/role',next)
            }
        
        },
    { path: 'manager', name: '管理员列表', component: () =>
            import ('../pages/manager/manager.vue'),
            beforeEnter(to,from,next){
                checkedEnter('/manager',next)
            }
        },

    { path: 'seckill', name: '秒杀活动', component: () =>
            import ('../pages/seckill/seckill.vue') ,
            beforeEnter(to,from,next){
                checkedEnter('/seckill',next)
            }
        },
    { path: 'type', name: '分类管理', component: () =>
            import ('../pages/type/type.vue'),
            beforeEnter(to,from,next){
                checkedEnter('/type',next)
            }
         },
    { path: 'member', name: '会员管理', component: () =>
            import ('../pages/member/member.vue'),
            beforeEnter(to,from,next){
                checkedEnter('/member',next)
            }
        },
    { path: 'specs', name: '规格管理', component: () =>
            import ('../pages/specs/specs.vue') ,
            beforeEnter(to,from,next){
                checkedEnter('/specs',next)
            }
        },
    { path: 'banner', name: '轮播图管理', component: () =>
            import ('../pages/banner/banner.vue') ,
            beforeEnter(to,from,next){
                checkedEnter('/banner',next)
            }
        },
    { path: 'product', name: '商品管理', component: () =>
            import ('../pages/product/product.vue'),
            beforeEnter(to,from,next){
                checkedEnter('/product',next)
            }
        },
]

let router= new Router({
    routes: [{
            path: '/login',
            component: () =>
                import ('../pages/login/login.vue')
        },

        {
            path: '/',
            component: () =>
                import ('../pages/index/index.vue'),
            children: [
                { path: 'home', name: '首页', component: () =>
                        import ('../pages/home/home.vue'), 
            
                    },
                { path: '', redirect:'home'},
                ...indexRoutes
            ]
        },
    ]
})

router.beforeEach((to,from,next)=>{
   if(to.path=='/login'){
        next();
        return;
   }
   if(store.state.userInfo.token){
        next();
        return;
   }
   next('/login')
}) 

export default router;