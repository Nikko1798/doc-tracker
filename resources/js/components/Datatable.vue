<style>
    tr:hover{
        cursor: pointer;
        background-color: #d9dadb;
    }
</style>
<script setup lang="ts">
import { ref, computed, PropType, onMounted, watch, toRaw  } from 'vue'
import {
    Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  Pagination,
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationNext,
  PaginationPrevious,
} from '@/components/ui/pagination'

import { Sidebar, SidebarContent, SidebarFooter, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from '@/components/ui/sidebar';
import { Search, Watch } from 'lucide-vue-next'
import { Input } from '@/components/ui/input'
import axios from 'axios';
import { debounce, sortBy } from 'lodash';
import { eventBus } from '@/composables/mitt';
import Loader from './Loader.vue'; 
import { ArrowUpDown } from 'lucide-vue-next'
    const props = defineProps({
        apiUrl: { type: String, required: true },
        // tableHeaders: { type: Array, required: true },
        sortableColumns: { type: Array as PropType<string[]> },
        visibleColumns: { type: Array as PropType<string[]>, required: true },
        itemsPerPage: { type: Number, default: 1 },
        eventName: { type: String, required: true }, // Unique event name for refreshing
        extraParams: { type: Object, default: () => ({}) }, // Accept additional parameters
        rowDblClick: {
            type: Function as PropType<(row: any) => void>,
            required: false,
        },
    });
    const isLoading=ref(false)
    const query = ref('');
    const tableData = ref([]);
    const currentPage = ref(1);
    const totalItems = ref(0);
    const currSortBy=ref('');
    const ascOrDesc=ref<string>('');

    // This function is responsible for accessing a specific value from a deeply nested object
    // example data.item.approver.name this function loop through the object and find thtet value if that data.item.approver.name
    const getNestedValue = (obj: any, path: any) => {
        return path.split('.').reduce((acc: any, part: any) => acc && acc[part], obj);
    };

    const filteredTableData = computed(() => {
        return tableData.value.map(item => {
            let filteredItem: Record<string, any> = {}; // ✅ Fix here
            props.visibleColumns.forEach(col => {
                filteredItem[col] = getNestedValue(item, col);
            });
            filteredItem.subItems = item;
            return filteredItem;
        });
    });

    const fetchData = async () => {
        isLoading.value=true;
        try {
        const response = await axios.get(props.apiUrl, {
            params: {
            name: query.value,
            page: currentPage.value,
            sortBy: currSortBy.value,
            sortOrder: ascOrDesc.value,
            ...props.extraParams,
            },
        });
        tableData.value = response.data.data;
        totalItems.value = response.data.last_page;
        isLoading.value=false;
        } catch (error) {
        console.error("Error fetching data:", error);
        }
    };
    const debouncedFetchData = debounce(fetchData, 300);
    const searchMethod = () => {
        currentPage.value = 1;
        fetchData();
    };
    const sortColum=((column: any)=>{
        currSortBy.value=column
        if(!ascOrDesc.value)
        {
            //walang laman
            ascOrDesc.value='asc';
        }
        else{
            //check naman kung same pa din yung column na sino sort
            if(currSortBy.value!=column)
            {
                //pag hindi same always ascending
                ascOrDesc.value='asc';
            }
            else{
                //pag same 
                ascOrDesc.value=ascOrDesc.value!='asc' ? 'asc' : 'desc';
            }
        }
    });
    //trigger refresh of specific table base on event name
    eventBus.on(props.eventName, fetchData);
    onMounted(fetchData);
   
    watch([query, currentPage, currSortBy, ascOrDesc, () => props.extraParams], debouncedFetchData, { deep: true }); //extraParams is an object (e.g., { status: 'active', type: 'urgent' }), Vue doesn’t detect changes inside it unless deep: true is used.
 
    watch(() => props.extraParams, () => {
        fetchData()
    }, { deep: true });
    watch([query, currSortBy], debounce(() => {
        currentPage.value=1
    }, 300));
    const nextPage=(()=>{
        currentPage.value++;
    })
    const previousPage=(()=>{
        currentPage.value--;
    })
    const goToPage=((page: any)=>{
        currentPage.value=page;
    })
   
    // dynamic events
    
    function handleRowDblClick(row: any) {
        console.log(toRaw(row))
        if (props.rowDblClick) {
            props.rowDblClick(row);
        }
    }
    function click()
    {
        alert('ss')
    }
</script>

<template>
   <div class="max-w-[100%]">
        <div class="flex justify-end space-x-4">
            <div class="relative w-full md:w-[400px]">
                <Input id="search" v-model="query" type="text" placeholder="Search..." class="pl-10 w-full border border-[#007FFF] " />
                <span class="absolute start-0 inset-y-0 flex items-center justify-center px-2">
                <Search class="size-6 text-muted-foreground " />
                </span>
            </div>
        </div>
        
        <div class="relative mt-3 ">
            <Loader :isLoading="isLoading"></Loader>
            <div class="relative overflow-x-auto w-full">
            <Table class="rounded-lg w-full min-w-max">

                <colgroup>
                    <col v-for="(header, i) in visibleColumns"
                        :key="i"
                        :class="`col-${header}`" />
                </colgroup>

                <TableHeader class="bg-gradient-to-r from-[#2A52BE] to-[#007FFF]">
                    <TableHead
                        v-for="(header, index) in visibleColumns"
                        :key="index"
                        class="whitespace-nowrap"
                    >
                        <div class="flex items-center gap-3">
                            <slot :name="`header-${header}`">
                                <span v-html="header"></span>
                            </slot>

                            <ArrowUpDown
                                v-if="sortableColumns?.includes(header)"
                                @click="sortColum(header)"
                                class="text-white cursor-pointer w-4 h-4"
                            />
                        </div>
                    </TableHead>
                </TableHeader>

                <TableBody>
                    <TableRow v-if="filteredTableData.length<1">
                        <td colspan="100%" class="">
                            <div class="flex justify-center items-center h-24 w-full  font-semibold gap-2">
                              <Search/>  No data available
                            </div>
                        </td>
                    </TableRow>
                    <TableRow v-else
                        v-for="(item, rowIndex) in filteredTableData"
                        :key="rowIndex" :id="item"
                        v-on:dblclick="handleRowDblClick(item.subItems)"
                    >
                        <TableCell
                            v-for="(column, colIndex) in visibleColumns"
                            :key="colIndex"
                            class="whitespace-nowrap truncate"
                        >
                            <slot :name="`cell-${colIndex}`" :rowData="item.subItems">
                                <span v-html="item[column]"></span>
                            </slot>
                        </TableCell>
                    </TableRow>
                </TableBody>
            </Table>
        </div>

            <div class="flex justify-end mt-5">
            <Pagination v-slot="{ page }" :items-per-page="itemsPerPage" :total="totalItems" :default-page="currentPage">
                <PaginationContent v-slot="{ items }">
                <PaginationPrevious @click="previousPage" />

                <template v-for="(item, index) in items" :key="index">
                    <PaginationItem
                    @click="goToPage(item.value)"
                    v-if="item.type === 'page'"
                    :value="item.value"
                    :is-active="item.value === currentPage"
                    >
                    {{ item.value }}
                    </PaginationItem>
                </template>

                <PaginationEllipsis :index="4" />

                <PaginationNext @click="nextPage" />
                </PaginationContent>
            </Pagination>
            </div>
        </div>

    </div>
    
</template>