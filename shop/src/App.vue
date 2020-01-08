<template>
 <div id="app">
   <img alt="Vue logo" src="./assets/logo.png">
  <div>
  <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand to="/">Shop</b-navbar-brand>
    <b-nav-text>Added to cart {{cartLength}}</b-nav-text>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item to="/products">Products</b-nav-item>
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <b-nav-item right>
          <b-nav-item to="/cart">Cart</b-nav-item>
        </b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
<br>
  <router-view></router-view>
  
 </div>
</template>

<script>
import Products from './components/Products.vue'
import ProductFilter from './components/ProductFilter.vue'
import { mapGetters } from 'vuex'
export default {
 name: 'app',
 data() {
   return {

   }
 },
 components: {
  //  Products,
 },
 methods: {
   ...mapGetters('cart',{
     getNumberOfCartItems: 'returnCartLength'
   })
 },
 computed:{
   cartLength() {
    //  let number = 
     return this.getNumberOfCartItems();
   }
 }
}
</script>
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
