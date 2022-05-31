<template>
  <nav>
    <router-link to="/">Articles</router-link>
  </nav>
  <router-view/>
</template>

<style>
.panel {
    border: 2px solid;
    border-radius: 16px;
    border-color: #707070;
}
</style>

<style scoped>

nav {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
