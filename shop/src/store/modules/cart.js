// import shop from '../../api/shop'

// initial state
// shape: [{ id, quantity }]
const state = {
  items: [],
}

const getters = {
  returnItems: (state) => {
    return state.items
  },
  returnCartLength: () => {
    return state.items.length
  },
  getTotalPrice: (state, getters) => {
    return state.items.reduce((total, product) => {
      return (total + (product.product.cena_jednostkowa * product.quantity))
    }, 0)

  }
}
const actions = {
  addProductToCart({ state, commit }, product) {

    const cartItem = state.items.find(item =>
      // console.log("item")
      // console.log(item.product.id)
      // console.log(product.id)
      item.product.id === product.id
    )
    if (!cartItem) {
      // console.log("Action->AddProductToCart")
      commit('pushProductToCart', { product })
    } else {
      // console.log("Action - > incrementItemQuantity")
      // console.log(cartItem.product.id)
      commit('incrementItemQuantity', cartItem.product.id)
    }
  },
  removeProductFromCart({ state, commit }, product) {
    commit('removeProductFromCart', { product })
  }
}
const mutations = {
  pushProductToCart(state, product) {
    state.items.push({
      ...product,
      quantity: 1
    });
  },
  incrementItemQuantity(state, id) {
    const cartItem = state.items.find(item => item.product.id === id)
    cartItem.quantity++
  },
  decrementItemQuantity(state, id) {
    const cartItem = state.items.find(item => item.product.id === id)
    cartItem.quantity--
  },
  removeProductFromCart(state, product) {
    let idToRemove = product.product.id
    state.items = state.items.filter((p) => {
      return p.product.id!=idToRemove
    })
    
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}