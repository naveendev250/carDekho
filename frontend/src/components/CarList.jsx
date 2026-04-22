import { Box, SimpleGrid } from '@chakra-ui/react'
import CarCard from './CarCard'

export default function CarList({ cars }) {
  if (!cars || cars.length === 0) {
    return null
  }

  return (
    <SimpleGrid columns={{ base: 1, md: 2, lg: 3 }} spacing={6}>
      {cars.map((car, index) => (
        <CarCard key={`${car.id}-${index}`} car={car} rank={index + 1} />
      ))}
    </SimpleGrid>
  )
}
