<template>
    <SheetContent class="md:w-[55%] w-[95%] overflow-y-auto">
        <SheetHeader>
            <div class="grid p-5">
                <Alert v-if="successMessage" class="bg-green-700 text-white">
                    <CheckCheck ></CheckCheck>
                    <AlertTitle >{{successMessage}}</AlertTitle>
                </Alert>
            </div>
            <Form class="p-5 space-y-5" 
                v-slot="{ errors, processing }">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                
                    <div class="grid grid-cols-2 gap-2">
                        <div class="space-y-2">
                            <div class="space-y-2">
                                <Label>Date receivedss</Label>
                                <Input readonly type="date"  v-model="rowData.date_received"
                                id="time_received" name="time_received" placeholder="enter time received here...."/>
                            </div>
                        </div>

                        <div class="space-y-2">
                            <Label>Time received</Label>
                            <Input readonly type="time"  v-model="rowData.time_received"
                            id="time_received" name="time_received" placeholder="enter time received here...."/>
                          
                        </div>
                    </div>
                
                    
                    <div class="space-y-2">
                        <Label>Document type</Label>
                        
                        <Input readonly type="text"  v-model="rowData.document_type"
                        id="time_received" name="time_received" placeholder="enter time received here...."/>
                    </div>
                </div>

                <div class="grid grid-cols-1 gap-2">
                    <div class="space-y-2">
                        <Label>Title</Label>
                        <Input readonly type="text"  v-model="rowData.title"
                        id="title" name="title" placeholder="enter title here...."/>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Control Number</Label>
                        <Input readonly type="text" v-model="rowData.control_number" id="control_number" name="control_number"
                        placeholder="enter control number here...."/>   
                    </div>
                    <div class="space-y-2">
                        <Label>Simple/Complex</Label>
                        
                        <Input readonly type="text" v-model="rowData.complexity" id="complexity" name="complexity"
                        placeholder="enter control number here...."/>   
                    </div>
                </div>

                <div class="grid grid-cols-1  gap-2">
                    <div class="space-y-2">
                        <Label>Other details</Label>
                        <Textarea readonly v-model="rowData.other_details" id="other_details" name="other_details" rows="2" placeholder="enter other details here...."></Textarea>
                     
                    </div>
                </div>
                <div class="grid grid-cols-1  gap-2">
                    <div class="space-y-2">
                        <Label>Person claiming/Remarks</Label>
                        <Textarea readonly v-model="rowData.remarks" id="person_claiming_or_remarks" 
                        name="person_claiming_or_remarks" rows="2" placeholder="enter remarks here...."></Textarea>

                    </div>
                </div>

                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Authority/Fund Source</Label>
                        <Input readonly type="text" v-model="rowData.authority_or_fund_source" 
                        id="authority_or_fund_source" name="authority_or_fund_source"
                        placeholder="enter authority or fund source here...."/>
                    </div>

                    <div class="space-y-2">
                        <Label>NCCA End User</Label>
                        <Input readonly type="text" v-model="rowData.ncca_end_user" 
                        id="ncca_end_user" name="ncca_end_user"
                        placeholder="enter authority or fund source here...."/>
                      </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2 grid grid-cols-1 gap-2">
                        <div class="space-y-2">
                            <Label>Date ready</Label>
                            <div class="date_ready_div">
                                <Popover v-slot="{ close }" class="w-full">
                                    <PopoverTrigger as-child>
                                    <Button
                                        variant="outline"
                                        :class="cn('w-full justify-start text-left font-normal', !dateReady && 'text-muted-foreground')"
                                    >
                                        <CalendarIcon />
                                        <!-- {{ dateReady ? df.format(dateReady.toDate(getLocalTimeZone())) : "Pick a date" }} -->
                                        {{ dateReady ? df.format(dateReady.toDate(getLocalTimeZone())) : 
                                            (
                                                rowData.date_ready ?
                                                new Date(rowData.date_ready).toLocaleDateString('en-US', {
                                                    year: 'numeric',
                                                    month: 'long',
                                                    day: 'numeric',
                                                })
                                                : "Pick a date" 
                                            )
                                        }}
                                    </Button>
                                    </PopoverTrigger>
                                    <PopoverContent class="w-auto p-0" align="start">
                                    <Calendar
                                        v-model="dateReady"
                                        :default-placeholder="defaultPlaceholder"
                                        layout="month-and-year"
                                        initial-focus
                                        @update:model-value="close"
                                    />
                                    </PopoverContent>
                                </Popover>
                            </div>
                        </div>
                    </div>

                    <div class="space-y-2 grid grid-cols-2 gap-2">
                        <div class="space-y-2">
                            <Label>Date released</Label>
                             <Input readonly type="date" v-model="rowData.date_released" 
                            id="date_released" name="date_released"/>
                    
                        </div>
                        
                        <div class="space-y-2">
                            <Label>Time released</Label>
                            <Input readonly v-model="rowData.time_released" type="time" id="time_released" name="time_released"
                            placeholder="Pick a time"/>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-[50%_25%_25%] gap-2">
                    <div class="space-y-2">
                        <Label>Office Concerned</Label>
                        <Input readonly v-model="rowData.office_concerned" 
                        type="text" id="office_concerned" name="office_concerned"
                        placeholder="Office concerned"/>
                    </div>

                    
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Service to NCCA</Label>
                        <Input readonly type="text" v-model="rowData.service_to_ncca" id="service_to_ncca" name="service_to_ncca"
                        placeholder="enter service to ncca here...."/>
                    </div>
                    <div class="space-y-2">
                        <Label>Concerned Party/Supplier</Label>
                        <Input readonly type="text" v-model="rowData.concerned_party_or_supplier" id="concerned_party_or_supplier" name="concerned_party_or_supplier"
                        placeholder="enter concerned party or supplier here...."/>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Total Service Amount (Php.)</Label>
                        <Input type="number" v-model="rowData.total_service_amount"
                        id="total_service_amount" name="total_service_amount"
                        placeholder="enter total service amount here...."/>
                    </div>
                </div>
                
            
            </Form>
        </SheetHeader>
    </SheetContent>
</template>

<script lang="ts" setup>
import {
    Sheet,
    SheetContent,
    SheetDescription,
    SheetHeader,
    SheetTitle,
    SheetTrigger,
} from '@/components/ui/sheet'
import type { DateValue } from '@internationalized/date'
import { DateFormatter, getLocalTimeZone, today } from '@internationalized/date'
import { CalendarIcon, CheckCheck, PenBox } from 'lucide-vue-next'
import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Calendar } from '@/components/ui/calendar'
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover'
import Input from '@/components/ui/input/Input.vue'
import Label from '@/components/ui/label/Label.vue'
import { ref, type Ref, toRaw, watch, computed, PropType, onMounted } from 'vue'
import { Form, useForm } from '@inertiajs/vue3'
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import Textarea from '@/components/ui/textarea/Textarea.vue'
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
} from '@/components/ui/command'
import {
  Alert,
  AlertDescription,
  AlertTitle,
} from '@/components/ui/alert'
import Badge from '@/components/ui/badge/Badge.vue'
import { CheckIcon, ChevronsUpDownIcon } from 'lucide-vue-next'
import InputError from '@/components/InputError.vue'
import { route } from 'ziggy-js'
import axios from 'axios'
import { eventBus } from '@/composables/mitt'
import { usePage } from '@inertiajs/vue3'
import {toast} from 'vue-sonner'
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

    rowData: {
        type: Object as PropType<Record<string, any>>,
        default: ()=>{}
    },
    open: {
        type: Boolean,
        default: false,
    },
});
const page=usePage() as any;
const successMessage = ref<string | null>(null)


const defaultPlaceholder = today(getLocalTimeZone())
const dateReceived = ref() as Ref<DateValue>
const dateReady = ref() as Ref<DateValue>
const dateReleased = ref() as Ref<DateValue>
const df = new DateFormatter('en-US', {
  dateStyle: 'long',
})
</script>