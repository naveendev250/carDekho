import { ChakraProvider } from '@chakra-ui/react'
import { theme } from './utils/theme'
import App from './App'

export default function Root() {
  return (
    <ChakraProvider theme={theme}>
      <App />
    </ChakraProvider>
  )
}
