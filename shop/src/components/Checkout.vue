<template>
  <div class="container">
    <div class="row">
      <CheckoutSidebar />
      <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Billing address</h4>
        <form class="needs-validation" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="firstName">First name</label>
              <input type="text" class="form-control" v-model="firstName" placeholder value required />
              <div class="invalid-feedback">Valid first name is required.</div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="lastName">Last name</label>
              <input type="text" class="form-control" v-model="lastName" placeholder value required />
              <div class="invalid-feedback">Valid last name is required.</div>
            </div>
          </div>

          <div class="mb-3">
            <label for="username">Username</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text">@</span>
              </div>
              <input type="text" class="form-control" v-model="userName" placeholder="Username" required />
              <div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">
              Email
            </label>
            <input type="email" class="form-control" v-model="email" placeholder="you@example.com" />
            <div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
          </div>
           <div class="mb-3">
            <label for="tel-input">
              Telephone
            </label>
            <input type="tel" class="form-control" v-model="telephone" placeholder="555-555-555" />
          </div>
          <div class="mb-3">
            <label for="address">Address</label>
            <input
              type="text"
              class="form-control"
              v-model="address"
              placeholder="1234 Main St"
              required
            />
            <div class="invalid-feedback">Please enter your shipping address.</div>
          </div>

         

          <div class="row">
            <div class="col-md-5 mb-3">
              <label for="country">Country</label>
              <select class="custom-select d-block w-100" v-model="country" required>
                <option value>Choose...</option>
                <option>United States</option>
              </select>
              <div class="invalid-feedback">Please select a valid country.</div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="state">State</label>
              <select class="custom-select d-block w-100" v-model="state" required>
                <option value>Choose...</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">Please provide a valid state.</div>
            </div>
            <div class="col-md-3 mb-3">
              <label for="zip">Zip</label>
              <input type="text" class="form-control" v-model="zip" placeholder required />
              <div class="invalid-feedback">Zip code required.</div>
            </div>
          </div>
          <hr class="mb-4" />
          <CheckoutPayment />

          <hr class="mb-4" />
        </form>
          <button class="btn btn-primary btn-lg btn-block" v-on:click="send()">Proceed</button>
      </div>
    </div>
  </div>
</template>

<script>
import CheckoutSidebar from "@/components/CheckoutSidebar";
import CheckoutPayment from "@/components/CheckoutPayment";
import axios from 'axios'
import { mapState, mapActions,mapGetters,mapMutations } from 'vuex'
export default {
  name: "Checkout",
  components: { CheckoutSidebar, CheckoutPayment },
  data() {
    return {
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      telephone: '',
      address: '',
      country: '',
      state: '',
      zip: ''
    }
  },
  methods: {
   ...mapGetters('cart',{
     returnItems: 'returnItems',
     getTotalPrice: 'getTotalPrice',
   }),
    send() {
      var currentDateWithFormat = new Date().toJSON().slice(0,10).replace(/-/g,'-');
            // console.log(currentDateWithFormat);
      let products = this.returnItems()
      console.log(products)
      let zamowione_produkty = products.map((p) => {
        return {
          id_produktu: p.product.id,
          ilosc: p.quantity
        }
      })
      
      let datatosend = {
        data_zatwierdzenia: currentDateWithFormat,
        stan_zamowienia: 1,
        nazwa_uzytkownika: this.userName,
        email: this.email,
        numer_telefonu: this.telephone,
        zamowione_produkty: zamowione_produkty
      };
      axios.post('http://localhost:8081/orders', datatosend)
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error.response.data);
  });
    }
  }
};
</script>

<style>
</style>