<template>
  <div class="details container">
    <h1 class="page-header">{{product.nazwa}}
        <span class="pull-right">
            <router-link class="btn btn-primary" v-bind:to="'/edit/'+product.id">Edit</router-link>
            </span>
    </h1>
    <ul class="list-group">
            <li class="list-group-item"> {{product.opis}}</li>
            <li class="list-group-item"> {{product.cena_jednostkowa}}</li>
        </ul>

        <ul class="list-group">
            <li class="list-group-item"> {{product.category.nazwa}}</li>
        </ul>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'productDetail',
  data () {
    return {
      product: {category: {nazwa: ''}}
    }
  },
  methods:{
       fetchProduct(id){
        axios.get(`${this.getCurrentURL}:8081/products/`+id).then(res => {
             this.product = res.data
        })
      },
  },
  created: function(){
     this.fetchProduct(this.$route.params.id);
  }
}
</script>

<style scoped>

</style>
