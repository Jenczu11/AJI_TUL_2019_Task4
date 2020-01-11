<template>
  <div class="container">
    <Alert v-if="alert" v-bind:message="alert" />
    <div class="row">
      <CheckoutSidebar />
      <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Billing address</h4>
        <!-- Form start -->
        <form id="form" class="needs-validation" v-on:submit.prevent="onSubmit" novalidate>
          <div class="row">
            <!-- First Name -->
            <div class="col-md-6 mb-3">
              <div class="text-left">
              <label for="firstName" class="text-left">First name</label>
              </div>
              <input
                type="text"
                class="form-control"
                v-bind:class="{ 'is-invalid': errors.firstNameError }"
                v-model="customer.firstName"
                placeholder
                value
                required
              />
              <div class="invalid-feedback">Valid first name is required.</div>
            </div>
            <!-- Last Name -->
            <div class="col-md-6 mb-3">
              <div class="text-left">
              <label for="lastName">Last name</label>
              </div>
              <input
                type="text"
                class="form-control"
                v-bind:class="{ 'is-invalid': errors.lastNameError }"
                v-model="customer.lastName"
                placeholder
                value
                required
              />
              <div class="invalid-feedback">Valid last name is required.</div>
            </div>
          </div>
          <!-- UserName -->
          <div class="mb-3">
            <div class="text-left">
            <label for="username">Username</label>
            </div>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text">@</span>
              </div>
              <input
                type="text"
                class="form-control"
                v-model="customer.userName"
                v-bind:class="{ 'is-invalid': errors.userNameError }"
                placeholder="Username"
                required
              />
              <div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
            </div>
          </div>
          <!-- Email -->
          <div class="mb-3">
            <div class="text-left">
            <label for="email">Email</label>
            </div>
            <input
              type="email"
              class="form-control"
              v-model="customer.email"
              v-bind:class="{ 'is-invalid': errors.emailError }"
              placeholder="you@example.com"
              required
            />
            <div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
          </div>
          <!-- Telephone -->
          <div class="mb-3">
            <div class="text-left">
            <label for="tel-input">Telephone</label>
            </div>
            <input
              type="tel"
              class="form-control"
              v-model="customer.telephone"
              v-bind:class="{ 'is-invalid': errors.telephoneError }"
              placeholder="555-555-555"
              required
            />
            <div
              class="invalid-feedback"
            >Please provide a valid telephone number for shipping updates.</div>
          </div>
          <!-- Address -->
          <div class="mb-3">
            <div class="text-left">
            <label for="address">Address</label>
            </div>
            <input
              type="text"
              class="form-control"
              v-model="customer.address"
              v-bind:class="{ 'is-invalid': errors.addressError }"
              placeholder="1234 Main St"
              required
            />
            <div class="invalid-feedback">Please enter your shipping address.</div>
          </div>
          <!-- Country -->

          <div class="row">
            <div class="col-md-5 mb-3">
              <div class="text-left">
              <label for="country">Country</label>
              </div>
              <select
                class="custom-select d-block w-100"
                v-model="customer.country"
                v-bind:class="{ 'is-invalid': errors.countryError }"
                required
              >
                <option value>Choose...</option>
                <option>United States</option>
              </select>
              <div class="invalid-feedback">Please select a valid country.</div>
            </div>
            <!-- State -->
            <div class="col-md-4 mb-3">
              <div class="text-left">
              <label for="state">State</label>
              </div>
              <select
                class="custom-select d-block w-100"
                v-model="customer.state"
                v-bind:class="{ 'is-invalid': errors.stateError }"
                required
              >
                <option value>Choose...</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">Please provide a valid state.</div>
            </div>
            <!-- Zip -->
            <div class="col-md-3 mb-3">
              <div class="text-left">
              <label for="zip">Zip</label>
              </div>
              <input
                type="text"
                class="form-control"
                v-model="customer.zip"
                v-bind:class="{ 'is-invalid': errors.zipError }"
                placeholder
                required
              />
              <div class="invalid-feedback">Zip code required.</div>
            </div>
          </div>
          <hr class="mb-4" />
          <!-- <CheckoutPayment /> -->
          <hr class="mb-4" />
          <button class="btn btn-primary btn-lg btn-block" type="submit">Proceed</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable vue/no-unused-components */
import CheckoutSidebar from "@/components/CheckoutSidebar";
import CheckoutPayment from "@/components/CheckoutPayment";
import Alert from "@/components/Alert";
import axios from "axios";
import { mapState, mapActions, mapGetters, mapMutations } from "vuex";
export default {
  name: "Checkout",
  components: { CheckoutSidebar, CheckoutPayment, Alert },
  data() {
    return {
      customer: {},
      errors: {
        firstNameError: false,
        lastNameError: false,
        userNameError: false,
        emailError: false,
        telephoneError: false,
        addressError: false,
        countryError: false,
        stateError: false,
        zipError: false
      },
      alert: ""
    };
  },
  methods: {
    ...mapGetters("cart", {
      returnItems: "returnItems",
      getTotalPrice: "getTotalPrice"
    }),
    resetErrors() {
      for (let e in this.errors) this.errors[e] = false;
    },
    onSubmit(e) {
      var vm = this;
      // Bootstrap JS to catch wrong forms
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName("needs-validation");
      // Loop over them and prevent submission
      Array.prototype.filter.call(forms, function(form) {
        if (form.checkValidity() === false) {
          form.classList.add("error");
          e.preventDefault();
          e.stopPropagation();
        }
        form.classList.add("was-validated");
      });
      var haveToBreak = false;
      var currentDateWithFormat = new Date()
        .toJSON()
        .slice(0, 10)
        .replace(/-/g, "-");
      let products = this.returnItems();
      let form = document.getElementById("form");
      if (form.checkValidity()) {
        let datatosend = {
          data_zatwierdzenia: currentDateWithFormat,
          stan_zamowienia: 1,
          nazwa_uzytkownika: this.customer.userName,
          email: this.customer.email,
          numer_telefonu: this.customer.telephone,
          zamowione_produkty: products.map(p => {
            return {
              id_produktu: p.product.id,
              ilosc: p.quantity
            };
          })
        };
        axios
          .post("http://localhost:8081/orders", datatosend)
          .then(function(response) {
            console.log(response);
            setTimeout(function() {
              vm.$router.push({ path: "/products" });
            }, 3000);
          })
          .catch(function(error) {
            console.log(error.response);
          });
      } else {
        this.alert = "Please fill in all required fields";
      }
    }
  }
};
</script>

<style>
</style>