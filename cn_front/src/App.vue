<template>
  <div class="container">
    <div class="columns">
      <div class="column">
        <SearchForm :openSearchResults="openSearch"></SearchForm>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="columns">
      <div class="column">
        <SearchList :openSearchResults="openSearch"></SearchList>
      </div>
      <div class="column">
        <SearchResults :search_id="search_trigger"></SearchResults>
      </div>
    </div>
  </div>
</template>

<script>
import SearchForm from '@/components/SearchForm.vue'
import SearchResults from '@/components/SearchResults.vue'
import SearchList from '@/components/SearchList.vue'

export default {
  name: 'App',
  components: {
    SearchForm,
    SearchResults,
    SearchList
  },
  data() {
    return {
      search_trigger: null
    }
  },
  methods: {
    openSearch(row) {
      this.search_trigger = row.id
    }
  }
}
</script>

<style>
</style>
