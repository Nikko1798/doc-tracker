<script setup lang="ts">
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import { onMounted, PropType } from 'vue';
import background from '@/assets/images/4.jpg'
const props=defineProps({
    document: {
        type: Object as PropType<Record<string, any>>,
        default: ()=>{}
    }
})
onMounted(()=>{
    console.log(props.document)
})
</script>

<template>
     <div
        class="min-h-screen w-full bg-cover bg-center bg-no-repeat"
        :style="{
      backgroundImage: `
        linear-gradient(
          rgba(0,0,0,0.4),
          rgba(0,0,0,0.8)
        ),
        url(${background})
      `
    }"
    >
    
        <div class="flex justify-center">
            <Card class="bg-white/80 mt-10 w-[95%] md:w-[60%] ">
                <CardHeader class="border-b-2 border-gray-400 ">
                    <CardTitle><p class="text-xl">Pending</p></CardTitle>
                </CardHeader>
                <CardContent class="space-y-2">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Date Received: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">
                                {{ props.document.date_received ? new Date(props.document.date_received).toLocaleDateString('en-US', { 
                                        year: 'numeric', 
                                        month: 'long', 
                                        day: 'numeric' 
                                }) : "" }}
                            </p>
                        </div>
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Document type: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ props.document.document_type.name ?? "" }}</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1">
                        <div class="grid grid-cols-[30%_70%] md:grid-cols-[15%_85%]">
                            <p class="text-gray-600 text-md"><b>Project/Program: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ props.document.title ?? (props.document.Document_detail.project_or_program ?? "") }}</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1">
                        <div class="grid grid-cols-[30%_70%] md:grid-cols-[15%_85%]">
                            <p class="text-gray-600 text-md"><b>Other Details: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ props.document.document_detail.other_details ?? ""  }}</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Authority/Fund Source: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ document.document_detail.authority_or_fund_source }}</p>
                        </div>
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>NCCA End user: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ document.document_detail?.ncca_end_user?.name ?? "" }}</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Office Concerned: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ document.document_detail?.office_concerned?.name ?? "" }}</p>
                        </div>
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Control number: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ document.control_number ?? "" }}</p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Date Ready: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">
                                {{ props.document.date_time_ready ? new Date(props.document.date_time_ready).toLocaleDateString('en-US', { 
                                        year: 'numeric', 
                                        month: 'long', 
                                        day: 'numeric' 
                                }) : "" }}
                            </p>
                        </div>
                        <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                            <p class="text-gray-600 text-md"><b>Date Released: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">
                                {{ props.document.date_time_ready ? new Date(props.document.date_time_released).toLocaleDateString('en-US', { 
                                        year: 'numeric', 
                                        month: 'long', 
                                        day: 'numeric' 
                                }) : "" }}
                            </p>
                        </div>
                    </div>
                    <div class="grid grid-cols-1">
                        <div class="grid grid-cols-[30%_70%] md:grid-cols-[15%_85%]">
                            <p class="text-gray-600 text-md"><b>Person Claiming/Remarks: </b></p>
                            <p class="text-gray-600 text-md border-b border-gray-300">{{ props.document.document_detail?.remarks ?? "" }}</p>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    </div>
</template>
