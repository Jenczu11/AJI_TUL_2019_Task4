<template>
<div class="container">
   <div class="card shopping-cart">
            <div class="card-header bg-dark text-light">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                Shopping cart
                <div class="clearfix"></div>
            </div>
            <div class="card-body">
                    <!-- PRODUCT STARTS HERE --> 
                    <div class="row" v-for="p in filtered" v-bind:key="p.product.nazwa">
                        <div class="col-12 col-sm-12 col-md-2 text-center">
                                <img class="img-responsive" src="https://placeimg.com/120/80/arch/sepia" alt="prewiew" width="120" height="80">
                        </div>
                        <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                            <h4 class="product-name"><strong>{{p.product.nazwa}}</strong></h4>
                            <h4>
                                <small>{{p.product.opis}}</small>
                            </h4>
                        </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 11px">
                                <h6><strong>{{p.product.cena_jednostkowa}} <span class="text-muted">x</span></strong></h6>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                                <div class="quantity">
                                    <input type="button" value="+" class="plus" v-on:click="incrementItemQuantity(p.product.id)">
                                    <p title="Qty" class="qty" size="4">{{p.quantity}}</p>
                                    <input type="button" value="-" class="minus" v-on:click="decrementItemQuantity(p.product.id)">
                                </div>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <button type="button" class="btn btn-outline-danger btn-xs" v-on:click="removeProductFromCart(p.product)">
                                     <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <!-- END PRODUCT -->
                    
            </div>
            <div class="card-footer">
                <!-- <div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
                    <div class="row">
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="cupone code">
                        </div>
                        <div class="col-6">
                            <input type="submit" class="btn btn-default" value="Use cupone">
                        </div>
                    </div>
                </div> -->
                <div class="pull-right" style="margin: 10px">
                    <a href="" class="btn btn-success pull-right">Checkout</a>
                    <div class="pull-right" style="margin: 5px">
                        Total price: <b>{{totalPrice}}</b>
                    </div>
                </div>
            </div>
        </div>
       
</div>
</template>

<script>
import { mapState, mapActions,mapGetters,mapMutations } from 'vuex'
export default {
  methods: {
   ...mapGetters('cart',{
     returnItems: 'returnItems',
     getTotalPrice: 'getTotalPrice'
   }),
    ...mapActions('cart', [
    'addProductToCart',
    'removeProductFromCart'
  ]),
  ...mapMutations('cart',['incrementItemQuantity','decrementItemQuantity']

  )
 },
 computed:{
   filtered() {
       console.log(this.returnItems())
     return this.returnItems();
   },
   totalPrice() {
    //    console.log(this.getTotalPrice())
     return this.getTotalPrice().toFixed(2);
   }
 }
}
</script>

<style>

.quantity {
    float: left;
    margin-right: 15px;
    background-color: #eee;
    position: relative;
    width: 80px;
    overflow: hidden
}

.quantity input {
    margin: 0;
    text-align: center;
    width: 15px;
    height: 15px;
    padding: 0;
    float: right;
    color: #000;
    font-size: 20px;
    border: 0;
    outline: 0;
    background-color: #F6F6F6
}

.quantity p.qty {
    position: relative;
    border: 0;
    width: 100%;
    height: 40px;
    padding: 10px 25px 10px 10px;
    text-align: center;
    font-weight: 400;
    font-size: 15px;
    border-radius: 0;
    background-clip: padding-box;
    margin: 0px;
}

.quantity .minus, .quantity .plus {
    line-height: 0;
    background-clip: padding-box;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-background-size: 6px 30px;
    -moz-background-size: 6px 30px;
    color: #bbb;
    font-size: 20px;
    position: absolute;
    height: 50%;
    border: 0;
    right: 0;
    padding: 0;
    width: 25px;
    z-index: 3
}

.quantity .minus:hover, .quantity .plus:hover {
    background-color: #dad8da
}

.quantity .minus {
    bottom: 0
}
.shopping-cart {
    margin-top: 20px;
}
</style>