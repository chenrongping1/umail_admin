// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

//引入elememtUI
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';


//引入重置样式表
import './assets/css/reset.css'

//filters
import './filters/index'

//公共组件
import './components/index'

//store
import store from './store/index'

//引入axios
import './untils/alert.js'

//引入弹框
import './untils/alert'



Vue.use(ElementUI);


// Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    components: { App },
    template: '<App/>',
    store
})