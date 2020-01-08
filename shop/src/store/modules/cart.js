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
    console.log("Action->AddProductToCart")
        commit('pushProductToCart', product)
  }
}
const mutations={
  pushProductToCart (state,product){
    state.items.push(product);
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}