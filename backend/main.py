from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers.car_router import router as car_router
from db import get_db
import os
from dotenv import load_dotenv
from fastapi import Lifespan

load_dotenv()

app = FastAPI(
    title="CarDekho API",
    description="Car recommendation system with AI-powered explanations",
    version="1.0.0",
    lifespan=lifespan
)

origins = os.getenv('CORS_ORIGINS', 'http://localhost:5173,http://localhost:3000').split(',')

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(car_router, prefix="/api", tags=["cars"])


@app.on_event("startup")
async def startup_event():
    db = get_db()
    db_path = db.db_path
    
    if not os.path.exists(db_path):
        print("Database not found. Initializing...")
        db.initialize_database()
        print("Database initialized successfully!")
    else:
        print("Database already exists.")
    
    db.connect()
    print("Database connection established.")


@app.on_event("shutdown")
async def shutdown_event():
    db = get_db()
    db.close()
    print("Database connection closed.")


@app.get("/")
async def root():
    return {
        "message": "CarDekho API is running",
        "version": "1.0.0",
        "endpoints": {
            "ask_cars": "/api/ask-cars"
        }
    }


@app.get("/health")
async def health_check():
    return {"status": "healthy"}


if __name__ == "__main__":
    import uvicorn
    
    host = os.getenv('HOST', '0.0.0.0')
    port = int(os.getenv('PORT', 8000))
    
    uvicorn.run(app, host=host, port=port)
