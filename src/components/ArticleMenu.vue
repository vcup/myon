<template>
  <div class="panel" id="root">
    <div id="myon-sign">
      <strong id="myon">Myon~</strong>
      <span id="sign">{{ props.SignText }}</span>
    </div>
    <div id="contents">
      <div v-for="infos in props.ContentInfos" :key="infos.Title">
        <div class="panel">{{infos.Title}}</div>
        <ul>
          <li v-for="index in infos.Indexs" :key="index">
            {{index}}
          </li>
        </ul>
      </div>
    </div>
    <div id="other"></div>
  </div>
</template>


<script setup lang="ts">
type ContentInfos = {
  Title: string,
  Indexs: string[]
}[]

const props = defineProps({
  SignText: {
    type: String,
    default: "きょうもいいてんき"
  },
  ContentInfos: {
    type: Array as () => ContentInfos,
    default: () => [],
  },
})

</script>


<style scoped>
div#root {
  width: 14.80vw;
  height: 90.47vh;
  position: fixed;
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
</style>