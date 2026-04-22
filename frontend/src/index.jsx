import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import Root from './main.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Root />
  </StrictMode>,
)
