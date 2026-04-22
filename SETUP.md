# CarDekho MVP Setup Guide

## Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Create a virtual environment (optional but recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Create `.env` file from example:
```bash
cp .env.example .env
```

5. Edit `.env` and add your Claude API key:
```
CLAUDE_API_KEY=your_actual_api_key_here
CLAUDE_MODEL=claude-3-5-sonnet-20241022
HOST=0.0.0.0
PORT=8000
CORS_ORIGINS=http://localhost:5173,http://localhost:3000
```

6. Run the backend server:
```bash
python main.py
```

The database will be automatically initialized on first run.
Backend will be available at http://localhost:8000

## Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies (if not already done):
```bash
npm install
```

3. Run the development server:
```bash
npm run dev
```

Frontend will be available at http://localhost:5173

## Testing the Application

1. Ensure backend is running on port 8000
2. Ensure frontend is running on port 5173
3. Open http://localhost:5173 in your browser
4. Test with these sample queries:

### Test Case 1: Budget SUV
- Budget: 10-15
- Body Type: SUV
- Fuel Type: Any
- Mileage Priority: High
- Safety Priority: High

### Test Case 2: Affordable Hatchback
- Budget: 5-8
- Body Type: Hatchback
- Fuel Type: Petrol
- Mileage Priority: High
- Safety Priority: Medium

### Test Case 3: Premium Sedan
- Budget: 15-20
- Body Type: Sedan
- Fuel Type: Diesel
- Mileage Priority: Medium
- Safety Priority: High

### Test Case 4: Family MUV
- Budget: 12-18
- Body Type: MUV
- Fuel Type: Diesel
- Mileage Priority: Medium
- Safety Priority: High

### Test Case 5: Budget-Friendly Any Type
- Budget: 5-10
- Body Type: Any
- Fuel Type: Any
- Mileage Priority: High
- Safety Priority: Low

## API Endpoints

- GET `/` - API info
- GET `/health` - Health check
- POST `/api/ask-cars` - Get car recommendations (streaming response)

## Architecture

```
Frontend (React + Vite + Chakra UI)
    ↓
Vite Proxy (/api → http://localhost:8000)
    ↓
Backend (FastAPI)
    ↓
├── Handlers (Validation)
├── Routers (Endpoints)
├── Services (Business Logic + Claude AI)
├── Repositories (Database Access)
└── Database (SQLite)
```

## Features

- Real-time streaming AI explanations
- Multi-factor car scoring algorithm
- 200 cars in database (100 models, 2 variants each)
- Safety features tracking
- Premium UI with gradients
- Responsive design
- Error handling and loading states
- CORS configured for local development
