from typing import List, Dict, Any, Optional
import sqlite3
from db import get_db


class CarRepository:
    _instance: Optional['CarRepository'] = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(CarRepository, cls).__new__(cls)
        return cls._instance
    
    def __init__(self):
        self.db = get_db()
    
    def get_cars_by_filters(self, budget_min: float, budget_max: float, 
                           body_type: Optional[str] = None, 
                           fuel_type: Optional[str] = None) -> List[Dict[str, Any]]:
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        query = """
            SELECT c.*, cs.abs, cs.airbags, cs.traction_control, cs.esp, 
                   cs.hill_assist, cs.rear_camera, cs.rear_parking_sensors, 
                   cs.adas, cs.lane_assist, cs.blind_spot_monitor
            FROM cars c
            LEFT JOIN car_specs cs ON c.id = cs.car_id
            WHERE c.price_lakh BETWEEN ? AND ?
        """
        params = [budget_min, budget_max]
        
        if body_type and body_type != "Any":
            query += " AND c.body_type = ?"
            params.append(body_type)
        
        if fuel_type and fuel_type != "Any":
            query += " AND c.fuel_type = ?"
            params.append(fuel_type)
        
        cursor.execute(query, params)
        rows = cursor.fetchall()
        
        cars = []
        for row in rows:
            car = dict(row)
            cars.append(car)
        
        return cars
    
    def get_car_reviews(self, car_id: int) -> List[Dict[str, Any]]:
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute("""
            SELECT reviewer_name, rating, review_text, review_date
            FROM car_reviews
            WHERE car_id = ?
            ORDER BY review_date DESC
            LIMIT 5
        """, (car_id,))
        
        rows = cursor.fetchall()
        return [dict(row) for row in rows]
    
    def get_all_body_types(self) -> List[str]:
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute("SELECT DISTINCT body_type FROM cars ORDER BY body_type")
        rows = cursor.fetchall()
        return [row['body_type'] for row in rows]
    
    def get_all_brands(self) -> List[str]:
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute("SELECT DISTINCT brand FROM cars ORDER BY brand")
        rows = cursor.fetchall()
        return [row['brand'] for row in rows]


def get_car_repository() -> CarRepository:
    return CarRepository()
