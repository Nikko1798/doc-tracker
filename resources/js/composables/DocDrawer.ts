import { route } from 'ziggy-js'
import axios from 'axios'
import { eventBus } from '@/composables/mitt'
import { usePage } from '@inertiajs/vue3'
import {toast} from 'vue-sonner'
import { DateFormatter, getLocalTimeZone, today } from '@internationalized/date'
import { ref, type Ref, toRaw, watch, computed, PropType, onMounted } from 'vue'
import { Form, useForm } from '@inertiajs/vue3'

import type { DateValue } from '@internationalized/date'
export function useDocDrawerScript(){
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
    return {props, emit, successMessage, form, dateReceived, df, defaultPlaceholder, empOpen, selecEmployee, selectNewEmployee, dateReady,dateReleased, officeOpen, NewOfficeName, selectOffice, generateQr, submit, selectedEmployee, selectedOffice, NewEmployee, selectNewOffice}
}