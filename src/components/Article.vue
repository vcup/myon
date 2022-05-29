<template>
<div class="panel" :id="Title">
  <h1 id="title" v-html="Title" />
  <h2 id="subtitle" v-html="SubTitle" />
  <div class="Content" v-html="props.Content" />
</div>
</template>

<script setup lang="ts">

const props = defineProps<{
  Title: string,
  Content: string
}>()

var titles = props.Title.split("\n", 2);

var Title = titles[0];
var SubTitle = titles[1];
</script>

<style scoped>
.panel {
  padding: 16px;
  margin-bottom: 16px;
}
</style>