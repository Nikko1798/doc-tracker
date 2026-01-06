<script setup lang="ts">
import { onMounted, onUnmounted, ref } from "vue";
import { usePage } from "@inertiajs/vue3";
import bannerOne from "@/assets/images/1.jpg";
import bannerTwo from "@/assets/images/2.jpg";
import bannerThree from "@/assets/images/3.jpg";
import bannerFour from "@/assets/images/4.jpg";
import bannerFive from "@/assets/images/5.jpg";

const page = usePage();
const quote = page.props.quote;
const props=defineProps<{
    title?: string;
    description?: string;
}>();
//  const images = [
//         "https://ik.imagekit.io/tvlk/blog/2023/09/shutterstock_2317865365.jpg?tr=q-70,c-at_max,w-1000,h-800,dpr-2",
//         "https://upload.wikimedia.org/wikipedia/commons/f/f3/Manila_Metropolitan_Theater_or_commonly_called_the_Met%2C_an_abandoned_art_deco_building_in_the_heart_of_Manila.jpg",
//         "https://scontent.fmnl10-1.fna.fbcdn.net/v/t39.30808-6/505789002_1125988982905703_4831457776447996641_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=f727a1&_nc_eui2=AeEVBNQiUYXzW16jmrE6fr2YCnaCwnij3pAKdoLCeKPekHJCTU5cgL0BXhUwQwjyjmHHzqEEopElyx9AYHR7tUuj&_nc_ohc=yJCppar3IDsQ7kNvwGNHWgc&_nc_oc=AdkXTT2Hl5tWtvZ3cGUT0LC5mNqc7hiLA80G1Cjzb5UepHec8F1xWFwf1TRO_UcxRvs&_nc_zt=23&_nc_ht=scontent.fmnl10-1.fna&_nc_gid=DGD1A8O2cgc-LF4UaHVc6Q&oh=00_AfZUqEQB6lSbvXjWw-m7Ds-Wi4ylZpW58qo6qCDeEwIbmA&oe=68C5B40D",
//         "https://scontent.fmnl10-1.fna.fbcdn.net/v/t39.30808-6/486943898_1069365261901409_2322627954550863107_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=f727a1&_nc_eui2=AeGIYxAo8-7vSfBcsFgTDzAspWUYsh9vT6elZRiyH29PpymcKz_Zp2XQ19EHS5LvY2C80SNVhsOg9cvZ_PvM--uK&_nc_ohc=aNVWRzZY_6wQ7kNvwGxp6_r&_nc_oc=AdlcPR4I9mD-aYyhLQc2eXCF7HW3Ef4hM-LWHM4OW6CYoDxCoFdTmlgtWTxLzVW8xGc&_nc_zt=23&_nc_ht=scontent.fmnl10-1.fna&_nc_gid=qjPNVrPnl90h6CsfT9nsUw&oh=00_Afb6B83ZI1M6Et_moo0mziCiL6PrmkmZKJYvGi-4orN5Eg&oe=68C5B232"
//     ];

const images=[bannerOne, bannerTwo, bannerThree, bannerFour, bannerFive]
const currentIndex = ref(0);

onMounted(() => {
  const interval = setInterval(() => {
    currentIndex.value = (currentIndex.value + 1) % images.length;
  }, 4000); // change every 4s

  onUnmounted(() => clearInterval(interval));
});
</script>

<template>
  <div class="relative grid h-dvh lg:max-w-none lg:grid-cols-[60%_40%]">
    <!-- Left (slideshow) -->
    <div class="relative hidden h-full flex-col bg-muted p-10 text-white lg:flex dark:border-r overflow-hidden">
      <!-- stack all images -->
      <div class="absolute inset-0">
        <div
          v-for="(img, i) in images"
          :key="i"
          class="absolute inset-0 transition-opacity duration-1000 ease-in-out"
          :class="i === currentIndex ? 'opacity-100' : 'opacity-0'"
        >
          <img
            :src="img"
            alt="Background"
            class="h-full w-full object-cover"
          />
          <div class="absolute inset-0 bg-zinc-900/30"></div>
        </div>
      </div>

      
    </div>

    <!-- Right (form area) -->
    <div class="paint-bg lg:p-8 h-full relative ">
      <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-full max-w-md flex flex-col space-y-6 px-10 md:px-4">
        <div class="flex flex-col text-center ">
          <h1 class="text-xl font-medium tracking-tight">{{ title }}</h1>
          <p class="text-sm opacity-80">
            <span>{{ description }}</span>
          </p>
        </div>
        <slot />
      </div>
    </div>
  </div>
</template>
