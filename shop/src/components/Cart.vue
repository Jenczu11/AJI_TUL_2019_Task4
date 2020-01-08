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
           <th>Ilość zakupionego towaru</th>
       </tr>
       <tr v-for="p in filtered" v-bind:key="p.product.nazwa">
           <td>{{p.product.nazwa}}</td>
           <td>{{p.product.opis}}</td>
           <td>{{p.product.cena_jednostkowa}}</td>
           <td>{{p.product.kategoria_towaru}}</td>
           <td>{{p.quantity}} <button v-on:click="addProductToCart(p.product)">+</button><button>-</button> </td>
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
   }),
    ...mapActions('cart', [
    'addProductToCart'
  ]),
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