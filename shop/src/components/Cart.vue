<template>
<div id="Cart">
  <h1>Welcome to Cart</h1>
  <div class="row">
 <div class="col-md-9 order-md-2">
   <table>
       <tr>
           <th>Name</th>
           <th>Description</th>
           <th>Price</th>
           <th>Kategoria towaru</th>
       </tr>
       <tr v-for="product in filtered" v-bind:key="product.name">
           <td>{{product.nazwa}}</td>
           <td>{{product.opis}}</td>
           <td>{{product.cena_jednostkowa}}</td>
           <td>{{product.kategoria_towaru}}</td>
       </tr>
   </table>
   </div>
</div>
</div>
</template>

<script>
import { mapState, mapActions,mapGetters } from 'vuex'
export default {
  methods: {
   ...mapGetters('cart',{
     returnItems: 'returnItems'
   })
 },
 computed:{
   filtered() {
       console.log(this.returnItems())
     return this.returnItems();
   }
 }
}
</script>

<style>
#Cart
{margin-right: 60px;
margin-left: 60px}
</style>