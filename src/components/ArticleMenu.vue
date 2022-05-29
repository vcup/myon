<template>
  <div class="panel" id="root">
    <div id="myon-sign">
      <strong id="myon">Myon~</strong>
      <span id="sign">{{ SignText }}</span>
    </div>
    <div id="contents">
      <div v-for="infos in props.ContentInfos" :key="infos.Title" :class="focusedTitle === infos.Title ? 'content focused' : 'content'">
        <div class="panel" @click="{scrollTo(infos.Title);focusedTitle = infos.Title}" v-html="infos.Title"/>
        <Transition>
          <ul v-if="focusedTitle === infos.Title">
            <li v-for="value, key in infos.HtmlHeadingIdRelation" :key="key"
                @click="scrollTo(key)" v-html="value" />
          </ul>
        </Transition>
      </div>
    </div>
    <div id="other"></div>
  </div>
</template>


<script setup lang="ts">
import { ref } from 'vue';
type ContentInfos = {
  Title: string,
  HtmlHeadingIdRelation: Map<string, string>
}[]

const props = defineProps({
  SignText: {
    type: String,
    default: "きょうもいいてんき"
  },
  ContentInfos: {
    type: Array as () => ContentInfos,
    default: () => [],
  }
})

var focusedTitle = ref("");

function scrollTo(id: string){
  var element = document.getElementById(id);
  element?.scrollIntoView();
}

</script>


<style scoped>
div#root {
  position: sticky;
  top: 2.38vh;
  width: 14.80vw;
  height: 90.47vh;
  padding: 32px 16px 16px;
  display: grid;
  grid-template-rows: 12.28% 67.54% 16.67%;
  gap: 16px;
}

div#myon-sign {
  display: grid;
  grid-template-rows: 64.28% 14.28%;
  gap: 24px;
}

#myon {
  text-align: center;
  font-size: 54px;
}

#sign {
  text-align: center;
  font-size: 12px;
  font-family: sans-serif;
  font-weight: lighter;
  color: #707070;
}

div#contents {
  overflow-y: scroll;
}
div#contents::-webkit-scrollbar {
  display: none;
}

div.content.focused {
  position: sticky;
  top: 10px;
  background-color: white;
}

div.content {
  margin-bottom: 8px;
}

div.panel {
  min-height: 8vh;
}

.v-enter-active {
  transition: opacity 0.4s ease;
}

.v-leave-active {
  transition: opacity 0s ease;
}

.v-enter-from,
.v-leave-to {
  opacity: 0.25;
}
</style>