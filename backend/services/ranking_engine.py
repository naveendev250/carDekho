from typing import List, Dict, Any


class RankingEngine:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(RankingEngine, cls).__new__(cls)
        return cls._instance
    
    def calculate_score(self, car: Dict[str, Any], mileage_priority: str, 
                       safety_priority: str, budget_min: float, budget_max: float) -> float:
        mileage_weight = self._get_priority_weight(mileage_priority)
        safety_weight = self._get_priority_weight(safety_priority)
        price_weight = 1.0 - (mileage_weight + safety_weight) / 2
        
        mileage_score = self._normalize_mileage(car['mileage_kmpl'])
        safety_score = self._calculate_safety_score(car)
        affordability_score = self._calculate_affordability_score(
            car['price_lakh'], budget_min, budget_max
        )
        
        total_score = (
            mileage_weight * mileage_score +
            safety_weight * safety_score +
            price_weight * affordability_score
        )
        
        return round(total_score, 2)
    
    def _get_priority_weight(self, priority: str) -> float:
        priority_map = {
            'low': 0.2,
            'medium': 0.4,
            'high': 0.6
        }
        return priority_map.get(priority.lower(), 0.4)
    
    def _normalize_mileage(self, mileage: float) -> float:
        min_mileage = 5.0
        max_mileage = 35.0
        normalized = (mileage - min_mileage) / (max_mileage - min_mileage)
        return max(0, min(1, normalized))
    
    def _calculate_safety_score(self, car: Dict[str, Any]) -> float:
        base_rating = car.get('safety_rating', 0) / 5.0
        
        safety_features = [
            car.get('abs', 0),
            car.get('traction_control', 0),
            car.get('esp', 0),
            car.get('hill_assist', 0),
            car.get('rear_camera', 0),
            car.get('rear_parking_sensors', 0),
            car.get('adas', 0),
            car.get('lane_assist', 0),
            car.get('blind_spot_monitor', 0)
        ]
        
        airbag_score = min(car.get('airbags', 0) / 6.0, 1.0)
        
        feature_count = sum(safety_features)
        max_features = len(safety_features)
        feature_score = feature_count / max_features
        
        safety_score = (base_rating * 0.5) + (feature_score * 0.3) + (airbag_score * 0.2)
        
        return min(1.0, safety_score)
    
    def _calculate_affordability_score(self, price: float, budget_min: float, 
                                      budget_max: float) -> float:
        budget_range = budget_max - budget_min
        
        if price <= budget_min + (budget_range * 0.25):
            return 1.0
        elif price <= budget_min + (budget_range * 0.5):
            return 0.8
        elif price <= budget_min + (budget_range * 0.75):
            return 0.6
        else:
            return 0.4
    
    def rank_cars(self, cars: List[Dict[str, Any]], mileage_priority: str,
                 safety_priority: str, budget_min: float, budget_max: float,
                 top_n: int = 10) -> List[Dict[str, Any]]:
        for car in cars:
            car['score'] = self.calculate_score(
                car, mileage_priority, safety_priority, budget_min, budget_max
            )
        
        sorted_cars = sorted(cars, key=lambda x: x['score'], reverse=True)
        
        return sorted_cars[:top_n]


def get_ranking_engine() -> RankingEngine:
    return RankingEngine()
