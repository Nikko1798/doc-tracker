<script lang="ts" setup>
import Datatable from '@/components/Datatable.vue';
import { toRaw } from 'vue';
import { route } from 'ziggy-js';
</script>

<template>
   <Datatable :apiUrl="route('document.fetch-public-documents')" 
        :extraParams="{}"
        :tableHeaders="[]"
        :visible-columns="['id', 'date_received', 'document_type', 'other_details', 
        'title','authority_or_fund_source','ncca_end_user', 'office_concerned', 'control_number',
        'date_time_ready', 'date_time_released']" 
        :sortableColumns="['id', 'title', 'date_received' ]"
        :itemsPerPage="1"
        eventName="refresh-public-documents"
       >
         <template #header-id>
            <div class="text-white">ID</div>
        </template>
        <template #header-date_received>
            <div class="text-white">Date Received</div>
        </template>
        <template #header-document_type>
            <div class="text-white">Document type</div>
        </template>
        <template #header-other_details>
            <div class="text-white">Other details</div>
        </template>
        <template #header-title>
            <div class="text-white">Project/Program</div>
        </template>
        <template #header-authority_or_fund_source>
            <div class="text-white">Authority/Fund Source</div>
        </template>
        <template #header-ncca_end_user>
            <div class="text-white">NCCA End user</div>
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
        
        <!-- <template #cell-4="{ rowData }"> -->
            
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