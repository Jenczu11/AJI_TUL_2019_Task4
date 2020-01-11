<template>
<div>
<div class="row">
 <div class="col-md-12 order-md-2">
   <table class="table">
     <thead class="thead-dark">
       <tr>
           <th scope="col">Id</th>
           <th scope="col">Nazwa Uzytkownika</th>
           <th scope="col">Email</th>
           <th scope="col">Numer Telefonu</th>
           <th scope="col">Data zatwierdzenia</th>
           <th scope="col">Stan zamówienia</th>
       </tr>
     </thead>
       <tr>
           <td>{{order.id}}</td>
           <td>{{order.nazwa_uzytkownika}}</td>
           <td>{{order.email}}</td>
           <td>{{order.numer_telefonu}}</td>
           <td>{{order.data_zatwierdzenia.slice(0,10)}}</td>
           <td>
           <button id="btn-cancel" class="btn btn-outline-danger " v-on:click="changeOrderStatus(3,true)">Anulowane</button>
           <button id="btn-niezat" class="btn btn-outline-warning " v-on:click="changeOrderStatus(2,true)">Niezatwierdzone</button>
           <button id="btn-finish" class="btn btn-outline-success " v-on:click="changeOrderStatus(4,true)">Zrealizowane</button>
          </td>
       </tr>
   </table>
   </div>
   
</div>
 <OrderDetailCard v-if='order.id' :id='order.id'/>
</div>

</template>

<script>
import axios from 'axios'
import OrderDetailCard from './OrderDetailCard'
export default {
  name: 'productDetail',
  components: {OrderDetailCard},
  data () {
    return {
        // Data_zatwierdzenia because vue screams
      order: {data_zatwierdzenia: ''}
    }
  },
  methods:{
       fetchOrder(id){
        return axios.get('http://localhost:8081/orders/'+id).then( res => {
             this.order = res.data
        })     
      },
      async changeOrderStatus(status,PUT=false)
      {
          let errorStatus=false;
          if(PUT)
            {
            await axios.put(`http://localhost:8081/orders/${this.$route.params.id}/status/${status}`).then(res => {
                console.log(res)
            }).catch(function(error) {
                errorStatus=true;
            console.log(error.response.data);
            alert(error.response.data.error)
          });
          }
          console.log(errorStatus)
          let btncancel = document.getElementById("btn-cancel");
           let btnniezat = document.getElementById("btn-niezat");
            let btnfinish = document.getElementById("btn-finish");
            if(!errorStatus)
            {
            if(status==3)
            {
                btncancel.classList.remove("btn-outline-danger")
                btncancel.classList.add("btn-danger")
                btnniezat.classList.remove("btn-warning")
                btnniezat.classList.add("btn-outline-warning")
                btnfinish.classList.remove("btn-success")
                btnfinish.classList.add("btn-outline-success")
            }
            if(status==2){
                btnniezat.classList.remove("btn-outline-warning")
                btnniezat.classList.add("btn-warning")
                btncancel.classList.remove("btn-danger")
                btncancel.classList.add("btn-outline-danger")
                btnfinish.classList.remove("btn-success")
                btnfinish.classList.add("btn-outline-success")
            }
             if(status==4){
                btnfinish.classList.remove("btn-outline-success")
                btnfinish.classList.add("btn-success")
                btnniezat.classList.remove("btn-warning")
                btnniezat.classList.add("btn-outline-warning")
                btncancel.classList.add("btn-outline-danger")
                btncancel.classList.remove("btn-danger") 
            }
            }    
      }
  },
  created: function(){
     this.fetchOrder(this.$route.params.id).then( () => {
         this.changeOrderStatus(this.order.stan_zamowienia)
     });
     
  }
}
</script>

<style>

</style>