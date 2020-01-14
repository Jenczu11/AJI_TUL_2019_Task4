<template>
  <div>
    <div class="row">
      <div class="col-md-4 order-md-1 mb-4">
        <ordersFilter :kategorie="status" v-on:chosenFilter="filterProductByString" />
      </div>
      <div class="col-md-8 order-md-2 ">
        <div class="table-responsive">
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Nazwa Uzytkownika</th>
              <th scope="col">Email</th>
              <th scope="col">Numer Telefonu</th>
              <th scope="col">Data zatwierdzenia</th>
              <th scope="col">Details</th>
              <th scope="col">Stan zamówienia</th>
            </tr>
          </thead>

          <tr v-for="order in ordersComputed" v-bind:key="order.id">
            <td>{{order.id}}</td>
            <td>{{order.nazwa_uzytkownika}}</td>
            <td>{{order.email}}</td>
            <td>{{order.numer_telefonu}}</td>
            <td>{{order.data_zatwierdzenia.slice(0,10)}}</td>
            <td>
              <router-link class="btn btn-outline-warning" v-bind:to="'/orders/'+order.id">Details</router-link>
            </td>
            <td>
              <button
                class="btn btn-outline-info disabled"
                v-on:click="renameStatus()"
              >{{order.stan_zamowienia}}</button>
            </td>
          </tr>
        </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import OrdersFilter from "./OrdersFilter";
export default {
  name: "orders",
  components: { OrdersFilter },
  data() {
    return {
      orders: [],
      status: [],
      filters: {
        userNameFilter: "",
        chosenCategory: "WSZYSTKIE",
        mailFilter: ""
      }
    };
  },
  methods: {
    fetchOrders: function() {
      return axios.get(`${this.getCurrentURL}:8081/orders`).then(res => {
        console.log(res.data);
        this.orders = res.data;
      });
    },
    fetchStatus: function() {
      return axios.get(`${this.getCurrentURL}:8081/status`).then(res => {
        console.log(res.data);
        this.status = res.data;
        this.status.unshift({ id: "all", nazwa: "WSZYSTKIE" });
      });
    },
    renameStatus: function() {
      // console.log("rename status");
      for (let o of this.orders) {
        for (let s of this.status) {
          if (o.stan_zamowienia == s.id) {
            o.stan_zamowienia = s.nazwa;
            break;
          }
        }
      }
    },
    filterProductByString(value) {
      this.filters = value;
      // console.log(value);
    },
    regexString(string = "") {
      let reg = "^";
      let res = string.toLowerCase().split(" ");
      for (let x of res) {
        reg = reg + "(?=.*" + x + ")";
      }
      reg = reg + ".*$";

      return reg;
    }
  },
  created: function() {
    Promise.all([this.fetchOrders(), this.fetchStatus()]).then(() => {
      this.renameStatus();
    });
  },
  computed: {
    ordersComputed() {
      const status = [...this.status];
      const filters = this.filters;
      const kat = filters.chosenCategory;
      const userName = this.regexString(filters.userNameFilter);
      const email = this.regexString(filters.mailFilter);
      function comp(string, filter) {
        return string
          .toString()
          .toLowerCase()
          .match(new RegExp(filter));
      }
      if (kat !== "WSZYSTKIE") {
        return this.orders.filter(order => {
          console.log(order.stan_zamowienia);
          return (
            comp(order.nazwa_uzytkownika, userName) &&
            order.stan_zamowienia === kat &&
            comp(order.email, email)
          );
        });
      }
      return this.orders.filter(order => {
        return comp(order.nazwa_uzytkownika, userName);
      });
    }
  }
};
</script>

<style>
</style>