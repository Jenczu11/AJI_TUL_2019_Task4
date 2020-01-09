<template>
  <div class="col-md-4 order-md-2 mb-4">
    <h4 class="d-flex justify-content-between align-items-center mb-3">
      <span class="text-muted">Your cart</span>
      <span class="badge badge-secondary badge-pill">{{this.totalItemsInCart()}}</span>
    </h4>
    <ul class="list-group mb-3">
      <li v-for="p in filtered" v-bind:key="p.product.nazwa" class="list-group-item d-flex justify-content-between lh-condensed">
        <div>
          <h6 class="my-0">{{p.product.nazwa}}</h6>
          <small class="text-muted">{{p.product.opis}}</small>
        </div>
        <span v-if="p.quanitty==1" class="text-muted">${{p.product.cena_jednostkowa.toFixed(2)}}</span>
        <span v-else class="text-muted">{{p.quantity}} x ${{p.product.cena_jednostkowa.toFixed(2)}}</span>
      </li>
      <li class="list-group-item d-flex justify-content-between">
        <span>Total (USD)</span>
        <strong>${{totalPrice}}</strong>
      </li>
    </ul>

    <form class="card p-2">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Promo code" />
        <div class="input-group-append">
          <button type="submit" class="btn btn-secondary">Redeem</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import { mapState, mapActions, mapGetters, mapMutations } from "vuex";
export default {
  name: "CheckoutSidebar",
  methods: {
    ...mapGetters("cart", {
      returnItems: "returnItems",
      getTotalPrice: "getTotalPrice",
     totalItemsInCart: 'returnCartLength'

    }),
    ...mapActions("cart", ["addProductToCart", "removeProductFromCart"]),
    ...mapMutations("cart", ["incrementItemQuantity", "decrementItemQuantity"])
  },
  computed: {
    filtered() {
      console.log(this.returnItems());
      return this.returnItems();
    },
    totalPrice() {
      //    console.log(this.getTotalPrice())
      return this.getTotalPrice().toFixed(2);
    },
  }
};
</script>

<style>
</style>