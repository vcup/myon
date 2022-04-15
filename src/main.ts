import { createApp } from 'vue';
import App from './App.vue';

const app = createApp(App);

app.provide("apiURL", "https://vcup.moe/api")

app.mount("#app")