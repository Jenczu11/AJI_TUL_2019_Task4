<template>
<div>
 
<div class="row">
<div class="col-md-4 order-md-1 mb-4">
    <ProductFilter :kategorie="kategorie" v-on:chosenFilter="filterProductByString"/>
</div>
 <div class="col-md-8 order-md-2">
   <table class="table">
     <thead class="thead-dark">
       <tr>
           <th scope="col">Name</th>
           <th scope="col">Description</th>
           <th scope="col">Price</th>
           <th scope="col">Kategoria towaru</th>
          <th scope="col"></th>
          <th v-if="admin" scope="col"></th>
       </tr>
     </thead>
    
       <tr v-for="product in filtered" v-bind:key="product.name">
           <td>{{product.nazwa}}</td>
           <td>{{product.opis}}</td>
           <td>{{product.cena_jednostkowa.toFixed(2)}}</td>
           <td>{{product.kategoria_towaru}}</td>
           <td><button class="btn btn-outline-success" v-on:click="addProductToCart(product)">Add to Cart</button></td>
           <td v-if="admin"><router-link class="btn btn-outline-warning" v-bind:to="'/products/'+product.id">Details</router-link></td>
       </tr>
   </table>
   </div>
</div>
</div>
</template>

<script>
/* eslint-disable vue/no-unused-components */
import axios from 'axios';
import ProductFilter from "@/components/ProductFilter"
import Alert from "@/components/Alert"
import _ from "lodash";
import { mapState, mapActions } from 'vuex'

export default {
   name: 'Products',
   components: {ProductFilter,Alert},
//    props: ['cart'],
   data() {
       return {
           products: [],
           product_duplicate: [],
           kategorie: [],
           fromChild: {
               wybranaNazwa: '',
               wybranaKategoria: 'wszystkie'
           },
           alert: '',
           admin: true
       };
   },
   methods: 
   {
     ...mapActions('cart', [
    'addProductToCart'
  ]),
       getAllProdcuts: function() {
    axios
     .get('http://localhost:8081/products')
     .then(res => {
         this.products = res.data;
         this.product_duplicate = res.data;
         });
       },
       getAllCategories: function() {
           axios
     .get('http://localhost:8081/categories')
     .then(res => {
         this.kategorie = res.data;
         this.kategorie.unshift({"id": 'all', "nazwa": "wszystkie"});
         });
       },
      filterProductByString(value) {
         this.fromChild = value;
         console.log(value)
    },
   },
   created: function() {
    this.getAllCategories();
    this.getAllProdcuts();
   },
   computed: {
    filtered(){
  const kategorie = [...this.kategorie]
      let id;
      for (let x of kategorie)
      {
          if(x.nazwa===this.fromChild.wybranaKategoria)
          id=x.id;
      }
    let reg=""
    if(this.fromChild.wybranaNazwa!=""){
    let res = this.fromChild.wybranaNazwa.toLowerCase().split(" ");
    console.log(res)
    reg = "^";
    for(let x of res){
      reg=reg+"(?=.*"+x+")";
    }
    reg=reg+".*$";
    }
    console.log(reg);
    if(this.fromChild.wybranaKategoria !== 'wszystkie')
    {
    return this.products.filter(product => { return (product.nazwa.toString().toLowerCase().match(new RegExp(reg)) &&
    product.kategoria_towaru===id)})
    }
     return this.products.filter(product => { return (product.nazwa.toString().toLowerCase().match(new RegExp(reg)))})
   }
   
}
}
</script>
<style>
</style>