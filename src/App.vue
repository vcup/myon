<template>
  <Articles />
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import Articles from './pages/Articles.vue'

export default defineComponent({
  name: 'App',
  components: {
    Articles
  }
});
</script>

<style>
body {
  margin: 0;
}

.panel {
    border: 2px solid;
    border-radius: 16px;
    border-color: #707070;
}
</style>
