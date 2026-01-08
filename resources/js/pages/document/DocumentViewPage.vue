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
    <div class="flex justify-center">
        <Card class="bg-red-300 mt-10 w-[95%] md:w-[80%]">
            <CardHeader>
                <CardTitle>Pending</CardTitle>
            </CardHeader>
            <CardContent class="space-y-2">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Date Received: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">
                             {{ props.document.date_received ? new Date(props.document.date_received).toLocaleDateString('en-US', { 
                                    year: 'numeric', 
                                    month: 'long', 
                                    day: 'numeric' 
                            }) : "" }}
                        </p>
                    </div>
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Document type: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">{{ props.document.document_type.name ?? "" }}</p>
                    </div>
                </div>
                <div class="grid grid-cols-1">
                    <div class="grid grid-cols-[30%_70%] md:grid-cols-[15%_85%]">
                        <p class="text-gray-600 text-md"><b>Project/Program: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">{{ props.document.title ?? (props.document.Document_detail.project_or_program ?? "") }}</p>
                    </div>
                </div>
                <div class="grid grid-cols-1">
                    <div class="grid grid-cols-[30%_70%] md:grid-cols-[15%_85%]">
                        <p class="text-gray-600 text-md"><b>Other Details: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">{{ props.document.document_detail.other_details ?? ""  }}</p>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Authority/Fund Source: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">{{ document.document_detail.authority_or_fund_source }}</p>
                    </div>
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>NCCA End user: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">d</p>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Office Concerned: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">d</p>
                    </div>
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Control number: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">d</p>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Date Ready: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">d</p>
                    </div>
                    <div class="grid grid-cols-[30%_70%] lg:grid-cols-[30%_70%]">
                        <p class="text-gray-600 text-md"><b>Date Released: </b></p>
                        <p class="text-gray-600 text-md bg-blue-300">d</p>
                    </div>
                </div>
                
            </CardContent>
        </Card>
    </div>
</template>
