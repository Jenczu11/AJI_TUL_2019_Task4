<template>
  <div class="container">
    <div class="card shopping-cart">
      <div class="card-header bg-dark text-light">
        <p>
          <i class="fa fa-shopping-cart" aria-hidden="true"></i>
          Shopping cart for id: {{order.id}}
        </p>
        <div class="clearfix"></div>
      </div>
      <div class="card-body">
        <!-- PRODUCT STARTS HERE -->
        <div class="row"  v-for="(p,index) in products" v-bind:key="p.id">
          <div class="col-2 col-sm-12 col-md-2 text-center">
            <img
              class="img-responsive"
              src="https://placeimg.com/120/80/arch/sepia"
              alt="prewiew"
              width="120"
              height="80"
            />
          </div>
          <div class="col-4 text-sm-center col-sm-12 text-md-left col-md-5">
            <h4 class="product-name">
              <strong>{{p.nazwa}}</strong>
            </h4>
            <h4>
              <small>{{p.opis}}</small>
            </h4>
          </div>
          <div class="col-4 col-md-5 text-right">
              <h6>
                <strong>
                  {{p.cena_jednostkowa.toFixed(2)}}$
                  <span class="text-muted">x</span>
                  {{order.orderedProducts[index].ilosc}} item
                </strong>
              </h6>
          </div>
        </div>
        <hr />
        <!-- END PRODUCT -->
      </div>
      <div class="card-footer">
        <div class="pull-right" style="margin: 10px">
          <div class="pull-right" style="margin: 5px">
            Total price:
            <b>{{totalPrice()}}$</b>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: "OrderDetailCard",
  props: {
      id:{
          required: true,
      },
  },
  data() {
    return {
      order: {},
      products: []
    };
  },
    methods:{
       fetchOrder(id){
        return axios.get('http://localhost:8081/orders/'+id).then( res => {
            // console.log(res.data)
             this.order = res.data
        })     
      },
      fetchProducts(){
        for(let product of this.order.orderedProducts)
        {
            console.log(product)
            axios.get("http://localhost:8081/products/"+product.id_produktu).then(res => {
                this.products.push(res.data)
            })
        }
      },
      totalPrice(){
          let index = 0;
          let sum = 0;
         for (let p of this.products)
         {
             console.log(p.cena_jednostkowa.toFixed(2))
             console.log(this.order.orderedProducts[index].ilosc)
             sum = sum + (p.cena_jednostkowa.toFixed(2) * this.order.orderedProducts[index].ilosc)
             index++


         }
          return sum.toFixed(2);
      }
  },
  created: function(){
     this.fetchOrder(this.$route.params.id).then( () => {
         this.fetchProducts()
     });
     
  }
};
</script>

<style>
</style>