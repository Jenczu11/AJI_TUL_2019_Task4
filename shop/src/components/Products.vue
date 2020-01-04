<template>
<div class="row">
<div class="col-md-3 order-md-1 mb-4">
    <ProductFilter :kategorie="kategorie" v-on:chosenFilter="filterProductByString"/>
</div>
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
           <td><button class="btn btn-sm" v-on:click="addToCart(product)">Add to Cart</button></td>
       </tr>
   </table>
   </div>
</div>
</template>

<script>
import axios from 'axios';
import ProductFilter from "@/components/ProductFilter"
import _ from "lodash";
export default {
   name: 'Products',
   components: {ProductFilter},
   props: ['cart'],
   data() {
       return {
           products: [],
           product_duplicate: [],
           kategorie: [],
           fromChild: {
               wybranaNazwa: '',
               wybranaKategoria: 'wszystkie'
           }
       };
   },
   methods: {
       getAllProdcuts: function() {
    axios
     .get('http://127.0.0.1:8081/products')
     .then(res => {
         this.products = res.data;
         this.product_duplicate = res.data;
         });
       },
       getAllCategories: function() {
           axios
     .get('http://127.0.0.1:8081/categories')
     .then(res => {
         this.kategorie = res.data;
         this.kategorie.unshift({"id": 'all', "nazwa": "wszystkie"});
         });
       },
       addToCart(product){
           console.log(product)
           this.cart.push(product);
       },

      filterProductByString(value) {
         this.fromChild = value;
         console.log(value)


    //  return null
    }
  
    
       
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
