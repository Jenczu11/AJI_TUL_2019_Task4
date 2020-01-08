import Vue from 'vue'
import Vuex from 'vuex'
import cart from './modules/cart'
// import products from './modules/products'
// import createLogger from '../../../src/plugins/logger'

Vue.use(Vuex)
Vue.config.devtools = true
const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
modules: {
    cart
  },
  strict: debug,
//   plugins: debug ? [createLogger()] : []
})