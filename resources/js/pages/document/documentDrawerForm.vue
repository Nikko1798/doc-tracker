<script setup lang="ts">
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
const page = usePage() as any
const successMessage = ref<string | null>(null)
const emit = defineEmits(['update:open'])

const defaultPlaceholder = today(getLocalTimeZone())
const dateReceived = ref() as Ref<DateValue>
const dateReady = ref() as Ref<DateValue>
const dateReleased = ref() as Ref<DateValue>
const df = new DateFormatter('en-US', {
  dateStyle: 'long',
})

const NewEmployee=ref('');
const NewOfficeName=ref('');

const form = useForm<{ date_received: string | null, time_received: string | '', 
    document_type: number | null, title: string | '', control_number: string | '',
    complexity: number | null, other_details: string | '', person_claiming_or_remarks: string | '',authority_or_fund_source: string | '',
    ncca_end_user: string | null, office_concerned: string | null, date_ready: string |null, date_released: string | null, time_released: string | '',
    service_to_ncca: string|'', concerned_party_or_supplier: string | '', total_service_amount: number | 0.00,
    NewEmployeeName: string|'', NewOfficeName: string|'' }>({

    date_received:  null,
    time_received: '',
    document_type: null,
    title: '',
    control_number: '',
    complexity: null,
    other_details: '',
    person_claiming_or_remarks: '',
    authority_or_fund_source: '',
    ncca_end_user: null,
    office_concerned: null,
    date_ready: null,
    date_released: null,
    time_released: '',
    service_to_ncca: '',
    concerned_party_or_supplier: '',
    total_service_amount: 0,

    NewEmployeeName: '',
    NewOfficeName: '',

})

watch(dateReceived, (newVal, oldVal) => {
  form.date_received = newVal
    ? newVal.toString() // or toISOString()
    : null
})
watch(dateReady, (newVal, oldVal) => {
  form.date_ready = newVal
    ? newVal.toString() // or toISOString()
    : null
})
watch(dateReleased, (newVal, oldVal) => {
  form.date_released = newVal
    ? newVal.toString() // or toISOString()
    : null
})

watch(
  () => page.props.flash?.success,
  (value) => {
    successMessage.value = value
  },
  { immediate: true }
)

const officeOpen = ref(false)
const empOpen = ref(false)

const selectedEmployee = computed(() =>
    props.employees.find(emp => emp.id === form.ncca_end_user)
)
function selecEmployee(selectedValue: string) {
    form.ncca_end_user = selectedValue === form.ncca_end_user ? '' : selectedValue
    form.NewEmployeeName='';
    empOpen.value = false
}
function selectNewEmployee(){
    form.ncca_end_user=null
    form.NewEmployeeName=NewEmployee.value
    empOpen.value = false
}
const selectedOffice = computed(() =>
    props.offices.find(office => office.id === form.office_concerned),
)
function selectOffice(selectedValue: string) {

    form.office_concerned = selectedValue === form.office_concerned ? '' : selectedValue
    form.NewOfficeName=''
    officeOpen.value = false
}
function selectNewOffice(){
    form.office_concerned=null
    form.NewOfficeName=NewOfficeName.value
    officeOpen.value = false
}

const submit = () => {
  form.patch(route('document.update-document', props.rowData.id),{
    onSuccess: ()=>{
        eventBus.emit('refresh-all-documents');
    }
  })
    
}
function fillForm(){
    successMessage.value=null;
    const document=props.rowData
    console.log(toRaw(document))
    form.document_type=document.document_type_id
    form.date_received=document.date_received
    form.time_received=document.time_received
    form.title=document.title
    form.control_number=document.control_number
    form.complexity=document.complexity_id
    form.other_details=document.other_details
    form.person_claiming_or_remarks=document.remarks
    form.authority_or_fund_source=document.authority_or_fund_source
    form.ncca_end_user=document.ncca_end_user_id
    form.office_concerned=document.office_concerned_id
    form.date_ready=document.date_ready
    form.date_released=document.date_released
    form.time_released=document.time_released
    form.service_to_ncca=document.service_to_ncca ?? ''
    form.concerned_party_or_supplier=document.concerned_party_or_supplier  ?? ''
    form.total_service_amount=document.total_service_amount  ?? 0.00

}
   
    watch(
    () => props.rowData,
    (val) => {
        if (val) fillForm()
        
        console.log(toRaw(form.data()))
    },
    { deep: true }
    )
    const generateQr=((id: number)=>{
        
        window.open(route('document.generateQr', id), '_blank')
    });
</script>
    
    <template>
        
      <Sheet :open="props.open" @update:open="emit('update:open', $event)">
        <!-- <SheetTrigger @click="fillForm" >
            <Button class="bg-blue-500 hover:bg-blue-800 hover:cursor-pointer"><PenBox></PenBox> Update</Button>
        </SheetTrigger> -->
        <SheetContent class="md:w-[45%] w-[95%] overflow-y-auto">
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
                                <Label>Date received</Label>
                                <div class="date_received_date">
                                    <Popover v-slot="{ close }" class="w-full">
                                        <PopoverTrigger as-child>
                                        <Button
                                            variant="outline"
                                            :class="cn('w-full justify-start text-left font-normal', !dateReceived && 'text-muted-foreground')"
                                        >
                                            <CalendarIcon />
                                            {{ dateReceived ? df.format(dateReceived.toDate(getLocalTimeZone())) : 
                                                (
                                                    rowData.date_received ?
                                                    new Date(rowData.date_received).toLocaleDateString('en-US', {
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
                                        
                                            v-model="dateReceived"
                                            :default-placeholder="defaultPlaceholder"
                                            layout="month-and-year"
                                            initial-focus
                                            @update:model-value="close"
                                        />
                                        </PopoverContent>
                                    </Popover>
                                </div>
                                <InputError :message="form.errors.date_received"></InputError>
                            </div>
                        </div>

                        <div class="space-y-2">
                            <Label>Time received</Label>
                            <Input type="time"  v-model="form.time_received"
                            id="time_received" name="time_received" placeholder="enter time received here...."/>
                            <InputError :message="form.errors.time_received"></InputError>
                        </div>
                    </div>
                   
                    
                    <div class="space-y-2">
                        <Label>Document type</Label>
                        
                        <Select v-model="form.document_type">
                            <SelectTrigger class="w-full">
                            <SelectValue placeholder="Select a document type" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectGroup>
                                    <SelectItem v-for="value in documentTypes" :key="value.id" :value="value.id">
                                        {{value.name}}
                                    </SelectItem>
                                </SelectGroup>
                            </SelectContent>
                        </Select>
                        <InputError :message="form.errors.document_type"></InputError>
                    </div>
                </div>

                <div class="grid grid-cols-1 gap-2">
                    <div class="space-y-2">
                        <Label>Title</Label>
                        <Input type="text"  v-model="form.title"
                        id="title" name="title" placeholder="enter title here...."/>
                        <InputError :message="form.errors.title"></InputError>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Control Number</Label>
                        <Input type="text" v-model="form.control_number" id="control_number" name="control_number"
                        placeholder="enter control number here...."/>
                        <InputError :message="form.errors.control_number"></InputError>
                    </div>
                    <div class="space-y-2">
                        <Label>Simple/Complex</Label>
                        
                        <Select v-model="form.complexity" >
                            <SelectTrigger class="w-full">
                            <SelectValue placeholder="Select a complexity" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectGroup>
                                    <SelectItem v-for="value in complexities" :key="value.id" :value="value.id">
                                        {{value.codevalue}}
                                    </SelectItem>
                                </SelectGroup>
                            </SelectContent>
                        </Select>
                        <InputError :message="form.errors.complexity"></InputError>
                    </div>
                </div>

                <div class="grid grid-cols-1  gap-2">
                    <div class="space-y-2">
                        <Label>Other details</Label>
                        <Textarea v-model="form.other_details" id="other_details" name="other_details" rows="2" placeholder="enter other details here...."></Textarea>
                        <InputError :message="form.errors.other_details"></InputError>
                    </div>
                </div>
                <div class="grid grid-cols-1  gap-2">
                    <div class="space-y-2">
                        <Label>Person claiming/Remarks</Label>
                        <Textarea v-model="form.person_claiming_or_remarks" id="person_claiming_or_remarks" 
                        name="person_claiming_or_remarks" rows="2" placeholder="enter remarks here...."></Textarea>
                        <InputError :message="form.errors.person_claiming_or_remarks"></InputError>
                    </div>
                </div>

                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Authority/Fund Source</Label>
                        <Input type="text" v-model="form.authority_or_fund_source" id="authority_or_fund_source" name="authority_or_fund_source"
                        placeholder="enter authority or fund source here...."/>
                        <InputError :message="form.errors.authority_or_fund_source"></InputError>
                    </div>

                    <div class="space-y-2">
                        <Label>NCCA End User</Label>
                        <div class="ncca_end_user_div">
                            <Popover v-model:open="empOpen">
                                <PopoverTrigger as-child>
                                <Button
                                    variant="outline"
                                    role="combobox"
                                    :aria-expanded="empOpen"
                                    class="w-full justify-between"
                                >
                                    {{ selectedEmployee?.name || (form.NewEmployeeName? form.NewEmployeeName : 'Employee...') }}
                                    <ChevronsUpDownIcon class="opacity-50" />
                                </Button>
                                </PopoverTrigger>
                                <PopoverContent class="w-full p-0">
                                <Command>
                                    <CommandInput class="h-9 border border-gray-300 rounded-lg p-4 " placeholder="Search employee..." v-model="NewEmployee" />
                                    <CommandList>
                                    <CommandEmpty class=" pr-2 pl-2">
                                        <Badge @click="selectNewEmployee" class="bg-blue-500 w-full hover:cursor-pointer hover:bg-blue-800">
                                            Add this to the list
                                        </Badge>
                                    </CommandEmpty>
                                    <CommandGroup class="bg-gray-300">
                                        <CommandItem
                                        class="hover:cursor-pointer hover:bg-gray-200"
                                        v-for="emp in props.employees"
                                        :key="emp.id"
                                        :value="emp.id"
                                        @select="(ev) => {
                                            selecEmployee(ev.detail.value as string)
                                        }"
                                        >
                                        {{ emp.name }}
                                        <CheckIcon
                                            :class="cn(
                                            'ml-auto',
                                            form.ncca_end_user === emp.id ? 'opacity-100' : 'opacity-0',
                                            )"
                                        />
                                        </CommandItem>
                                    </CommandGroup>
                                    </CommandList>
                                </Command>
                                </PopoverContent>
                            </Popover>
                        </div>
                        <InputError :message="form.errors.ncca_end_user"></InputError>
                        <!-- <Input type="text" id="ncca_end_user" name="ncca_end_user"
                        placeholder="enter NCCA end user here...."/> -->
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
                            <InputError :message="form.errors.date_ready"></InputError>
                        </div>
                    </div>

                    <div class="space-y-2 grid grid-cols-2 gap-2">
                        <div class="space-y-2">
                            <Label>Date released</Label>
                            <div class="date_released_div">
                                <Popover v-slot="{ close }" class="w-full">
                                    <PopoverTrigger as-child>
                                    <Button
                                        variant="outline"
                                        :class="cn('w-full justify-start text-left font-normal', !dateReleased && 'text-muted-foreground')"
                                    >
                                        <CalendarIcon />
                                        <!-- {{ dateReleased ? df.format(dateReleased.toDate(getLocalTimeZone())) : "Pick a date" }} -->
                                        {{ dateReleased ? df.format(dateReleased.toDate(getLocalTimeZone())) : 
                                            (
                                                rowData.date_released ?
                                                new Date(rowData.date_released).toLocaleDateString('en-US', {
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
                                        v-model="dateReleased"
                                        :default-placeholder="defaultPlaceholder"
                                        layout="month-and-year"
                                        initial-focus
                                        @update:model-value="close"
                                    />
                                    </PopoverContent>
                                </Popover>
                            </div>
                            <InputError :message="form.errors.date_released"></InputError>
                        </div>
                        
                        <div class="space-y-2">
                            <Label>Time released</Label>
                            <Input v-model="form.time_released" type="time" id="time_released" name="time_released"
                            placeholder="Pick a time"/>
                            <InputError :message="form.errors.time_released"></InputError>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-[50%_25%_25%] gap-2">
                    <div class="space-y-2">
                        <Label>Office Concerned</Label>
                        <div class="office_concerned_div">
                            <Popover v-model:open="officeOpen">
                                <PopoverTrigger as-child>
                                <Button
                                    variant="outline"
                                    role="combobox"
                                    :aria-expanded="officeOpen"
                                    class="w-full justify-between"
                                >
                                    {{ selectedOffice?.name || (form.NewOfficeName ? form.NewOfficeName : "Office...") }}
                                    <ChevronsUpDownIcon class="opacity-50" />
                                </Button>
                                </PopoverTrigger>
                                <PopoverContent class="w-full p-0">
                                <Command>
                                    <CommandInput class="h-9" placeholder="Search office..." v-model="NewOfficeName" />
                                    <CommandList>
                                    <CommandEmpty>
                                        <Badge @click="selectNewOffice" class="bg-blue-500 w-full hover:cursor-pointer hover:bg-blue-800">
                                            Add this to the list
                                        </Badge>
                                    </CommandEmpty>
                                    <CommandGroup>
                                        <CommandItem
                                        v-for="office in props.offices"
                                        :key="office.id"
                                        :value="office.id"
                                        @select="(ev) => {
                                            selectOffice(ev.detail.value as string)
                                        }"
                                        >
                                        {{ office.name }}
                                        <CheckIcon
                                            :class="cn(
                                            'ml-auto',
                                            form.office_concerned === office.id ? 'opacity-100' : 'opacity-0',
                                            )"
                                        />
                                        </CommandItem>
                                    </CommandGroup>
                                    </CommandList>
                                </Command>
                                </PopoverContent>
                            </Popover>
                        </div>
                        <InputError :message="form.errors.office_concerned"></InputError>
                    </div>

                    
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Service to NCCA</Label>
                        <Input type="text" v-model="form.service_to_ncca" id="service_to_ncca" name="service_to_ncca"
                        placeholder="enter service to ncca here...."/>
                        <InputError :message="form.errors.service_to_ncca"></InputError>
                    </div>
                    <div class="space-y-2">
                        <Label>Concerned Party/Supplier</Label>
                        <Input type="text" v-model="form.concerned_party_or_supplier" id="concerned_party_or_supplier" name="concerned_party_or_supplier"
                        placeholder="enter concerned party or supplier here...."/>
                        <InputError :message="form.errors.concerned_party_or_supplier"></InputError>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
                    <div class="space-y-2">
                        <Label>Total Service Amount (Php.)</Label>
                        <Input type="number" v-model="form.total_service_amount"
                        id="total_service_amount" name="total_service_amount"
                        placeholder="enter total service amount here...."/>
                        <InputError :message="form.errors.total_service_amount"></InputError>
                    </div>
                </div>
                
                <div v-if="$page.props.auth.user" class="flex items-center justify-center space-x-4" >
                <Button type="button" @click="submit" class="cursor-pointer">Submit</Button>
                <Button type="button" @click="generateQr(rowData.id)" class="cursor-pointer">Generate QR</Button>
                </div>
                
            </Form>
          </SheetHeader>
        </SheetContent>
      </Sheet>
    </template>
    