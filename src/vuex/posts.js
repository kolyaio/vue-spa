import appService from '../app.service.js'

const defaultState = {
  posts: [],
  categoryId: 0
}

const isBrowser = typeof window !== 'undefined'

const state = (isBrowser && window.__INITIAL_STATE__) ? window.__INITIAL_STATE__.postsModule : defaultState

const getters = {
  posts: stata => state.posts
}

const actions = {
  updateCategory (context, categoryId) {
    return appService.getPosts(categoryId)
      .then(data => {
        context.commit('updateCategory', { categoryId, posts: data })
      })
  }
}

const mutations = {
  updateCategory (state, category) {
    state.categoryId = category.categoryId
    state.posts = category.posts
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
