<template>
<div id="warpper">
  <ArticleMenu :ContentInfos="results" />

  <main>
    <Article v-for="content in results" :key="content.Title" :Title="content.Title" :Content="content.Content" />
  </main>
</div>
</template>


<script setup lang="ts">
import ArticleMenu from "../components/ArticleMenu.vue";
import Article from "../components/Article.vue";
import { inject, ref } from 'vue';
import axios from 'axios';

const apiURL = inject("apiURL") as string // provider in main.ts

interface result {
  Title: string,
  Content: string,
  HtmlHeadingIdRelation: Map<string, string>
}
/* example result
  result:{
    Title: 'example',
    Content: <h1 id="1-1-example">example</h1> <p>w</p> <h2 id="1-1-1-heading"></h2> <h2 id="1-1-2-heading">heading</h2>
    HtmlHeadingIdRelation: {"1-1-example": "example", "1-1-1-heading": "heading", "1-1-2-heading": "heading"}
  }
*/

const results = ref(new Array<result>());

axios.get(`${apiURL}/Articles`)
  .then(res => {
    var data = res.data as result[];
    data.forEach(element => {
      results.value.push(element);
    });
  })
</script>


<style scoped>
div#warpper {
  display: grid;
  grid-template-columns: 22.8% auto;
  grid-template-rows: 100%;
  gap: 16px;
  margin: 24px 14.2% 24px 12.5%;
}
</style>
