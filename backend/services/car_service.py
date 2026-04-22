from typing import Dict, Any, List, AsyncIterator
import json
from repositories.car_repository import get_car_repository
from services.ranking_engine import get_ranking_engine
from services.claude_client import get_claude_client


class CarService:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(CarService, cls).__new__(cls)
        return cls._instance
    
    def __init__(self):
        self.car_repo = get_car_repository()
        self.ranking_engine = get_ranking_engine()
        self.claude_client = get_claude_client()
    
    def get_car_recommendations(self, query: Dict[str, Any]) -> Dict[str, Any]:
        budget_parts = query['budget'].split('-')
        budget_min = float(budget_parts[0])
        budget_max = float(budget_parts[1])
        
        body_type = query.get('body_type', 'Any')
        fuel_type = query.get('fuel_type', 'Any')
        mileage_priority = query.get('mileage_priority', 'medium')
        safety_priority = query.get('safety_priority', 'medium')
        
        cars = self.car_repo.get_cars_by_filters(
            budget_min=budget_min,
            budget_max=budget_max,
            body_type=body_type,
            fuel_type=fuel_type
        )
        
        if not cars:
            return {
                'top_cars': [],
                'query': query,
                'message': 'No cars found matching your criteria'
            }
        
        top_cars = self.ranking_engine.rank_cars(
            cars=cars,
            mileage_priority=mileage_priority,
            safety_priority=safety_priority,
            budget_min=budget_min,
            budget_max=budget_max,
            top_n=10
        )
        
        return {
            'top_cars': top_cars,
            'query': query
        }
    
    def _format_car_info(self, car: Dict[str, Any]) -> str:
        safety_features = []
        if car.get('abs'): safety_features.append('ABS')
        if car.get('airbags'): safety_features.append(f"{car['airbags']} Airbags")
        if car.get('esp'): safety_features.append('ESP')
        if car.get('adas'): safety_features.append('ADAS')
        
        return f"""
{car['brand']} {car['model']} {car['variant']} ({car['fuel_type']})
- Price: ₹{car['price_lakh']} Lakh
- Mileage: {car['mileage_kmpl']} km/l
- Safety Rating: {car['safety_rating']}/5
- Engine: {car['engine_cc']}cc
- Transmission: {car['transmission']}
- Body Type: {car['body_type']}
- Seating: {car['seating_capacity']}
- Safety Features: {', '.join(safety_features) if safety_features else 'Basic'}
- Recommendation Score: {car['score']}/1.0
"""
    
    async def get_ai_explanation(self, recommendations: Dict[str, Any]) -> AsyncIterator[str]:
        top_cars = recommendations['top_cars']
        query = recommendations['query']
        
        if not top_cars:
            yield "I couldn't find any cars matching your exact criteria. Try adjusting your budget or preferences."
            return
        
        cars_info = "\n".join([
            f"{i+1}. {self._format_car_info(car)}"
            for i, car in enumerate(top_cars[:5])
        ])
        
        system_prompt = """You are an expert car advisor helping buyers choose the right vehicle. 
You provide clear, concise explanations about why certain cars match their needs.
Focus on practical advice and highlight trade-offs when relevant.
Keep responses conversational and helpful."""
        
        user_message = f"""User preferences:
- Budget: ₹{query['budget']} Lakh
- Body Type: {query.get('body_type', 'Any')}
- Fuel Type: {query.get('fuel_type', 'Any')}
- Mileage Priority: {query.get('mileage_priority', 'medium')}
- Safety Priority: {query.get('safety_priority', 'medium')}

Top recommended cars:
{cars_info}

Please explain:
1. Why these cars match the user's preferences
2. Key trade-offs between the top options
3. Who should pick which car based on their specific needs

Keep the response concise, practical, and easy to understand."""
        
        async for chunk in self.claude_client.stream_message(system_prompt, user_message, max_tokens=1500):
            yield chunk


def get_car_service() -> CarService:
    return CarService()
