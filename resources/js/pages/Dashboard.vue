<script setup lang="ts">
import { onMounted, PropType, toRaw } from 'vue';
import AppLayout from '@/layouts/AppLayout.vue';
import { dashboard } from '@/routes';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import PlaceholderPattern from '../components/PlaceholderPattern.vue';
import DocumentTableForAuthUser from './document/documentTableForAuthUser.vue';
import { usePage } from '@inertiajs/vue3';
const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Dashboard',
        href: dashboard().url,
    },
];
const props=defineProps({
    documentTypes:{
        type: Array as PropType<Record<string, any>[]>,
        default: ()=>[]
    },
    complexities:{
        type: Array as PropType<Record<string, any>[]>,
        default: ()=>[]
    },
    offices:{
        type: Array as PropType<Record<string, any>[]>,
        default: ()=>[]
    },
    employees:{
        type: Array as PropType<Record<string, any>[]>,
        default: ()=>[]
    },
    
});

</script>

<template>
    <Head title="Dashboard" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div
            class="flex h-full flex-1 flex-col gap-4 overflow-x-auto rounded-xl p-4"
        >
            <DocumentTableForAuthUser :documentTypes="documentTypes" 
            :complexities="complexities" :offices="offices" :employees="employees"/>
        </div>
    </AppLayout>
</template>
