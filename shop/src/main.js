import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'

import store from './store'
import Vuex from 'vuex'
// Bootstrap
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'

// Font Awesome
// https://medium.com/front-end-weekly/how-to-use-fon-awesome-5-on-vuejs-project-ff0f28310821
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

Vue.component('font-awesome-icon', FontAwesomeIcon)
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas)

import { dom } from '@fortawesome/fontawesome-svg-core'
dom.watch()
// Components
import Products from './components/Products'
import Home from './components/Home'
import Cart from './components/Cart'
import About from './components/About'
import Checkout from './components/Checkout'
import ProductDetail from './components/ProductDetail'
import ProductEdit from './components/ProductEdit'
// Vue.use
Vue.use(Vuex)

Vue.config.productionTip = false
// Vue router
Vue.use(VueRouter);
const routes = [
  {path: '/products', component: Products},
  {path: '/', component: Home},
  {path: '/cart', component: Cart},
  {path: '/about', component: About},
  {path: '/checkout', component: Checkout},
  {path: '/products/:id', component: ProductDetail},
  {path: '/edit/:id', component: ProductEdit}
]
const router = new VueRouter({
  routes,
  mode: "history"
});

/* eslint-disable no-new */
new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
