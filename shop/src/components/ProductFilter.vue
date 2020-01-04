<template>
  <div class="productFilter">
    <div id="prdfilter">
      <h4 class="d-flex mb-3">
        <span class="text-muted">Filters:</span>
      </h4>
      <div class="form-group">
        <label>Filtruj po kategorii:</label>
        <select
          class="form-control"
          
         v-model="wybranaKategoria"
          @change="emitToParent"
        >
          <option 
          v-for="(kategoria,index) in kategorie"
          :key="index"
          v-bind:value="kategoria.nazwa"
            
          >{{kategoria.nazwa}}</option>
        </select>
       
      </div>
      <div class="form-group">
        <label>Filtruj po nazwie:</label>
       <input v-model="wybranaNazwa" 
       class="form-control" 
       name="wybranaNazwa"
       v-on:keyup="emitToParent">
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "productFilter",
  props: ["kategorie"],
  data: function() {
       return {
           wybranaKategoria: "wszystkie",
           wybranaNazwa: ""
           
       }
   },
   methods: {
       updateProductCategory(event) {
    //   this.$parent.filterProductByCategory(event);
    },
    emitToParent (event) {
        let wybranaNazwa = this.wybranaNazwa
        let wybranaKategoria = this.wybranaKategoria
      this.$emit('chosenFilter', {wybranaNazwa, wybranaKategoria})
    },
    getAllCategories: function() {
           axios
     .get('http://127.0.0.1:8081/categories')
     .then(res => {
         this.kategorie = res.data;
         this.kategorie.unshift({"id": 'all', "nazwa": "wszystkie"});
         });
         
       },

   },
   created() {
    // this.getAllCategories();
  }
   
  
};
</script>

