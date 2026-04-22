import {
  Box,
  VStack,
  HStack,
  Text,
  Badge,
  Divider,
  Stat,
  StatLabel,
  StatNumber,
  StatGroup,
  Tooltip,
} from '@chakra-ui/react'

export default function CarCard({ car, rank }) {
  const scoreColor = car.score >= 0.7 ? 'green' : car.score >= 0.5 ? 'orange' : 'gray'
  
  return (
    <Box
      p={5}
      bg="white"
      borderRadius="xl"
      boxShadow="md"
      border="1px solid"
      borderColor="gray.100"
      transition="all 0.3s"
      _hover={{
        transform: 'translateY(-4px)',
        boxShadow: 'xl',
        borderColor: 'brand.200',
      }}
      position="relative"
    >
      <Badge
        position="absolute"
        top={3}
        right={3}
        colorScheme="brand"
        fontSize="xs"
        px={2}
        py={1}
        borderRadius="md"
      >
        #{rank}
      </Badge>

      <VStack align="stretch" spacing={3}>
        <Box>
          <Text fontSize="xs" fontWeight="500" color="brand.500" mb={1}>
            {car.brand}
          </Text>
          <Text fontSize="md" fontWeight="600" color="gray.800" lineHeight="1.3">
            {car.model} {car.variant}
          </Text>
          <Text fontSize="xs" color="gray.500" mt={1}>
            {car.fuel_type} • {car.transmission}
          </Text>
        </Box>

        <HStack spacing={2}>
          <Badge colorScheme={scoreColor} fontSize="xs" px={2} py={1}>
            Score: {car.score}
          </Badge>
          <Badge colorScheme="purple" fontSize="xs" px={2} py={1}>
            {car.body_type}
          </Badge>
          {car.safety_rating >= 4 && (
            <Tooltip label={`${car.safety_rating} Star Safety Rating`}>
              <Badge colorScheme="green" fontSize="xs" px={2} py={1}>
                {car.safety_rating}★
              </Badge>
            </Tooltip>
          )}
        </HStack>

        <Divider />

        <StatGroup>
          <Stat size="sm">
            <StatLabel fontSize="xs" color="gray.600">Price</StatLabel>
            <StatNumber fontSize="sm" color="gray.800">₹{car.price_lakh}L</StatNumber>
          </Stat>
          <Stat size="sm">
            <StatLabel fontSize="xs" color="gray.600">Mileage</StatLabel>
            <StatNumber fontSize="sm" color="gray.800">{car.mileage_kmpl}</StatNumber>
          </Stat>
          <Stat size="sm">
            <StatLabel fontSize="xs" color="gray.600">Engine</StatLabel>
            <StatNumber fontSize="sm" color="gray.800">{car.engine_cc}cc</StatNumber>
          </Stat>
        </StatGroup>

        {(car.adas || car.airbags > 4) && (
          <HStack spacing={2} mt={1}>
            {car.adas && (
              <Badge colorScheme="blue" fontSize="xs" variant="subtle">
                ADAS
              </Badge>
            )}
            {car.airbags > 4 && (
              <Badge colorScheme="green" fontSize="xs" variant="subtle">
                {car.airbags} Airbags
              </Badge>
            )}
          </HStack>
        )}
      </VStack>
    </Box>
  )
}
