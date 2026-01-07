<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert'
import InputError from '@/components/InputError.vue';
import TextLink from '@/components/TextLink.vue';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthBase from '@/layouts/AuthLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import { LoaderCircle, Eye, EyeClosed } from 'lucide-vue-next';
import { route } from 'ziggy-js';
import { onMounted, ref, computed } from 'vue';
import { usePasswordToggle } from '@/composables/usePasswordToggle';
import logo from '@/assets/images/Logo2.png';
defineProps<{
    status?: string;
    canResetPassword: boolean;
}>();
const {isPasswordHidden, inputType, togglePassword} = usePasswordToggle();


const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
onMounted(()=>{
    const appUrl = import.meta.env.VITE_BASE_URL;
console.log(appUrl); // https://example.com
})
const page=usePage() as any;
</script> 

<template>
    <AuthBase title="" description="">
        <Head title="Log in" />
        <div class="flex flex-col items-center justify-center space-y-2">   
            <img :src="logo" class="w-15 h-15 object-contain mt-2" />
            <div class="flex items-center gap-4"> 
                <!-- use flex instead of grid -->
                <p class="text-center  text-2xl flex items-center">
                <span class="text-gray-700">Legal Section - Document Tracker</span>
                <!-- <span class="text-green-600">E</span>
                <span class="text-orange-600">L</span>
                <span class="text-blue-600">C</span>
                <span class="text-yellow-500">O</span>
                <span class="text-pink-600">M</span>
                <span class="text-violet-600">E</span> -->
                </p>
            </div>
            <p class=" text-sm text-gray-600">
                Please enter your credentials below to login
            </p>
        </div>


        <div v-if="page.props.errors.auth_error">
            <Alert variant="destructive">
                <AlertCircle class="w-4 h-4" />
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>
                    {{ page.props.errors.auth_error }}
                </AlertDescription>
            </Alert>
        </div>
        <div v-if="page.props.flash.success">
            <Alert class="border-green-500 text-green-700 bg-green-50 mb-5">
                <AlertCircle class="w-4 h-4 text-green-700" />
                <AlertTitle>Success!!</AlertTitle>
                <AlertDescription>
                    {{ page.props.flash.success }}
                </AlertDescription>
            </Alert>
        </div>
        <form @submit.prevent="submit" class="flex flex-col gap-6">
            <div class="grid gap-6">
                <div class="grid gap-2">
                    <Label for="email">Login ID</Label>
                    <Input
                        id="email"
                        type="text"
                        required
                        autofocus
                        :tabindex="1"
                        v-model="form.email"
                        placeholder="Enter your login id here..."
                    />
                    <InputError :message="form.errors.email" />
                </div>

                <div class="grid gap-2">
                    <div class="flex items-center justify-between">
                        <Label for="password">Password</Label>
                        <TextLink v-if="canResetPassword" :href="route('password.request')" class="text-sm" :tabindex="5">
                            Forgot password?
                        </TextLink>
                    </div>
                    <div class="relative">
                        <Input
                            id="password"
                            :type="inputType"
                            required
                            :tabindex="2"
                            autocomplete="current-password"
                            v-model="form.password"
                            placeholder="Password"
                        />
                        <EyeClosed @click="togglePassword" v-if="isPasswordHidden" class="absolute right-3 top-1/2 -translate-y-1/2 cursor-pointer text-gray-500" />
                        <Eye @click="togglePassword" v-else class="absolute right-3 top-1/2 -translate-y-1/2 cursor-pointer text-gray-500" />
                           
                    </div>

                    <InputError :message="form.errors.password" />
                </div>

                <div class="flex items-center justify-between" :tabindex="3">
                    <Label for="remember" class="flex items-center space-x-3">
                        <Checkbox id="remember" v-model:checked="form.remember" :tabindex="4" />
                        <span>Remember me</span>
                    </Label>
                </div>

                <Button type="submit" class="mt-4 w-full button-submit" :tabindex="4" :disabled="form.processing">
                    <LoaderCircle v-if="form.processing" class="h-4 w-4 animate-spin" />
                    Log in
                </Button>
            </div>
        </form>
    </AuthBase>
</template>
