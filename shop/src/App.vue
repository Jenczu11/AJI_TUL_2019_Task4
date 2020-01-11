<template>
  <div id="app">
    <nav id="navigation" class="navbar navbar-expand-md navbar-dark bg-dark">
      <a class="navbar-brand">
        <router-link to="/">Shop</router-link>
      </a>

      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarText"
        aria-controls="navbarText"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/products">Products</router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/about">About</router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/cart">Go to Cart</router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/orders">Orders</router-link>
            </a>
          </li>
        </ul>
        <div id="cart" style="text-align: center;">
        <span id="cart"><i class="fas fa-shopping-cart"></i>  Number of diffrent items in cart: {{cartLength}}</span>
        </div>
      </div>
    </nav>
    <transition name="fade" mode="out-in">
      <router-view id="router"></router-view>
    </transition>
    <footer id="footer" class="footer text-muted text-center text-small">
      <p class="mb-1">&copy; 2019 bjencz</p>
      <ul class="list-inline">
        <li class="list-inline-item">
          <a href="#">Privacy</a>
        </li>
        <li class="list-inline-item">
          <a href="#">Terms</a>
        </li>
        <li class="list-inline-item">
          <a href="#">Support</a>
        </li>
      </ul>
    </footer>
  </div>
</template>

<script>
import Products from "./components/Products.vue";
import ProductFilter from "./components/ProductFilter.vue";
import { mapGetters } from "vuex";
export default {
  name: "app",
  data() {
    return {};
  },
  components: {
    //  Products,
  },
  methods: {
    ...mapGetters("cart", {
      getNumberOfCartItems: "returnCartLength"
    })
  },
  computed: {
    cartLength() {
      //  let number =
      return this.getNumberOfCartItems();
    }
  }
};
</script>
<style>
@import url("https://fonts.googleapis.com/css?family=Montserrat&display=swap");
.fade-enter-active,
.fade-leave-active {
  transition-duration: 0.3s;
  transition-property: opacity;
  transition-timing-function: ease;
}

.fade-enter,
.fade-leave-active {
  opacity: 0;
}
#app {
  font-family: "Montserrat", Helvetica, Arial, sans-serif !important;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-size: 14px;
  text-align: center;
  color: #007bff;
  background-color: #ffffff !important;
  margin: 30px 30px 30px 30px;
}

#navigation {
  border-radius: 30px;
  background-color: #06182c !important;
}
.navbar-nav{
  background-color: white;
  border-radius: 10px;
}
#cart{
  height: 37px;
  width: 280px;
  align-content: center;
  background-color: white;
  border-radius: 10px;
  display: table-cell;
  vertical-align: middle;
}
#navigation>ul>li {
    border-style: solid;
    border-radius: 30px;
    border-width: 1px 1px 0;
    display: inline-block;
    height: 48px;
    position: relative;
    vertical-align: top;
}
nav {
  margin-bottom: 60px;
}
.navbar-dark .navbar-brand {
    color: #fff;
    margin-left: 15px;
}
</style>
