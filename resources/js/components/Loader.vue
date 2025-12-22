<template>
    <div
      v-if="isLoading"
      class="absolute inset-0 z-10 backdrop-blur-sm flex items-center justify-center"
    >
      <!-- Customize your loader visuals -->
      <Skeleton class="w-[100px] h-5 rounded-full" />
    </div>
  </template>
  
  <script setup>
  import { Skeleton } from '@/components/ui/skeleton'
  import { onMounted } from 'vue';
  
  defineProps({
    isLoading: Boolean
  });
  </script>
  