<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
import { route } from 'ziggy-js';
import documentTablePublic from './document/documentTablePublic.vue';
import { usePage } from '@inertiajs/vue3';
import { onMounted } from 'vue';
import { Button } from '@/components/ui/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from '@/components/ui/tabs'
import { UserIcon, LayoutDashboardIcon } from 'lucide-vue-next';
withDefaults(
    defineProps<{
        canRegister: boolean;
    }>(),
    {
        canRegister: true,
    },
);

</script>
<style>
    .col-document_type, .col-other_details{
        width: 500px
    }
    tr:hover{
        background-color: #cdd0d1;
        cursor: pointer;
    }
</style>
<template>
    <Head title="Welcome">
        <link rel="preconnect" href="https://rsms.me/" />
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
    </Head>
    <div
        class="flex min-h-screen flex-col items-center bg-[#FDFDFC]  text-[#1b1b18] lg:justify-center  dark:bg-[#0a0a0a]"
    >
        <header
            class="mb-6 w-full text-sm not-has-[nav]:hidden bg-gradient-to-r from-[#2A52BE] to-[#007FFF]"
        >
            <nav class="mx-auto flex max-w-6xl items-center justify-end gap-4 px-6 py-3">
                <Link
                    v-if="$page.props.auth.user"
                    :href="route('dashboard')"
                    class="inline-block rounded-sm border border-[#19140035] px-5 py-1.5 text-sm leading-normal text-[#1b1b18] hover:border-[#1915014a] dark:border-[#3E3E3A] dark:text-[#EDEDEC] dark:hover:border-[#62605b]"
                >
                    
                        <span class="flex items-center gap-2 text-white">
                            <LayoutDashboardIcon />Dashboard
                        </span>
                </Link>

                <template v-else>
                    <Link
                        :href="route('login')"
                        class="inline-block rounded-sm border border-transparent px-5 py-1.5 text-sm leading-normal text-[#1b1b18] hover:border-[#19140035] dark:text-[#EDEDEC] dark:hover:border-[#3E3E3A]"
                    >
                        <span class="flex items-center gap-2 text-white">
                            <UserIcon class="h-4 w-4" />
                            Log in
                        </span>
                    </Link>
                </template>
            </nav>
        </header>

        <div
            class="flex w-full mt-10 bg p-5
            opacity-100 transition-opacity duration-750 lg:grow starting:opacity-0"
        >
        
            <!-- <div class="flex w-full max-w-sm flex-col gap-6"> -->
            <Tabs default-value="moa" class="w-full h-full">
                <TabsList>
                    <TabsTrigger value="moa">
                        MOA
                    </TabsTrigger>
                    <TabsTrigger value="contracts">
                        Contracts
                    </TabsTrigger>
                </TabsList>
            <div class="flex-1 min-h-0">
                    <TabsContent
                        value="moa"
                        class="h-full overflow-y-auto overflow-x-hidden"
                    >
                        <documentTablePublic :routeName="'document.fetch-public-documents'" :documentType="2"/>
                    </TabsContent>

                    <TabsContent
                        value="contracts"
                        class="h-full overflow-y-auto overflow-x-hidden"
                    >
                        <documentTablePublic :routeName="'document.fetch-public-documents'" :documentType="1"/>
                    </TabsContent>
                </div>
            </Tabs>
            
        </div>
        <div class="hidden h-14.5 lg:block"></div>
    </div>
</template>
