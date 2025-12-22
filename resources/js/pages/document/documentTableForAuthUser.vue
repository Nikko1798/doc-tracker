<script lang="ts" setup>
    import Datatable from '@/components/Datatable.vue';
    import { PropType, toRaw } from 'vue';
    import { route } from 'ziggy-js';
    import Button from '@/components/ui/button/Button.vue';
    import { PlusIcon, PenBoxIcon, PenBox } from 'lucide-vue-next';
    import { Link } from '@inertiajs/vue3';
    import { usePage } from '@inertiajs/vue3';
    import axios from 'axios';
    import { toast } from 'vue3-toastify';
    import 'vue3-toastify/dist/index.css';
    import documentDrawerForm from './documentDrawerForm.vue';
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
    const pageProps=usePage();
    const updateDocumentStatus=( async (event: Event, documentId: any)=>{
        const target=event.target as HTMLSelectElement
        try
        {
            const response =  await axios.patch(route('document.update-doc-status', documentId), 
                { doc_status: target.value },{
                
                });
            toast.success("Document status successfully updated", {
                autoClose: 1000,
            }); //
        }
        catch(error: any)
        {

        }
    })
    const getDocument=(async (documentId: number)=>{
    
        const response=await axios.get(route('document.get-document', documentId));
        alert(response.data.id);
    })
    </script>
    
    <template>
        <div class="flex justify-start items-center">
            <Link :href="route('document.index')">
            <Button  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-800 hover:cursor-pointer">
                <PlusIcon></PlusIcon>Create New</Button>
            </Link>
        </div>
        <Datatable :apiUrl="route('document.fetch-all-documents')" 
            :extraParams="{}"
            :tableHeaders="[]"
            :visible-columns="['document_status', 'date_received', 'document_type', 'other_details', 
            'title','authority_or_fund_source','ncca_end_user', 'office_concerned', 'control_number',
            'date_time_ready', 'date_time_released', 'service_to_ncca', 'concerned_party_or_supplier',
            'total_service_amount', 'actions']" 
            :sortableColumns="['id', 'title', 'date_received' ]"
            :itemsPerPage="1"
            eventName="refresh-all-documents"
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
            
            <template #header-service_to_ncca>
                <div class="text-white">Service to NCCA</div>
            </template>
            
            <template #header-concerned_party_or_supplier>
                <div class="text-white">Concerned Party or Supplier</div>
            </template>
            
            <template #header-total_service_amount>
                <div class="text-white">Total Service Amount</div>
            </template>
            <template #header-actions>
                <div class="text-white">Action</div>
            </template>
            <!-- for column data manipulation -->
            <template #cell-0="{ rowData }">
                <span>
                    <select
                        @change="(event)=>updateDocumentStatus(event,rowData.id)" id="countries" class="block w-full px-3 py-2.5 bg-neutral-secondary-medium border border-default-medium text-heading text-sm rounded-base focus:ring-brand focus:border-brand shadow-xs placeholder:text-body">
                        <option v-if="!rowData.document_status_id" selected>Select status</option>
                        <option v-else value="">Select status</option>
                        <option  v-for="(item, index) in pageProps.props.documentStatus" :selected="rowData.document_status_id===item['id']"
                            :key=" item['id'] " :value="item['id']">{{ item['codevalue'] }}</option>
                    </select>
                </span>
            </template>
            <template #cell-1="{ rowData }">
                <span>
                    {{
                        new Date(rowData.date_received + 'T00:00:00').toLocaleDateString('en-US', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                        })
                    }}
                </span>
            </template>
            <template #cell-9="{ rowData }">
                <span>
                    {{
                        new Date(rowData.date_time_ready).toLocaleDateString('en-US', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                        })
                    }}
                </span>
            </template>
            <template #cell-10="{ rowData }">
                <span>
                    {{
                        new Date(rowData.date_time_released).toLocaleDateString('en-US', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                        })
                    }}
                </span>
            </template>
            <template #cell-13="{ rowData }">
                <span>
                    {{
                        new Intl.NumberFormat('en-PH', {
                            style: 'currency',
                            currency: 'PHP',
                        }).format(rowData.total_service_amount)
                    }}
                </span>
            </template>
            <template #cell-14="{ rowData }">
                <!-- <Button class="bg-blue-500 hover:bg-blue-800 hover:cursor-pointer"><PenBox></PenBox> Edit</Button> -->
                
                <documentDrawerForm :rowData="rowData" :documentTypes="documentTypes" 
                :complexities="complexities" :offices="offices" :employees="employees"></documentDrawerForm>
            </template>
        </Datatable>
    </template>