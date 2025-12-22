import { ref, onMounted } from 'vue';

type Appearance = 'light' | 'dark' | 'system';

const appearance = ref<Appearance>('light');

const updateTheme = (value: Appearance) => {
    if (typeof window === 'undefined') return;

    // Always force light mode
    document.documentElement.classList.remove('dark');
};

const setCookie = (name: string, value: string, days = 365) => {
    if (typeof document === 'undefined') return;

    const maxAge = days * 24 * 60 * 60;
    document.cookie = `${name}=${value};path=/;max-age=${maxAge};SameSite=Lax`;
};

export function useAppearance() {
    onMounted(() => {
        // Always light
        appearance.value = 'light';
        localStorage.setItem('appearance', 'light');
        setCookie('appearance', 'light');
        updateTheme('light');
    });

    function updateAppearance(value: Appearance) {
        // Ignore input, always light
        appearance.value = 'light';
        localStorage.setItem('appearance', 'light');
        setCookie('appearance', 'light');
        updateTheme('light');
    }

    return {
        appearance,
        updateAppearance,
    };
}

export function initializeTheme() {
    // Always set light mode on initialization
    if (typeof window === 'undefined') return;
    document.documentElement.classList.remove('dark');
    localStorage.setItem('appearance', 'light');
    setCookie('appearance', 'light');
}
