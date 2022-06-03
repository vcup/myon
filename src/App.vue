<template>
  <nav :class="pinningHeader ? 'pinning': 'unpined'">
    <router-link to="/Articles">Articles</router-link>
  </nav>
  <router-view />
</template>


<script setup lang="ts">
import { onMounted, ref, watch } from 'vue';

const offset = ref(0);
const pinningHeader = ref(false);
onMounted(() => {
  window.addEventListener('scroll', () => {
    offset.value = document.documentElement.scrollTop
  })
})

watch(offset, (value, oldvalue) => pinningHeader.value = value < oldvalue);
</script>


<style>
.panel {
  margin: 2px;
  border: 2px solid #acacac;
  border-radius: 16px;
}

.pane {
  border-radius: 16px;
}
</style>

<style scoped>

.pinning {
  animation-name: pinning;
  animation-duration: 125ms;
  animation-fill-mode: forwards;
}

.unpined {
  animation-name: unpined;
  animation-duration: 125ms;
}

@keyframes pinning {
  from {
    top: -144px;
  }
  to {
    top: 0px;
  }
}

@keyframes unpined {
  to {
    top: -144px;
  }
  from {
    top: 0px;
  }
}

nav {
  position: sticky;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  padding: 16px;
  min-height: 40px; /* 40 + 16 * 2 = 72 */
  box-shadow: 0px 2px 42px #6e6e6e;
  background: white;
  opacity: 0.85;
}

nav a {
  font-weight: bold;
  text-decoration: none;
  color: #2c3e50;
  font-size: larger;
  line-height: 40px;
  opacity: 1;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
