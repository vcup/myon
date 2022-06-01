<template>
  <div class="panel" id="root">
    <div id="myon-sign">
      <strong id="myon">Myon~</strong>
      <span id="sign">{{ SignText }}</span>
    </div>
    <div id="contents">
      <div v-for="(infos, n) in props.ContentInfos" :key="infos.Title" class="content" :class="focusedTitle === infos.Title ? 'focused' : null">
        <router-link class="panel" :to="n.toString()" v-html="infos.Title"
          @click="if (focusedTitle !== infos.Title) focusedTitle = infos.Title; else focusedTitle = ''" />
        <Transition>
          <div v-if="focusedTitle === infos.Title">
            <router-link v-for="value, key in infos.HtmlHeadingIdRelation" :key="key" :to="'/Articles/' + key" v-html="value" />
          </div>
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

const focusedTitle = ref("");
</script>


<style scoped>
div#root {
  position: sticky;
  top: 2.38vh;
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
  margin-bottom: 16px;
}

.panel {
  display: block;
  min-height: 8vh;
}

a > :deep(*) {
  margin: 0px;
}

a {
  color: black;
  text-decoration: none;
}

div.content > a {
  font-weight: 600;
}

div.content > div {
  padding-left: 16px;
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