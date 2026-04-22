import sqlite3
import os
from typing import Optional


class Database:
    _instance: Optional['Database'] = None
    _connection: Optional[sqlite3.Connection] = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Database, cls).__new__(cls)
        return cls._instance
    
    def __init__(self):
        if self._connection is None:
            self.db_path = os.path.join(os.path.dirname(__file__), '..', 'cardekho.db')
            self._connection = None
    
    def connect(self):
        if self._connection is None:
            self._connection = sqlite3.connect(self.db_path, check_same_thread=False)
            self._connection.row_factory = sqlite3.Row
        return self._connection
    
    def get_connection(self) -> sqlite3.Connection:
        if self._connection is None:
            self.connect()
        return self._connection
    
    def initialize_database(self):
        conn = self.get_connection()
        cursor = conn.cursor()
        
        sql_file_path = os.path.join(os.path.dirname(__file__), '..', 'init_database.sql')
        
        if os.path.exists(sql_file_path):
            with open(sql_file_path, 'r', encoding='utf-8') as f:
                sql_script = f.read()
                cursor.executescript(sql_script)
            conn.commit()
            print("Database initialized successfully!")
        else:
            print(f"SQL file not found at: {sql_file_path}")
    
    def close(self):
        if self._connection:
            self._connection.close()
            self._connection = None


def get_db() -> Database:
    return Database()
