import { useState } from 'react'
import {
  Container,
  VStack,
  Box,
  Text,
  Heading,
  useToast,
  Flex,
} from '@chakra-ui/react'
import FilterForm from './components/FilterForm'
import CarList from './components/CarList'
import AIExplanation from './components/AIExplanation'
import { streamCarRecommendations } from './services/api'

export default function App() {
  const [cars, setCars] = useState([])
  const [explanation, setExplanation] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [isStreaming, setIsStreaming] = useState(false)
  const toast = useToast()

  const handleSubmit = async (query) => {
    setIsLoading(true)
    setCars([])
    setExplanation('')
    setIsStreaming(false)

    try {
      for await (const data of streamCarRecommendations(query)) {
        if (data.type === 'recommendations') {
          setCars(data.data.top_cars)
          setIsLoading(false)
          
          if (data.data.top_cars.length === 0) {
            toast({
              title: 'No Cars Found',
              description: data.data.message || 'Try adjusting your filters',
              status: 'info',
              duration: 5000,
              isClosable: true,
            })
          }
        } else if (data.type === 'explanation_start') {
          setIsStreaming(true)
        } else if (data.type === 'explanation_chunk') {
          setExplanation(prev => prev + data.data)
        } else if (data.type === 'explanation_end') {
          setIsStreaming(false)
        }
      }
    } catch (error) {
      setIsLoading(false)
      setIsStreaming(false)
      toast({
        title: 'Error',
        description: error.message || 'Failed to get recommendations',
        status: 'error',
        duration: 5000,
        isClosable: true,
      })
    }
  }

  return (
    <Box minH="100vh" bgGradient="linear(to-br, gray.50, blue.50)">
      <Container maxW="container.xl" py={10}>
        <VStack spacing={8} align="stretch">
          <Box textAlign="center">
            <Heading
              size="xl"
              bgGradient="linear(to-r, brand.600, brand.400)"
              bgClip="text"
              fontWeight="700"
              mb={2}
            >
              CarDekho
            </Heading>
            <Text fontSize="sm" color="gray.600" fontWeight="500">
              AI-Powered Car Recommendations
            </Text>
          </Box>

          <FilterForm onSubmit={handleSubmit} isLoading={isLoading} />

          {(cars.length > 0 || isLoading) && (
            <VStack spacing={6} align="stretch">
              {cars.length > 0 && (
                <>
                  <Flex justify="space-between" align="center">
                    <Text fontSize="lg" fontWeight="600" color="gray.800">
                      Top Recommendations
                    </Text>
                    <Text fontSize="sm" color="gray.600">
                      {cars.length} cars found
                    </Text>
                  </Flex>
                  <CarList cars={cars} />
                </>
              )}

              {(explanation || isStreaming) && (
                <AIExplanation
                  explanation={explanation}
                  isStreaming={isStreaming}
                />
              )}
            </VStack>
          )}
        </VStack>
      </Container>
    </Box>
  )
}
