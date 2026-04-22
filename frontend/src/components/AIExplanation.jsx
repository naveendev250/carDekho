import { Box, Text, VStack, Spinner, HStack } from '@chakra-ui/react'

export default function AIExplanation({ explanation, isStreaming }) {
  if (!explanation && !isStreaming) {
    return null
  }

  return (
    <Box
      p={6}
      bg="white"
      borderRadius="xl"
      boxShadow="lg"
      border="1px solid"
      borderColor="gray.100"
      bgGradient="linear(to-br, white, brand.50)"
    >
      <VStack align="stretch" spacing={4}>
        <HStack>
          <Box
            w={2}
            h={2}
            borderRadius="full"
            bg="brand.500"
            animation={isStreaming ? "pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite" : "none"}
          />
          <Text fontSize="md" fontWeight="600" color="gray.800">
            AI Recommendation
          </Text>
        </HStack>

        {explanation ? (
          <Text
            fontSize="sm"
            color="gray.700"
            lineHeight="1.7"
            whiteSpace="pre-wrap"
          >
            {explanation}
          </Text>
        ) : (
          <HStack spacing={3}>
            <Spinner size="sm" color="brand.500" />
            <Text fontSize="sm" color="gray.600">
              Analyzing recommendations...
            </Text>
          </HStack>
        )}
      </VStack>
    </Box>
  )
}
