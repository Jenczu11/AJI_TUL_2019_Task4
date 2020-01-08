import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import Products from './components/Products'
import Home from './components/Home'
import Cart from './components/Cart'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import store from './store'
import Vuex from 'vuex'

Vue.use(Vuex)

Vue.use(BootstrapVue)


Vue.config.productionTip = false
Vue.use(VueRouter);
const routes = [
  {path: '/products', component: Products},
  {path: '/', component: Home},
  {path: '/cart', component: Cart}
]
const router = new VueRouter({
  routes,
  mode: "history"
});
new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
