<template>
  <div class="main" @click="expanded = !expanded">
    <span v-if="expanded && IndexNode.childrens.length > 0">▽</span>
    <span v-else-if="!expanded && props.IndexNode.childrens.length > 0">+</span>
    <span v-else>-</span>
    <router-link :to="'#' + props.IndexNode.key" v-html="IndexNode.value" />
  </div>
  <Transition>
    <div class="subnodes" v-if="expanded && props.IndexNode.childrens.length > 0">
      <ArticleIndexs v-for="node of props.IndexNode.childrens" :key="node.key"
        :IndexNode="node" @changed="arg => $emit('changed', arg)"/>
    </div>
  </Transition>
</template>


<script setup lang="ts">
import { ref, watch } from 'vue';

interface IndexNode {
  key: string,
  value: string,
  childrens: IndexNode[]
}

const props = defineProps<{
    IndexNode: IndexNode
}>();

const emit = defineEmits<{
  (e: 'changed', status: boolean): void
}>();

const expanded = ref(props.IndexNode.childrens.length < 4);
watch(expanded, () => emit('changed', expanded.value), { flush: 'post' });
</script>


<style scoped>
span {
  text-align: center;
}

a {
  color: black;
  text-decoration: none;
  padding-left: 4px;
}

a > :deep(*) {
  display: inline;
  font-size: 15px;
}

div.main {
  display: grid;
  grid-template-columns: 12px auto;
}

div.subnodes {
  padding-left: 12px;
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
