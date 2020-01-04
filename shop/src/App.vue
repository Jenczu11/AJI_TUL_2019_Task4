<template>
 <div id="app">
   <img alt="Vue logo" src="./assets/logo.png">
   <Products :cart="cart"/>

 </div>
</template>

<script>
import Products from './components/Products.vue'
import ProductFilter from './components/ProductFilter.vue'
export default {
 name: 'app',
 data() {
   return {
     cartValue: 0,
     cart: []
   }
 },
 components: {
   Products,
 }
}
</script>
<style>
@import "../node_modules/bootstrap/dist/css/bootstrap.min.css";
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
