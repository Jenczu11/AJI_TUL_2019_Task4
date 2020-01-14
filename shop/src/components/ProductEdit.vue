<template>
  <div class="edit container">
    <h1 class="page-header">Edit product</h1>
    <form v-on:submit.prevent="updateProduct">
      <div class="well">
        <h4>Product Info</h4>
        <div class="form-group">
          <label>Nazwa towaru</label>
          <input
            type="text"
            class="form-control"
            placeholder="Nazwa produktu"
            v-model="product.nazwa"
          />
        </div>
        <div class="form-group">
          <label>Opis towaru</label>
          <input type="text" class="form-control" placeholder="Last Name" v-model="product.opis" />
        </div>
      </div>
      <div class="well">
        <h4>Cena / Waga</h4>
        <div class="form-group">
          <label>Cena Jednostkowa</label>
          <input
            type="text"
            class="form-control"
            placeholder="Email"
            v-model="product.cena_jednostkowa"
          />
        </div>
        <div class="form-group">
          <label>Waga jednostkowa</label>
          <input
            type="text"
            class="form-control"
            placeholder="Phone"
            v-model="product.waga_jednostkowa"
          />
        </div>
      </div>
      <div class="well">
        <h4>Product Category</h4>
        <div class="form-group">
          <label>Category</label>
          <select class="custom-select" v-model="product.category.nazwa">
            <option v-for="cat in categories" v-bind:key="cat.id">{{cat.nazwa}}</option>
          </select>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "edit",
  data() {
    return {
      product: { category: { nazwa: "" } },
      categories: []
    };
  },
  methods: {
    fetchProduct(id) {
      let vw = this;
      axios
        .get(`${this.getCurrentURL}:8081/products/` + id)
        .then(function(response) {
          console.log(response.data);
          vw.product = response.data;
        });
    },
    fetchCategories() {
      let vw = this;
      axios.get(`${this.getCurrentURL}:8081/categories/`).then(function(response) {
        console.log(response);
        vw.categories = response.data;
      });
    },
    updateProduct(e) {
        let vm = this;
      console.log(this.categories);
      for (let cat in this.categories) {
        if (this.categories[cat].nazwa === this.product.category.nazwa)
          this.product.kategoria_towaru = this.categories[cat].id;
      }
      let updProduct = {
        product: {
          id: this.product.id,
          nazwa: this.product.nazwa,
          opis: this.product.opis,
          cena_jednostkowa: this.product.cena_jednostkowa,
          waga_jednostkowa: this.product.waga_jednostkowa,
          kategoria_towaru: this.product.kategoria_towaru
        }
      };
      axios.put(`${this.getCurrentURL}:8081/products`, updProduct).then(res => {
        console.log(res);
          setTimeout(function() {
              vm.$router.push({ path: "/products" });
            }, 3000);
      }).catch( e => {
          console.log(e.response)
      })
      console.log(updProduct);
    }
  },
  created: async function() {
    await this.fetchProduct(this.$route.params.id);
    await this.fetchCategories();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>