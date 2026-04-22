const API_BASE = import.meta.env.VITE_API_URL || 'https://cardekho-1-0qdk.onrender.com';

export async function* streamCarRecommendations(query) {
  const response = await fetch(`${API_BASE}/api/ask-cars`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(query),
  })

  if (!response.ok) {
    const error = await response.json()
    throw new Error(error.detail || 'Failed to get recommendations')
  }

  const reader = response.body.getReader()
  const decoder = new TextDecoder()

  while (true) {
    const { done, value } = await reader.read()
    
    if (done) break

    const chunk = decoder.decode(value)
    const lines = chunk.split('\n').filter(line => line.trim())

    for (const line of lines) {
      try {
        const data = JSON.parse(line)
        yield data
      } catch (e) {
        console.error('Failed to parse line:', line, e)
      }
    }
  }
}
