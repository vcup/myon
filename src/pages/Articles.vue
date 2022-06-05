<template>
<div id="warpper">
  <ArticleMenu :ContentInfos="results" />

  <main>
    <Article v-for="content in results" :key="content.Title" v-bind="content" />
  </main>
</div>
</template>


<script setup lang="ts">
import ArticleMenu from "../components/ArticleMenu.vue";
import Article from "../components/Article.vue";
import { inject, ref, watch } from 'vue';
import axios from 'axios';

const apiURL = inject("apiURL") as string // provider in main.ts

interface result {
  Id: number,
  Title: string,
  SubTitle: string,
  Content: string,
  PictureUri: string,
  HtmlHeadingIdRelation: Map<string, string>
}
/* example result
  result:{
    Id: '0';
    Title: 'example',
    SubTitle: 'example-subtitle'
    Content: <h1 id="1-1">example</h1> <p>w</p> <h2 id="1-1-1"></h2> <h2 id="1-1-2">heading</h2>
    HtmlHeadingIdRelation: {"1-1": "example", "1-1-1": "heading", "1-1-2": "heading"}
  }
*/
const props = defineProps<{
  ContentId?: string
}>();

const results = ref(new Array<result>());

axios.get(`${apiURL}/Articles`)
  .then(res => {
    var data = res.data as result[];
    data.forEach(element => {
      results.value.push(element);
    });
  })

watch(() => props.ContentId, scrollTo);
watch(() => results.value.length, () => scrollTo(props.ContentId), { flush: 'post' });

function scrollTo(id?: string) {
  if (id) {
    const element = document.getElementById(id as string);

    if (element === null) return;

    const offset = element.offsetTop - window.scrollY - 5;
    if (window.scrollY > element.offsetTop) {
      window.scrollBy({top: offset - 75, behavior: 'smooth'});
    }
    else {
      window.scrollBy({top: offset, behavior: 'smooth'});
    }
  }
}
</script>


<style scoped>
div#warpper {
  display: grid;
  grid-template-columns: 312px auto;
  grid-template-rows: 100%;
  gap: 16px;
  margin: 32px 264px 24px 232px;
}
</style>
