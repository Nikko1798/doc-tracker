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
import SheetDawerAuth from './SheetDawerAuth.vue'
import SheetDrawerGuest from './SheetDrawerGuest.vue'
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
const emit = defineEmits(['update:open'])
</script>
    
    <template>
        
      <Sheet :open="props.open" @update:open="emit('update:open', $event)">
        <!-- <SheetTrigger @click="fillForm" >
            <Button class="bg-blue-500 hover:bg-blue-800 hover:cursor-pointer"><PenBox></PenBox> Update</Button>
        </SheetTrigger> -->
        <SheetDawerAuth v-if="page.props.auth.user" :documentTypes="documentTypes" :complexities="complexities" :offices="offices"
        :employees="employees" :rowData="rowData"/> 
         <SheetDrawerGuest v-else :documentTypes="documentTypes" :complexities="complexities" :offices="offices"
        :employees="employees" :rowData="rowData"/>  
        
      </Sheet>
    </template>
    