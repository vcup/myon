<template>
<div class="panel" :id="Id">
  <h1 class="title" v-html="Title" />
  <span class="subtitle" v-html="SubTitle"/>
  <div class="Content" v-html="props.Content" />
</div>
</template>


<script setup lang="ts">

const props = defineProps<{
  Id: string,
  Title: string,
  Content: string
}>()

var titles = props.Title.split("\n", 2);

var Title = titles[0];
var SubTitle = titles[1];
</script>


<style scoped>
.panel {
  padding: 24px 45px;
  margin-bottom: 16px;
  display: grid;
  grid-template-rows: 90px 48px auto;
  gap: 16px;
}

h1 {
  font-size: 45px;
  font-weight: bold;
  text-align: center;
}

span {
  font-weight: lighter;
  text-align: center;
  display: block;
}
</style>