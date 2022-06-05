<template>
<div class="panel" :id="Id.toString()">
  <img v-if="PictureUri" :src="PictureUri"/>
  <div v-else/>
  <h1 class="title" v-html="Title" />
  <span class="subtitle" v-html="SubTitle"/>
  <div class="Content" v-html="props.Content" />
</div>
</template>


<script setup lang="ts">

const props = defineProps<{
  Id: number,
  Title: string,
  Content: string,
  PictureUri: string
}>()

var titles = props.Title.split("\n", 2);

var Title = titles[0];
var SubTitle = titles[1];
</script>


<style scoped>
.panel {
  padding: 8px 45px 24px;
  margin-bottom: 16px;
  display: grid;
  grid-template-rows: 0px 90px 48px auto;
  gap: 16px;
}

img {
  position: relative;
  left: -45px;
  top: -8px;
  z-index: -1;
  height: 178px;
  width: calc(100% + 90px);
  object-fit: cover;
  border-radius: 16px 16px 0px 0px;
}

h1 {
  font-size: 45px;
  font-weight: bold;
  text-align: center;
  text-shadow: 0px 0px 3px white;
}

span {
  font-weight: lighter;
  text-align: center;
  display: block;
  text-shadow: 0px 0px 3px white;
}
</style>