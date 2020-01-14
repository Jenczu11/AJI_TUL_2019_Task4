<template>
  <div>
    <div class="row">
      <div class="col-md-4 order-md-1 mb-4">
        <ProductFilter :kategorie="kategorie" v-on:chosenFilter="filterProductByString" />
      </div>
      <div class="col-md-8 order-md-2">
        <div v-if="filtered.length==0">
          <div class="spinner-grow text-primary" style="width: 18em; height: 18em;"></div>
        </div>

        <table v-else class="table">
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

          <tr v-for="product in sliced" v-bind:key="product.name">
            <td>{{product.nazwa}}</td>
            <td>{{product.opis}}</td>
            <td>{{product.cena_jednostkowa.toFixed(2)}}</td>
            <td>{{product.kategoria_towaru}}</td>
            <td>
              <button class="btn btn-outline-success" v-on:click="addProductToCart(product)">
                <i class="fas fa-plus"></i>
              </button>
            </td>
            <td v-if="admin">
              <router-link
                class="btn btn-outline-warning"
                v-bind:to="'/products/'+product.id"
              >Details</router-link>
            </td>
          </tr>
        </table>
      </div>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-end">
        
        <li v-for="x in howManyPages" class="page-item" v-bind:key="x" v-bind:id="`page${x}`">
          <a class="page-link" @click="updateLimitation((x-1)*10,(x)*10)">{{x}}</a>
        </li>  
      </ul>
    </nav>
  </div>
</template>

<script>
/* eslint-disable vue/no-unused-components */
import axios from "axios";
import ProductFilter from "@/components/ProductFilter";
import Alert from "@/components/Alert";
import _ from "lodash";
import { mapState, mapActions } from "vuex";

export default {
  name: "Products",
  components: { ProductFilter, Alert },
  //    props: ['cart'],
  data() {
    return {
      products: [],
      product_duplicate: [],
      kategorie: [],
      fromChild: {
        wybranaNazwa: "",
        wybranaKategoria: "wszystkie"
      },
      alert: "",
      admin: true,
      lowerLimit: 0,
      upperLimit: 10,
      previousPage: 1,
      currentPage: 1
    };
  },
  methods: {
    updateLimitation: function(lower, upper) {
      console.log(lower,upper)
      // document.getElementById(`page${currentPage}`).classList.remove("active")
      this.previousPage=this.currentPage
      document.getElementById(`page${this.previousPage}`).classList.remove('active')
      this.currentPage = upper/10
      let page = document.getElementById(`page${upper/10}`)
      page.classList.add("active")
      this.lowerLimit = lower;
      this.upperLimit = upper;
    },
    ...mapActions("cart", ["addProductToCart"]),
    getAllProdcuts: function() {
      axios.get("127.0.0.1:8081/products").then(res => {
        this.products = res.data;
        this.product_duplicate = res.data;
      });
    },
    getAllCategories: function() {
      axios.get("127.0.0.1:8081/categories").then(res => {
        this.kategorie = res.data;
        this.kategorie.unshift({ id: "all", nazwa: "wszystkie" });
      });
    },
    filterProductByString(value) {
      document.getElementById(`page${this.currentPage}`).classList.remove('active')
      this.previousPage=1;
      document.getElementById(`page${this.previousPage}`).classList.add('active')
      this.currentPage=1;
      this.lowerLimit=0;
      this.upperLimit=10;
      this.fromChild = value;
      console.log(value);
    }
  },
  created: function() {
    this.getAllCategories();
    this.getAllProdcuts();
  },
  computed: {
    filtered() {
      const kategorie = [...this.kategorie];
      let id;
      for (let x of kategorie) {
        if (x.nazwa === this.fromChild.wybranaKategoria) id = x.id;
      }
      let reg = "";
      if (this.fromChild.wybranaNazwa != "") {
        let res = this.fromChild.wybranaNazwa.toLowerCase().split(" ");
        console.log(res);
        reg = "^";
        for (let x of res) {
          reg = reg + "(?=.*" + x + ")";
        }
        reg = reg + ".*$";
      }
      console.log(reg);
      if (this.fromChild.wybranaKategoria !== "wszystkie") {
        return this.products.filter(product => {
          return (
            product.nazwa
              .toString()
              .toLowerCase()
              .match(new RegExp(reg)) && product.kategoria_towaru === id
          );
        });
      }
      return this.products.filter(product => {
        return product.nazwa
          .toString()
          .toLowerCase()
          .match(new RegExp(reg));
      });
    },
    howManyPages() {
      let l = Math.ceil(this.filtered.length / 10);
      return l;
    },
    sliced() {
      return this.filtered.slice(this.lowerLimit, this.upperLimit);
    }
  }
};
</script>
<style>
.table thead th {
  vertical-align: inherit;
}
</style>