from fastapi import APIRouter, HTTPException
from fastapi.responses import StreamingResponse
from typing import Dict, Any
from handlers.car_handler import get_car_query_handler
from services.car_service import get_car_service
import json

router = APIRouter()


@router.post("/ask-cars")
async def ask_cars(query: Dict[str, Any]):
    car_handler = get_car_query_handler()
    car_service = get_car_service()

    is_valid, error_message, validated_request = car_handler.validate_request(query)
    
    if not is_valid:
        raise HTTPException(status_code=400, detail=error_message)
    
    recommendations = car_service.get_car_recommendations(query)
    
    async def generate_stream():
        yield json.dumps({
            "type": "recommendations",
            "data": recommendations
        }) + "\n"
        
        yield json.dumps({
            "type": "explanation_start"
        }) + "\n"
        
        async for chunk in car_service.get_ai_explanation(recommendations):
            yield json.dumps({
                "type": "explanation_chunk",
                "data": chunk
            }) + "\n"
        
        yield json.dumps({
            "type": "explanation_end"
        }) + "\n"
    
    return StreamingResponse(
        generate_stream(),
        media_type="application/x-ndjson",
        headers={
            "Cache-Control": "no-cache",
            "X-Accel-Buffering": "no"
        }
    )
