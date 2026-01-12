<script lang="ts" setup>
import Datatable from '@/components/Datatable.vue';
import { onMounted, PropType, ref, toRaw } from 'vue';
import { route } from 'ziggy-js';
import { Badge } from '@/components/ui/badge'
import documentDrawerForm from './documentDrawerForm.vue';
import Button from '@/components/ui/button/Button.vue';

const props=defineProps({
    routeName: {
        type: String,
        default: '',
        required: true
    },
    documentType: {
        type: Number,
        default: 0,
        required: true
    },
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
  
    const isDrawerOpen = ref(false)
    const selectedRow = ref<any>({})
    const handleRowDblClick = (row: any) => {
        selectedRow.value = row
        isDrawerOpen.value = true
        console.log(toRaw(selectedRow.value))
    }
    
</script>

<template>
   <Datatable :apiUrl="route(props.routeName)" 
        :extraParams="{'document_type':props.documentType}"
        :tableHeaders="[]"
        :visible-columns="['document_status', 'date_received', 'document_type', 'title', 
        'concerned_party_or_supplier', 'service_to_ncca', 'authority_or_fund_source',
        'ncca_end_user','other_details', 
         'office_concerned', 'control_number', 
        'date_time_ready', 'date_time_released', 'remarks', 'actions']" 
        :sortableColumns="['title', 'date_received' ]"
        :itemsPerPage="1"
        eventName="refresh-public-documents"
            :rowDblClick="handleRowDblClick"
       >
         <template #header-document_status>
            <div class="text-white">Document Status</div>
        </template>
        <template #header-date_received>
            <div class="text-white">Date Received</div>
        </template>
        <template #header-document_type>
            <div class="text-white">Document type</div>
        </template>
        <template #header-title>
            <div class="text-white">Project/Program</div>
        </template>
        <template #header-concerned_party_or_supplier>
            <div class="text-white">Concerned party/Supplier</div>
        </template>
        <template #header-service_to_ncca>
            <div class="text-white">Service to NCCA</div>
        </template>
        <template #header-authority_or_fund_source>
            <div class="text-white">Authority/Fund Source</div>
        </template>
        <template #header-ncca_end_user>
            <div class="text-white">NCCA End user</div>
        </template> 
        <template #header-other_details>
            <div class="text-white">Other details</div>
        </template>
        <template #header-office_concerned>
            <div class="text-white">Office Concerned</div>
        </template> 
        <template #header-control_number>
            <div class="text-white">Control number</div>
        </template>
        <template #header-date_time_ready>
            <div class="text-white">Date ready</div>
        </template>
        <template #header-date_time_released>
            <div class="text-white">Date released</div>
        </template>
        <template #header-remarks>
            <div class="text-white">Person claiming/Remarks</div>
        </template>
        <template #header-actions>
            <div class="text-white">Actions</div>
        </template>
        
        <template #cell-0="{ rowData }">
             <Badge variant="secondary" class="bg-blue-500 text-white">
                {{ rowData.document_status ? rowData.document_status : "N/A" }}
            </Badge>
        </template>
        <template #cell-14="{ rowData }">
            <div  class="flex items-center justify-center space-x-4" >
                <Button @click="handleRowDblClick(rowData)"  class="bg-blue-500 hover:bg-blue-800 hover:cursor-pointer"><PenBox></PenBox> View</Button>
            
            </div>
            
            <div class="space-x-2"> 
                <documentDrawerForm 
                v-model:open="isDrawerOpen"
                :rowData="selectedRow" :documentTypes="documentTypes" 
                :complexities="complexities" :offices="offices" :employees="employees"></documentDrawerForm>

                
                
            </div>
        </template>
            <!-- <div class="space-y-2 space-x-2">
                <ProductMasterlistForm 
                    :transaction="'update'"
                    :dialogButtonText="'Update Product'" 
                    :dialogTitle="'Update this Product'"
                    
                    :categoryData="toRaw(category)"
                    :brandData="toRaw(brands)"
                    :productData="rowData">
                        <template #triggerButton>
                            <Button variant="outline">
                                <SquarePen class="hover:bg-secondary hover:opacity-80 hover:text-white cursor-pointer w-4 h-4" />
                            </Button>
                        </template>
                </ProductMasterlistForm>
                <Button size="icon" variant="outline">
                    <Trash class="hover:bg-secondary hover:opacity-80 hover:text-white cursor-pointer w-4 h-4" />
                </Button>
            </div> -->
        <!-- </template> -->
           
    </Datatable>
</template>