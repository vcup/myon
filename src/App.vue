<template>
  <nav>
    <router-link to="/Articles">Articles</router-link>
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
  text-align: center;
  color: #2c3e50;
  padding: 16px;
  height: 42px; /* 43 + 16 * 2 = 75 */
  border-bottom: 1px solid;
}

nav a {
  font-weight: bold;
  text-decoration: none;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}

nav a {
  font-size: larger;
  line-height: 42px;
}
</style>
