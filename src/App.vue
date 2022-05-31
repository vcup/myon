<template>
  <nav>
    <router-link to="/Articles">Articles</router-link>
  </nav>
  <router-view/>
</template>

<style>
.panel {
  margin: 2px;
  border: 2px solid transparent;
  border-radius: 16px;
  box-shadow: 0px 0px 3px black;
}

.pane {
  border-radius: 16px;
}
</style>

<style scoped>

nav {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  padding: 16px;
  height: 42px; /* 43 + 16 * 2 = 75 */
  box-shadow: 0px 2px 42px #6e6e6e;
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
