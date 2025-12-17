<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head } from '@inertiajs/vue3';
import { type BreadcrumbItem } from '@/types';
import DocumentDetailForm from './DocumentDetailForm.vue';
import { PropType } from 'vue';
const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Document',
        href: '',
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
    }
});
</script>

<template>
    <Head title="Document" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <DocumentDetailForm :documentTypes="documentTypes" :complexities="complexities"/>
    </AppLayout>
</template>
