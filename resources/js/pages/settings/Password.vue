<script setup lang="ts">
import PasswordController from '@/actions/App/Http/Controllers/Settings/PasswordController';
import InputError from '@/components/InputError.vue';
import AppLayout from '@/layouts/AppLayout.vue';
import SettingsLayout from '@/layouts/settings/Layout.vue';
import { edit } from '@/routes/user-password';
import { Form, Head, useForm } from '@inertiajs/vue3';

import HeadingSmall from '@/components/HeadingSmall.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { type BreadcrumbItem } from '@/types';
import { route } from 'ziggy-js';
import { LoaderCircle } from 'lucide-vue-next';

const breadcrumbItems: BreadcrumbItem[] = [
    {
        title: 'Password settings',
        href: edit().url,
    },
];
const form=useForm({
    'password': '',
    'password_confirmation': '',
    'current_password': '',
})
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head title="Password settings" />

        <SettingsLayout>
            <div class="space-y-6">
                <HeadingSmall
                    title="Update password"
                    description="Ensure your account is using a long, random password to stay secure"
                />
            <Form
                :action="route('user-password.update')"
                method="PUT"
                :reset-on-error="['password', 'password_confirmation', 'current_password']"
                v-slot="{ errors, processing }"
                class="flex flex-col gap-6"
            >
                    <div class="grid gap-2">
                        <Label for="current_password">Current password</Label>
                        <Input
                            id="current_password"
                            name="current_password"
                            type="password"
                            class="mt-1 block w-full"
                            autocomplete="current-password"
                            v-model="form.current_password"
                            placeholder="Current password"
                        />
                        <InputError :message="form.errors.current_password" />
                    </div>

                    <div class="grid gap-2">
                        <Label for="password">New password</Label>
                        <Input
                            id="password"
                            name="password"
                            type="password"
                            class="mt-1 block w-full"
                            v-model="form.password"
                            autocomplete="new-password"
                            placeholder="New password"
                        />
                        <InputError :message="form.errors.password" />
                    </div>

                    <div class="grid gap-2">
                        <Label for="password_confirmation"
                            >Confirm password</Label
                        >
                        <Input
                            id="password_confirmation"
                            name="password_confirmation"
                            type="password"
                            class="mt-1 block w-full"
                            autocomplete="new-password"
                            placeholder="Confirm password"
                            v-model="form.password_confirmation"
                        />
                        <InputError :message="form.errors.password_confirmation" />
                    </div>

                    <div class="flex items-center gap-4">
                          <Button
                                type="submit"
                                class="mt-2 w-full"
                                tabindex="5"
                                :disabled="processing"
                                data-test="register-user-button"
                            >
                                <LoaderCircle v-if="processing" />
                                Save password
                            </Button>
                    </div>
                </Form>
            </div>
        </SettingsLayout>
    </AppLayout>
</template>
