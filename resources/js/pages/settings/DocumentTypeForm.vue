<script setup lang="ts">
import { Button } from '@/components/ui/button'
import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Form, useForm, usePage } from '@inertiajs/vue3';
import { route } from 'ziggy-js'
import Alert from '@/components/ui/alert/Alert.vue'
import { CheckCheck, LoaderCircle, LoaderCircleIcon } from 'lucide-vue-next'
import AlertTitle from '@/components/ui/alert/AlertTitle.vue'
import axios from 'axios'
import { toast } from 'vue-sonner'
import { Toaster } from 'vue-sonner'
import { ref } from 'vue'
const form=useForm({
    name: '',
    parentId: 1,
})
const page=usePage() as any;
const isSubmitting=ref(false)
const submit=( async ()=>{
    if (isSubmitting.value) return // 🚫 block double submit

    isSubmitting.value = true
    await axios.post(route('doc-type.store-child'),form.data())
    .then(response => {
    toast.success('Submitted successfully');
    form.reset()
    isSubmitting.value = false
    console.log(response.data)
    })
    .catch(error => {
        alert('error')
    console.error(error.response.data)
    })
})
</script>

<template>
    <Dialog>
      <DialogTrigger as-child>
        
        <Button variant="outline" class="w-full flex items-center justify-start cursor-pointer">
            New Document type
        </Button>
        </DialogTrigger>
            <DialogContent class="sm:max-w-[425px]">
                <DialogHeader>
                <DialogTitle>New Document tyoe</DialogTitle>
                </DialogHeader>
                <div v-if="page.props.flash.success" class="grid">
                    <Alert  class="bg-green-800 text-white">
                        <CheckCheck ></CheckCheck>
                        <AlertTitle >{{ page.props.flash.success }}</AlertTitle>
                    </Alert>
                </div>
            
                <div class="grid gap-3 mt-4">
                    <Label>Type</Label>
                    <Select v-model="form.parentId">
                        <SelectTrigger class="w-full">
                            <SelectValue placeholder="Select a parent document" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectGroup>
                                <SelectItem v-for="item in page.props.parentDocumentTypes" 
                                :value="item.id" :key="item.id">
                                    {{item.name}}
                                </SelectItem>
                            </SelectGroup>
                        </SelectContent>
                    </Select>
                </div>
                <div class="grid gap-3 mt-4">
                    <Label for="name">Document type</Label>
                    <Input v-model="form.name" id="name" name="name" 
                     />
                </div>
            
                
                <DialogFooter>
                    <DialogClose as-child>
                        <Button variant="outline">
                        Cancel
                        </Button>
                    </DialogClose>
                    <Button
                        @click="submit"
                        type="button"
                        class="mt-2 w-full"
                        tabindex="5"
                        data-test="register-user-button"
                        :disabled="isSubmitting"
                    >
                        <LoaderCircleIcon v-if="isSubmitting" />
                        Save
                    </Button>
                </DialogFooter>
            </DialogContent>
       
  </Dialog>
</template>
