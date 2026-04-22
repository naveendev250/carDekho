import {
  Box,
  VStack,
  HStack,
  FormControl,
  FormLabel,
  Input,
  Select,
  Button,
  Text,
  useToast,
} from '@chakra-ui/react'
import { useState } from 'react'

export default function FilterForm({ onSubmit, isLoading }) {
  const [formData, setFormData] = useState({
    budget: '10-15',
    body_type: 'Any',
    fuel_type: 'Any',
    mileage_priority: 'medium',
    safety_priority: 'medium',
  })
  
  const toast = useToast()

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: value
    }))
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    
    const [min, max] = formData.budget.split('-').map(Number)
    if (!min || !max || min >= max) {
      toast({
        title: 'Invalid Budget',
        description: 'Please enter a valid budget range (e.g., 10-15)',
        status: 'error',
        duration: 3000,
        isClosable: true,
      })
      return
    }
    
    onSubmit(formData)
  }

  return (
    <Box
      as="form"
      onSubmit={handleSubmit}
      p={8}
      bg="white"
      borderRadius="2xl"
      boxShadow="xl"
      border="1px solid"
      borderColor="gray.100"
    >
      <VStack spacing={6} align="stretch">
        <Text fontSize="xl" fontWeight="600" color="gray.800">
          Find Your Perfect Car
        </Text>

        <FormControl isRequired>
          <FormLabel fontSize="sm" fontWeight="500" color="gray.700">
            Budget Range (₹ Lakhs)
          </FormLabel>
          <Input
            name="budget"
            placeholder="e.g., 10-15"
            value={formData.budget}
            onChange={handleChange}
            size="md"
            fontSize="sm"
          />
          <Text fontSize="xs" color="gray.500" mt={1}>
            Enter as min-max (e.g., 10-15)
          </Text>
        </FormControl>

        <HStack spacing={4}>
          <FormControl>
            <FormLabel fontSize="sm" fontWeight="500" color="gray.700">
              Body Type
            </FormLabel>
            <Select
              name="body_type"
              value={formData.body_type}
              onChange={handleChange}
              size="md"
              fontSize="sm"
            >
              <option value="Any">Any</option>
              <option value="Hatchback">Hatchback</option>
              <option value="Sedan">Sedan</option>
              <option value="SUV">SUV</option>
              <option value="MUV">MUV</option>
            </Select>
          </FormControl>

          <FormControl>
            <FormLabel fontSize="sm" fontWeight="500" color="gray.700">
              Fuel Type
            </FormLabel>
            <Select
              name="fuel_type"
              value={formData.fuel_type}
              onChange={handleChange}
              size="md"
              fontSize="sm"
            >
              <option value="Any">Any</option>
              <option value="Petrol">Petrol</option>
              <option value="Diesel">Diesel</option>
            </Select>
          </FormControl>
        </HStack>

        <HStack spacing={4}>
          <FormControl>
            <FormLabel fontSize="sm" fontWeight="500" color="gray.700">
              Mileage Priority
            </FormLabel>
            <Select
              name="mileage_priority"
              value={formData.mileage_priority}
              onChange={handleChange}
              size="md"
              fontSize="sm"
            >
              <option value="low">Low</option>
              <option value="medium">Medium</option>
              <option value="high">High</option>
            </Select>
          </FormControl>

          <FormControl>
            <FormLabel fontSize="sm" fontWeight="500" color="gray.700">
              Safety Priority
            </FormLabel>
            <Select
              name="safety_priority"
              value={formData.safety_priority}
              onChange={handleChange}
              size="md"
              fontSize="sm"
            >
              <option value="low">Low</option>
              <option value="medium">Medium</option>
              <option value="high">High</option>
            </Select>
          </FormControl>
        </HStack>

        <Button
          type="submit"
          bgGradient="linear(to-r, brand.500, brand.600)"
          color="white"
          size="lg"
          fontSize="sm"
          fontWeight="500"
          _hover={{
            bgGradient: 'linear(to-r, brand.600, brand.700)',
            transform: 'translateY(-2px)',
            boxShadow: 'lg',
          }}
          _active={{
            transform: 'translateY(0)',
          }}
          transition="all 0.2s"
          isLoading={isLoading}
          loadingText="Finding Cars..."
        >
          Find My Car
        </Button>
      </VStack>
    </Box>
  )
}
