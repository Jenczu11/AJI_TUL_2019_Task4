<template>
  <div class="productFilter">
    <div id="prdfilter">
      <h4 class="d-flex mb-3">
        <span class="text-muted">Filters:</span>
      </h4>
      <hr style="border: 0.7px solid #87619c;">
      <div class="form-group">
        <label>Filtruj po kategorii:</label>
        <select
          class="form-control"
         v-model="chosenCategory"
          @change="emitToParent"
        >
          <option 
          v-for="(kategoria,index) in kategorie"
          :key="index"
          v-bind:value="kategoria.nazwa"
            
          >{{kategoria.nazwa}}</option>
        </select>
      </div>
      <hr style="border: 0.7px solid #87619c;">
      <div class="form-group">
        
        <label>Filtruj po nazwie użytkownika:</label>
       <input v-model="userNameFilter" 
       class="form-control" 
       name="userNameFilter"
       v-on:keyup="emitToParent">
      </div>
      <hr style="border: 0.7px solid #87619c;">
        <div class="form-group">
        <label>Filtruj po mailu:</label>
       <input v-model="mailFilter" 
       class="form-control" 
       name="mailFilter"
       v-on:keyup="emitToParent">
      </div>
      
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "OrdersFilter",
  props: ["kategorie"],
  data: function() {
       return {
           chosenCategory: "WSZYSTKIE",
           userNameFilter: "",
           mailFilter: ""
           
           
       }
   },
   methods: {
       updateProductCategory(event) {
    },
    emitToParent (event) {
        let userNameFilter = this.userNameFilter
        let chosenCategory = this.chosenCategory
        let mailFilter = this.mailFilter
      this.$emit('chosenFilter', {userNameFilter, chosenCategory,mailFilter})
    },
   },
   created() {
  }
   
  
};
</script>
<style scoped>

.productFilter {
  margin-left: 60px;
  margin-right: 60px;
}
hr {
  border: 0.7px solid #87619c!important;
}
</style>
