from typing import Dict, Any, Optional
from pydantic import BaseModel, Field, validator


class CarQueryRequest(BaseModel):
    budget: str = Field(..., description="Budget range in format 'min-max' (e.g., '10-15')")
    body_type: Optional[str] = Field(default="Any", description="Body type preference")
    mileage_priority: str = Field(default="medium", description="Mileage priority: low, medium, high")
    safety_priority: str = Field(default="medium", description="Safety priority: low, medium, high")
    fuel_type: Optional[str] = Field(default="Any", description="Fuel type preference")
    
    @validator('budget')
    def validate_budget(cls, v):
        try:
            parts = v.split('-')
            if len(parts) != 2:
                raise ValueError("Budget must be in format 'min-max'")
            
            min_budget = float(parts[0])
            max_budget = float(parts[1])
            
            if min_budget < 0 or max_budget < 0:
                raise ValueError("Budget values must be positive")
            
            if min_budget >= max_budget:
                raise ValueError("Minimum budget must be less than maximum budget")
            
            if max_budget > 200:
                raise ValueError("Maximum budget cannot exceed 200 lakhs")
            
            return v
        except (ValueError, AttributeError) as e:
            raise ValueError(f"Invalid budget format: {str(e)}")
    
    @validator('mileage_priority', 'safety_priority')
    def validate_priority(cls, v):
        valid_priorities = ['low', 'medium', 'high']
        if v.lower() not in valid_priorities:
            raise ValueError(f"Priority must be one of: {', '.join(valid_priorities)}")
        return v.lower()
    
    @validator('body_type')
    def validate_body_type(cls, v):
        if not v:
            return "Any"
        valid_types = ['Any', 'Hatchback', 'Sedan', 'SUV', 'MUV']
        if v not in valid_types:
            raise ValueError(f"Body type must be one of: {', '.join(valid_types)}")
        return v
    
    @validator('fuel_type')
    def validate_fuel_type(cls, v):
        if not v:
            return "Any"
        valid_fuels = ['Any', 'Petrol', 'Diesel']
        if v not in valid_fuels:
            raise ValueError(f"Fuel type must be one of: {', '.join(valid_fuels)}")
        return v


class CarQueryHandler:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(CarQueryHandler, cls).__new__(cls)
        return cls._instance
    
    def validate_request(self, data: Dict[str, Any]) -> tuple[bool, Optional[str], Optional[CarQueryRequest]]:
        try:
            request = CarQueryRequest(**data)
            return True, None, request
        except Exception as e:
            error_message = str(e)
            if hasattr(e, 'errors'):
                errors = e.errors()
                error_messages = []
                for error in errors:
                    field = '.'.join(str(x) for x in error['loc'])
                    msg = error['msg']
                    error_messages.append(f"{field}: {msg}")
                error_message = '; '.join(error_messages)
            
            return False, error_message, None


def get_car_query_handler() -> CarQueryHandler:
    return CarQueryHandler()
