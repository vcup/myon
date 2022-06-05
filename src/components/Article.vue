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
import { onMounted } from 'vue';

const props = defineProps<{
  Id: number,
  Title: string,
  SubTitle: string,
  Content: string,
  PictureUri: string|null
}>()

onMounted(() => {
  if (props.SubTitle.length < 1){
    const panel = document.getElementById(props.Id.toString());
    if (panel) {
      panel.style.gridTemplateRows = '0px 138px 0px auto';
    }
  }
});
</script>


<style scoped>
.panel {
  padding: 32px 45px 24px;
  margin-bottom: 16px;
  display: grid;
  grid-template-rows: 0px 90px 48px auto;
}

img {
  position: relative;
  left: -45px;
  top: -32px;
  z-index: -1;
  height: 170px;
  width: calc(100% + 90px);
  object-fit: cover;
  border-radius: 16px 16px 0px 0px;
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

div.Content {
  padding-top: 24px;
}
</style>