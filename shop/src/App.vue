<template>
 <div id="app">
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
 <a class="navbar-brand"> <router-link to="/">Shop</router-link></a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link"><router-link to="/products">Products</router-link></a>
      </li>
      <li class="nav-item">
        <a class="nav-link"><router-link to="/about">About</router-link></a>
      </li>
      <li class="nav-item">
     <a class="nav-link"><router-link to="/cart">Go to Cart</router-link></a>
    </li>
    </ul>
    <span>Number of diffrent items in cart: {{cartLength}}</span>
  </div>
</nav>
  <router-view></router-view>
    <footer class="footer mt-auto py-3 text-muted text-center text-small">
        <p class="mb-1">&copy; 2019 bjencz</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
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
  margin-top: 0px;
  background-color: #f8f9fa!important;
  
}
nav {
  margin-bottom: 60px;
}
</style>
