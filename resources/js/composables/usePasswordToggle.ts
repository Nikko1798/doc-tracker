import { ref, computed } from 'vue'

export function usePasswordToggle() {
  const isPasswordHidden = ref(true)

  const inputType = computed(() =>
    isPasswordHidden.value ? 'password' : 'text'
  )

  function togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value
  }

  return {
    isPasswordHidden,
    inputType,
    togglePassword,
  }
}

