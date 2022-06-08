<template>
<div class="panel" :class="SubTitle.length < 1 ? 'hasNotSubTitle':null" :id="Id.toString()">
  <img v-if="PictureUri" :src="PictureUri"/>
  <div v-else/>
  <h1 class="title" >
    <router-link :to="'#' + Id.toString()" v-html="Title"/>
  </h1>
  <span class="subtitle" v-html="SubTitle"/>
  <div class="markdown-body" v-html="props.Content" />
</div>
</template>


<script setup lang="ts">
import 'github-markdown-css/github-markdown-light.css';

const props = defineProps<{
  Id: number,
  Title: string,
  SubTitle: string,
  Content: string,
  PictureUri: string|null
}>()
</script>


<style scoped>
.panel {
  padding: 32px 45px 24px;
  margin-bottom: 16px;
  display: grid;
  grid-template-rows: 0px 90px 48px auto;
}

.panel.hasNotSubTitle {
  grid-template-rows: 0px 138px 0px auto;
}

img {
  position: relative;
  left: -45px;
  top: -32px;
  z-index: -1;
  height: 170px;
  width: calc(100% + 90px);
  object-fit: cover;
  border-radius: 12px 12px 0px 0px;
}

h1 {
  font-size: 45px;
  font-weight: bold;
  text-align: center;
  color: white;
  text-shadow: 2px 4px 10px #000000b9;
  margin: auto;
}

span {
  font-weight: 600;
  text-align: center;
  display: block;
  color: white;
  text-shadow: 0px 0px 3px #000000b9;
}

div.markdown-body {
  padding-top: 24px;
}

a, div.markdown-body > :deep(h1) > a, :deep(h2) > a, :deep(h3) > a, :deep(h4) > a, :deep(h5) > a, :deep(h6) > a {
  text-decoration: unset;
  color: unset;
}
div.markdown-body > :deep(h1) > a:hover, :deep(h2) > a:hover, :deep(h3) > a:hover, :deep(h4) > a:hover, :deep(h5) > a:hover, :deep(h6) > a:hover {
  text-decoration: underline;
}
</style>
