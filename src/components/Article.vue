<template>
<div class="panel">
  <h1 id="title" v-html="Title" />
  <h2 id="subtitle" v-html="SubTitle" />
  <div class="Content" v-html="Content" />
</div>
</template>

<script setup lang="ts">
import { marked } from 'marked';

const props = defineProps<{
  Title: string,
  Content: string
}>()

var Title = props.Title.split("\n", 2)[0];
var SubTitle = props.Title.split("\n", 2)[1];
var Content = marked(props.Content);
</script>


<style scoped>
.panel {
  padding: 16px;
  margin-bottom: 16px;
}
</style>