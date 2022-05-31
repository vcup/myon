import { createApp } from 'vue';
import App from './App.vue';
import router from './router'

const app = createApp(App);

app.provide("apiURL", "https://vcup.moe/api")
   .use(router)
   .mount("#app");