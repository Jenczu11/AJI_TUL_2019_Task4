// import shop from '../../api/shop'

// initial state
// shape: [{ id, quantity }]
const state = {
  items: [],
}

const getters={
  returnItems: (state) =>{
  return state.items
  },
  returnCartLength: () =>{
    return state.items.length
  }
}
const actions={
  addProductToCart ({ state, commit }, product) {
    
      const cartItem = state.items.find(item => 
        // console.log("item")
        // console.log(item.product.id)
        // console.log(product.id)
         item.product.id === product.id
      )
      // console.log(cartItem)
      if (!cartItem) {
        console.log("Action->AddProductToCart")
        commit('pushProductToCart', { product })
      } else {
        console.log("Action - > incrementItemQuantity")
        commit('incrementItemQuantity', cartItem)
  }
  // console.log(state.items)
}
}
const mutations={
  pushProductToCart (state,product){
    state.items.push({
      ...product,
      quantity: 1
    });
  },
incrementItemQuantity (state, cartItem) {
  cartItem.quantity++
}
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}