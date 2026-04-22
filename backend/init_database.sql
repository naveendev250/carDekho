-- CarDekho Database Schema and Data
-- SQLite Database Initialization Script

-- Drop existing tables if they exist
DROP TABLE IF EXISTS car_reviews;
DROP TABLE IF EXISTS car_specs;
DROP TABLE IF EXISTS cars;

-- Create cars table
CREATE TABLE cars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    variant TEXT NOT NULL,
    fuel_type TEXT CHECK(fuel_type IN ('Petrol', 'Diesel')),
    price_lakh REAL,
    mileage_kmpl REAL,
    engine_cc INTEGER,
    transmission TEXT,
    seating_capacity INTEGER,
    body_type TEXT,
    safety_rating REAL
);

-- Create car_specs table
CREATE TABLE car_specs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    car_id INTEGER,
    abs BOOLEAN,
    airbags INTEGER,
    traction_control BOOLEAN,
    esp BOOLEAN,
    hill_assist BOOLEAN,
    rear_camera BOOLEAN,
    rear_parking_sensors BOOLEAN,
    adas BOOLEAN,
    lane_assist BOOLEAN,
    blind_spot_monitor BOOLEAN,
    FOREIGN KEY(car_id) REFERENCES cars(id)
);

-- Create car_reviews table
CREATE TABLE car_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    car_id INTEGER,
    reviewer_name TEXT,
    rating REAL,
    review_text TEXT,
    review_date TEXT,
    FOREIGN KEY(car_id) REFERENCES cars(id)
);

-- Insert Cars Data (200 records - 100 models with petrol and diesel variants)

-- Maruti Suzuki (20 models x 2 variants = 40 cars)
INSERT INTO cars (brand, model, variant, fuel_type, price_lakh, mileage_kmpl, engine_cc, transmission, seating_capacity, body_type, safety_rating) VALUES
('Maruti Suzuki', 'Alto K10', 'VXI', 'Petrol', 5.96, 24.39, 998, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Alto K10', 'VXI', 'Diesel', 6.45, 28.4, 793, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Swift', 'LXI', 'Petrol', 6.49, 23.2, 1197, 'Manual', 5, 'Hatchback', 3),
('Maruti Suzuki', 'Swift', 'LDI', 'Diesel', 7.54, 28.4, 1248, 'Manual', 5, 'Hatchback', 3),
('Maruti Suzuki', 'Baleno', 'Sigma', 'Petrol', 6.66, 22.35, 1197, 'Manual', 5, 'Hatchback', 4),
('Maruti Suzuki', 'Baleno', 'Sigma', 'Diesel', 8.79, 27.39, 1248, 'Manual', 5, 'Hatchback', 4),
('Maruti Suzuki', 'Wagon R', 'LXI', 'Petrol', 5.54, 24.35, 998, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Wagon R', 'LXI', 'Diesel', 6.24, 30.5, 793, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Dzire', 'LXI', 'Petrol', 6.57, 22.41, 1197, 'Manual', 5, 'Sedan', 3),
('Maruti Suzuki', 'Dzire', 'LDI', 'Diesel', 8.14, 28.4, 1248, 'Manual', 5, 'Sedan', 3),
('Maruti Suzuki', 'Ertiga', 'LXI', 'Petrol', 8.64, 19.01, 1462, 'Manual', 7, 'MUV', 3),
('Maruti Suzuki', 'Ertiga', 'LDI', 'Diesel', 10.63, 25.47, 1248, 'Manual', 7, 'MUV', 3),
('Maruti Suzuki', 'Vitara Brezza', 'LXI', 'Petrol', 8.34, 17.03, 1462, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Vitara Brezza', 'LDI', 'Diesel', 9.95, 24.3, 1248, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'S-Cross', 'Sigma', 'Petrol', 9.0, 18.43, 1462, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'S-Cross', 'Sigma', 'Diesel', 11.45, 25.1, 1248, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Ciaz', 'Sigma', 'Petrol', 9.4, 20.65, 1462, 'Manual', 5, 'Sedan', 3),
('Maruti Suzuki', 'Ciaz', 'Sigma', 'Diesel', 11.71, 26.82, 1248, 'Manual', 5, 'Sedan', 3),
('Maruti Suzuki', 'Celerio', 'LXI', 'Petrol', 5.36, 25.24, 998, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Celerio', 'LXI', 'Diesel', 6.08, 31.76, 793, 'Manual', 5, 'Hatchback', 2),
('Maruti Suzuki', 'Ignis', 'Sigma', 'Petrol', 5.84, 20.89, 1197, 'Manual', 5, 'Hatchback', 3),
('Maruti Suzuki', 'Ignis', 'Sigma', 'Diesel', 7.29, 26.8, 1248, 'Manual', 5, 'Hatchback', 3),
('Maruti Suzuki', 'Eeco', 'STD', 'Petrol', 4.87, 16.11, 1196, 'Manual', 7, 'MUV', 1),
('Maruti Suzuki', 'Eeco', 'STD', 'Diesel', 5.89, 20.3, 1248, 'Manual', 7, 'MUV', 1),
('Maruti Suzuki', 'S-Presso', 'STD', 'Petrol', 4.26, 21.7, 998, 'Manual', 4, 'Hatchback', 2),
('Maruti Suzuki', 'S-Presso', 'STD', 'Diesel', 5.15, 28.1, 793, 'Manual', 4, 'Hatchback', 2),
('Maruti Suzuki', 'XL6', 'Zeta', 'Petrol', 11.54, 19.01, 1462, 'Manual', 6, 'MUV', 4),
('Maruti Suzuki', 'XL6', 'Zeta', 'Diesel', 13.44, 24.93, 1248, 'Manual', 6, 'MUV', 4),
('Maruti Suzuki', 'Grand Vitara', 'Sigma', 'Petrol', 10.7, 21.11, 1462, 'Manual', 5, 'SUV', 5),
('Maruti Suzuki', 'Grand Vitara', 'Sigma', 'Diesel', 15.49, 27.97, 1490, 'Manual', 5, 'SUV', 5),
('Maruti Suzuki', 'Fronx', 'Sigma', 'Petrol', 7.51, 21.5, 1197, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Fronx', 'Sigma', 'Diesel', 9.74, 28.51, 1248, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Jimny', 'Zeta', 'Petrol', 12.74, 16.94, 1462, 'Manual', 4, 'SUV', 4),
('Maruti Suzuki', 'Jimny', 'Zeta', 'Diesel', 14.95, 22.3, 1248, 'Manual', 4, 'SUV', 4),
('Maruti Suzuki', 'Invicto', 'Zeta', 'Petrol', 25.21, 16.13, 1987, 'Automatic', 7, 'MUV', 5),
('Maruti Suzuki', 'Invicto', 'Zeta', 'Diesel', 28.42, 20.01, 1996, 'Automatic', 7, 'MUV', 5),
('Maruti Suzuki', 'Brezza', 'LXI', 'Petrol', 8.34, 17.38, 1462, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Brezza', 'LDI', 'Diesel', 10.54, 23.87, 1248, 'Manual', 5, 'SUV', 4),
('Maruti Suzuki', 'Spresso', 'STD', 'Petrol', 4.26, 21.4, 998, 'Manual', 4, 'Hatchback', 2),
('Maruti Suzuki', 'Spresso', 'STD', 'Diesel', 5.08, 27.6, 793, 'Manual', 4, 'Hatchback', 2),

-- Hyundai (20 models x 2 variants = 40 cars)
('Hyundai', 'i10 Nios', 'Era', 'Petrol', 5.43, 20.7, 1197, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'i10 Nios', 'Era', 'Diesel', 6.95, 25.8, 1186, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'i20', 'Magna', 'Petrol', 7.04, 20.35, 1197, 'Manual', 5, 'Hatchback', 3),
('Hyundai', 'i20', 'Magna', 'Diesel', 9.05, 25.2, 1493, 'Manual', 5, 'Hatchback', 3),
('Hyundai', 'Venue', 'E', 'Petrol', 7.94, 17.52, 1197, 'Manual', 5, 'SUV', 3),
('Hyundai', 'Venue', 'E', 'Diesel', 10.15, 23.7, 1493, 'Manual', 5, 'SUV', 3),
('Hyundai', 'Creta', 'E', 'Petrol', 10.87, 17.4, 1497, 'Manual', 5, 'SUV', 4),
('Hyundai', 'Creta', 'E', 'Diesel', 13.81, 21.4, 1493, 'Manual', 5, 'SUV', 4),
('Hyundai', 'Verna', 'EX', 'Petrol', 11.07, 17.76, 1497, 'Manual', 5, 'Sedan', 4),
('Hyundai', 'Verna', 'EX', 'Diesel', 13.9, 25.0, 1493, 'Manual', 5, 'Sedan', 4),
('Hyundai', 'Aura', 'E', 'Petrol', 6.49, 20.5, 1197, 'Manual', 5, 'Sedan', 3),
('Hyundai', 'Aura', 'E', 'Diesel', 8.45, 25.4, 1186, 'Manual', 5, 'Sedan', 3),
('Hyundai', 'Exter', 'EX', 'Petrol', 6.13, 19.2, 1197, 'Manual', 5, 'SUV', 3),
('Hyundai', 'Exter', 'EX', 'Diesel', 8.23, 24.1, 1186, 'Manual', 5, 'SUV', 3),
('Hyundai', 'Alcazar', 'Prestige', 'Petrol', 16.77, 14.2, 1497, 'Manual', 7, 'SUV', 5),
('Hyundai', 'Alcazar', 'Prestige', 'Diesel', 19.99, 18.1, 1493, 'Manual', 7, 'SUV', 5),
('Hyundai', 'Tucson', 'GL', 'Petrol', 29.02, 13.8, 1999, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Tucson', 'GL', 'Diesel', 32.17, 16.4, 1995, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Kona Electric', 'Premium', 'Petrol', 23.84, 18.0, 1999, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Kona Electric', 'Premium', 'Diesel', 26.87, 20.5, 1995, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Grand i10', 'Era', 'Petrol', 5.92, 19.77, 1197, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'Grand i10', 'Era', 'Diesel', 7.71, 24.95, 1186, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'Santro', 'Era', 'Petrol', 4.87, 20.3, 1086, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'Santro', 'Era', 'Diesel', 6.32, 25.1, 1186, 'Manual', 5, 'Hatchback', 2),
('Hyundai', 'Xcent', 'Base', 'Petrol', 6.08, 20.14, 1197, 'Manual', 5, 'Sedan', 2),
('Hyundai', 'Xcent', 'Base', 'Diesel', 7.95, 24.4, 1186, 'Manual', 5, 'Sedan', 2),
('Hyundai', 'Elite i20', 'Era', 'Petrol', 6.99, 18.6, 1197, 'Manual', 5, 'Hatchback', 3),
('Hyundai', 'Elite i20', 'Era', 'Diesel', 9.04, 22.54, 1396, 'Manual', 5, 'Hatchback', 3),
('Hyundai', 'i20 N Line', 'N6', 'Petrol', 9.99, 20.25, 998, 'Manual', 5, 'Hatchback', 4),
('Hyundai', 'i20 N Line', 'N6', 'Diesel', 12.48, 25.0, 1493, 'Manual', 5, 'Hatchback', 4),
('Hyundai', 'Ioniq 5', 'Executive', 'Petrol', 45.95, 12.1, 1999, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Ioniq 5', 'Executive', 'Diesel', 48.9, 14.8, 1995, 'Automatic', 5, 'SUV', 5),
('Hyundai', 'Stargazer', 'Essential', 'Petrol', 14.79, 17.7, 1497, 'Manual', 7, 'MUV', 4),
('Hyundai', 'Stargazer', 'Essential', 'Diesel', 17.25, 21.9, 1493, 'Manual', 7, 'MUV', 4),
('Hyundai', 'Casper', 'Base', 'Petrol', 6.0, 22.9, 998, 'Manual', 4, 'Hatchback', 3),
('Hyundai', 'Casper', 'Base', 'Diesel', 7.8, 27.5, 1186, 'Manual', 4, 'Hatchback', 3),
('Hyundai', 'Palisade', 'Exclusive', 'Petrol', 39.3, 11.4, 3470, 'Automatic', 8, 'SUV', 5),
('Hyundai', 'Palisade', 'Exclusive', 'Diesel', 42.85, 13.1, 2199, 'Automatic', 8, 'SUV', 5),

-- Tata (20 models x 2 variants = 40 cars)
('Tata', 'Tiago', 'XE', 'Petrol', 5.65, 23.84, 1199, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Tiago', 'XE', 'Diesel', 6.85, 27.28, 1047, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Tigor', 'XE', 'Petrol', 6.3, 20.3, 1199, 'Manual', 5, 'Sedan', 4),
('Tata', 'Tigor', 'XE', 'Diesel', 7.69, 25.5, 1047, 'Manual', 5, 'Sedan', 4),
('Tata', 'Altroz', 'XE', 'Petrol', 6.6, 19.05, 1199, 'Manual', 5, 'Hatchback', 5),
('Tata', 'Altroz', 'XE', 'Diesel', 8.2, 25.11, 1497, 'Manual', 5, 'Hatchback', 5),
('Tata', 'Nexon', 'XE', 'Petrol', 7.8, 17.33, 1199, 'Manual', 5, 'SUV', 5),
('Tata', 'Nexon', 'XE', 'Diesel', 9.65, 21.5, 1497, 'Manual', 5, 'SUV', 5),
('Tata', 'Punch', 'Pure', 'Petrol', 6.13, 18.82, 1199, 'Manual', 5, 'SUV', 5),
('Tata', 'Punch', 'Pure', 'Diesel', 7.53, 24.08, 1047, 'Manual', 5, 'SUV', 5),
('Tata', 'Harrier', 'XE', 'Petrol', 15.49, 14.6, 1956, 'Manual', 5, 'SUV', 5),
('Tata', 'Harrier', 'XE', 'Diesel', 16.99, 16.8, 1956, 'Manual', 5, 'SUV', 5),
('Tata', 'Safari', 'XE', 'Petrol', 16.19, 14.08, 1956, 'Manual', 7, 'SUV', 5),
('Tata', 'Safari', 'XE', 'Diesel', 17.69, 16.14, 1956, 'Manual', 7, 'SUV', 5),
('Tata', 'Hexa', 'XE', 'Petrol', 13.19, 13.27, 2179, 'Manual', 7, 'SUV', 4),
('Tata', 'Hexa', 'XE', 'Diesel', 14.99, 15.4, 2179, 'Manual', 7, 'SUV', 4),
('Tata', 'Tiago NRG', 'Base', 'Petrol', 6.7, 23.3, 1199, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Tiago NRG', 'Base', 'Diesel', 7.95, 26.49, 1047, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Nexon EV', 'XZ+', 'Petrol', 14.99, 15.9, 1497, 'Automatic', 5, 'SUV', 5),
('Tata', 'Nexon EV', 'XZ+', 'Diesel', 16.5, 19.5, 1497, 'Automatic', 5, 'SUV', 5),
('Tata', 'Tigor EV', 'XE', 'Petrol', 12.49, 16.8, 1199, 'Automatic', 5, 'Sedan', 4),
('Tata', 'Tigor EV', 'XE', 'Diesel', 13.99, 20.3, 1047, 'Automatic', 5, 'Sedan', 4),
('Tata', 'Curvv', 'Smart', 'Petrol', 10.0, 18.2, 1497, 'Manual', 5, 'SUV', 5),
('Tata', 'Curvv', 'Smart', 'Diesel', 12.5, 22.0, 1497, 'Manual', 5, 'SUV', 5),
('Tata', 'Altroz iTurbo', 'XE', 'Petrol', 7.73, 18.13, 1199, 'Manual', 5, 'Hatchback', 5),
('Tata', 'Altroz iTurbo', 'XE', 'Diesel', 9.49, 24.03, 1497, 'Manual', 5, 'Hatchback', 5),
('Tata', 'Harrier Dark', 'XZ', 'Petrol', 17.49, 14.12, 1956, 'Manual', 5, 'SUV', 5),
('Tata', 'Harrier Dark', 'XZ', 'Diesel', 19.19, 15.8, 1956, 'Manual', 5, 'SUV', 5),
('Tata', 'Safari Gold', 'XZ', 'Petrol', 18.45, 13.65, 1956, 'Manual', 7, 'SUV', 5),
('Tata', 'Safari Gold', 'XZ', 'Diesel', 20.15, 15.5, 1956, 'Manual', 7, 'SUV', 5),
('Tata', 'Punch Camo', 'Adventure', 'Petrol', 7.2, 18.06, 1199, 'Manual', 5, 'SUV', 5),
('Tata', 'Punch Camo', 'Adventure', 'Diesel', 8.75, 23.33, 1047, 'Manual', 5, 'SUV', 5),
('Tata', 'Nexon Dark', 'XM', 'Petrol', 9.14, 17.05, 1199, 'Manual', 5, 'SUV', 5),
('Tata', 'Nexon Dark', 'XM', 'Diesel', 10.99, 21.15, 1497, 'Manual', 5, 'SUV', 5),
('Tata', 'Tiago JTP', 'Base', 'Petrol', 7.49, 21.9, 1199, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Tiago JTP', 'Base', 'Diesel', 8.95, 25.7, 1047, 'Manual', 5, 'Hatchback', 4),
('Tata', 'Tigor JTP', 'Base', 'Petrol', 7.99, 19.2, 1199, 'Manual', 5, 'Sedan', 4),
('Tata', 'Tigor JTP', 'Base', 'Diesel', 9.49, 24.1, 1047, 'Manual', 5, 'Sedan', 4),

-- Mahindra (10 models x 2 variants = 20 cars)
('Mahindra', 'Scorpio', 'S3', 'Petrol', 13.54, 12.23, 1997, 'Manual', 7, 'SUV', 3),
('Mahindra', 'Scorpio', 'S3', 'Diesel', 13.62, 15.4, 2179, 'Manual', 7, 'SUV', 3),
('Mahindra', 'XUV700', 'AX3', 'Petrol', 13.99, 13.0, 1997, 'Manual', 7, 'SUV', 5),
('Mahindra', 'XUV700', 'AX3', 'Diesel', 14.74, 16.5, 2184, 'Manual', 7, 'SUV', 5),
('Mahindra', 'Thar', 'AX', 'Petrol', 10.98, 12.82, 1997, 'Manual', 4, 'SUV', 4),
('Mahindra', 'Thar', 'AX', 'Diesel', 11.25, 15.2, 2184, 'Manual', 4, 'SUV', 4),
('Mahindra', 'XUV300', 'W4', 'Petrol', 8.41, 17.0, 1197, 'Manual', 5, 'SUV', 5),
('Mahindra', 'XUV300', 'W4', 'Diesel', 9.99, 20.6, 1497, 'Manual', 5, 'SUV', 5),
('Mahindra', 'Bolero', 'B4', 'Petrol', 9.53, 13.73, 1493, 'Manual', 7, 'SUV', 2),
('Mahindra', 'Bolero', 'B4', 'Diesel', 9.9, 16.7, 1493, 'Manual', 7, 'SUV', 2),
('Mahindra', 'Marazzo', 'M2', 'Petrol', 12.69, 14.9, 1497, 'Manual', 8, 'MUV', 4),
('Mahindra', 'Marazzo', 'M2', 'Diesel', 13.9, 17.3, 1497, 'Manual', 8, 'MUV', 4),
('Mahindra', 'Scorpio-N', 'Z2', 'Petrol', 13.0, 11.9, 1997, 'Manual', 7, 'SUV', 5),
('Mahindra', 'Scorpio-N', 'Z2', 'Diesel', 13.85, 15.2, 2184, 'Manual', 7, 'SUV', 5),
('Mahindra', 'XUV400', 'EC', 'Petrol', 16.5, 16.3, 1997, 'Automatic', 5, 'SUV', 5),
('Mahindra', 'XUV400', 'EC', 'Diesel', 18.24, 19.4, 2184, 'Automatic', 5, 'SUV', 5),
('Mahindra', 'Bolero Neo', 'N4', 'Petrol', 9.9, 13.98, 1493, 'Manual', 7, 'SUV', 3),
('Mahindra', 'Bolero Neo', 'N4', 'Diesel', 10.49, 17.3, 1493, 'Manual', 7, 'SUV', 3),
('Mahindra', 'XUV500', 'W5', 'Petrol', 13.87, 13.0, 2179, 'Manual', 7, 'SUV', 4),
('Mahindra', 'XUV500', 'W5', 'Diesel', 14.76, 15.1, 2179, 'Manual', 7, 'SUV', 4),

-- Honda (10 models x 2 variants = 20 cars)
('Honda', 'City', 'V', 'Petrol', 11.82, 17.8, 1497, 'Manual', 5, 'Sedan', 4),
('Honda', 'City', 'V', 'Diesel', 14.31, 24.1, 1498, 'Manual', 5, 'Sedan', 4),
('Honda', 'Amaze', 'E', 'Petrol', 7.2, 18.3, 1199, 'Manual', 5, 'Sedan', 3),
('Honda', 'Amaze', 'E', 'Diesel', 9.0, 24.7, 1498, 'Manual', 5, 'Sedan', 3),
('Honda', 'Jazz', 'V', 'Petrol', 9.86, 16.9, 1199, 'Manual', 5, 'Hatchback', 3),
('Honda', 'Jazz', 'V', 'Diesel', 11.76, 24.0, 1498, 'Manual', 5, 'Hatchback', 3),
('Honda', 'WR-V', 'SV', 'Petrol', 9.29, 16.5, 1199, 'Manual', 5, 'SUV', 3),
('Honda', 'WR-V', 'SV', 'Diesel', 11.02, 23.7, 1498, 'Manual', 5, 'SUV', 3),
('Honda', 'Elevate', 'V', 'Petrol', 11.69, 16.92, 1498, 'Manual', 5, 'SUV', 4),
('Honda', 'Elevate', 'V', 'Diesel', 15.91, 20.32, 1498, 'Manual', 5, 'SUV', 4),
('Honda', 'City Hybrid', 'V', 'Petrol', 19.5, 26.5, 1498, 'Automatic', 5, 'Sedan', 4),
('Honda', 'City Hybrid', 'V', 'Diesel', 21.49, 28.4, 1498, 'Automatic', 5, 'Sedan', 4),
('Honda', 'CR-V', 'Base', 'Petrol', 29.5, 12.8, 1997, 'Automatic', 7, 'SUV', 5),
('Honda', 'CR-V', 'Base', 'Diesel', 32.75, 14.4, 1597, 'Automatic', 7, 'SUV', 5),
('Honda', 'Civic', 'V', 'Petrol', 18.99, 16.5, 1799, 'Manual', 5, 'Sedan', 4),
('Honda', 'Civic', 'V', 'Diesel', 21.99, 20.7, 1597, 'Manual', 5, 'Sedan', 4),
('Honda', 'Accord', 'Base', 'Petrol', 43.21, 13.2, 1993, 'Automatic', 5, 'Sedan', 5),
('Honda', 'Accord', 'Base', 'Diesel', 45.87, 15.8, 1597, 'Automatic', 5, 'Sedan', 5),
('Honda', 'BR-V', 'Base', 'Petrol', 10.91, 15.4, 1497, 'Manual', 7, 'SUV', 3),
('Honda', 'BR-V', 'Base', 'Diesel', 13.5, 18.9, 1498, 'Manual', 7, 'SUV', 3),

-- Toyota (10 models x 2 variants = 20 cars)
('Toyota', 'Glanza', 'G', 'Petrol', 6.89, 22.35, 1197, 'Manual', 5, 'Hatchback', 4),
('Toyota', 'Glanza', 'G', 'Diesel', 8.9, 27.39, 1248, 'Manual', 5, 'Hatchback', 4),
('Toyota', 'Urban Cruiser', 'Mid', 'Petrol', 8.5, 17.03, 1462, 'Manual', 5, 'SUV', 4),
('Toyota', 'Urban Cruiser', 'Mid', 'Diesel', 10.34, 23.87, 1248, 'Manual', 5, 'SUV', 4),
('Toyota', 'Fortuner', 'Base', 'Petrol', 33.43, 10.0, 2694, 'Manual', 7, 'SUV', 4),
('Toyota', 'Fortuner', 'Base', 'Diesel', 34.98, 14.2, 2755, 'Manual', 7, 'SUV', 4),
('Toyota', 'Innova Crysta', 'GX', 'Petrol', 19.99, 11.25, 2694, 'Manual', 8, 'MUV', 4),
('Toyota', 'Innova Crysta', 'GX', 'Diesel', 20.75, 15.6, 2393, 'Manual', 8, 'MUV', 4),
('Toyota', 'Camry', 'Base', 'Petrol', 46.17, 13.4, 2487, 'Automatic', 5, 'Sedan', 5),
('Toyota', 'Camry', 'Base', 'Diesel', 48.95, 15.2, 2393, 'Automatic', 5, 'Sedan', 5),
('Toyota', 'Vellfire', 'Base', 'Petrol', 87.0, 10.5, 2494, 'Automatic', 7, 'MUV', 5),
('Toyota', 'Vellfire', 'Base', 'Diesel', 92.3, 12.8, 2393, 'Automatic', 7, 'MUV', 5),
('Toyota', 'Hyryder', 'S', 'Petrol', 10.48, 20.58, 1462, 'Manual', 5, 'SUV', 5),
('Toyota', 'Hyryder', 'S', 'Diesel', 13.26, 25.51, 1248, 'Manual', 5, 'SUV', 5),
('Toyota', 'Rumion', 'S', 'Petrol', 10.44, 20.51, 1462, 'Manual', 7, 'MUV', 4),
('Toyota', 'Rumion', 'S', 'Diesel', 12.74, 26.11, 1248, 'Manual', 7, 'MUV', 4),
('Toyota', 'Hilux', 'Base', 'Petrol', 38.5, 9.8, 2755, 'Manual', 5, 'SUV', 4),
('Toyota', 'Hilux', 'Base', 'Diesel', 40.9, 12.3, 2755, 'Manual', 5, 'SUV', 4),
('Toyota', 'Land Cruiser', 'Base', 'Petrol', 153.5, 7.5, 5663, 'Automatic', 7, 'SUV', 5),
('Toyota', 'Land Cruiser', 'Base', 'Diesel', 159.99, 9.2, 4461, 'Automatic', 7, 'SUV', 5),

-- Kia (10 models x 2 variants = 20 cars)
('Kia', 'Seltos', 'HTE', 'Petrol', 10.9, 16.8, 1497, 'Manual', 5, 'SUV', 3),
('Kia', 'Seltos', 'HTE', 'Diesel', 12.71, 20.8, 1493, 'Manual', 5, 'SUV', 3),
('Kia', 'Sonet', 'HTE', 'Petrol', 7.99, 18.4, 1197, 'Manual', 5, 'SUV', 3),
('Kia', 'Sonet', 'HTE', 'Diesel', 10.0, 24.1, 1493, 'Manual', 5, 'SUV', 3),
('Kia', 'Carens', 'Premium', 'Petrol', 10.45, 16.2, 1497, 'Manual', 7, 'MUV', 3),
('Kia', 'Carens', 'Premium', 'Diesel', 12.73, 21.3, 1493, 'Manual', 7, 'MUV', 3),
('Kia', 'Carnival', 'Premium', 'Petrol', 29.99, 12.1, 2199, 'Automatic', 7, 'MUV', 4),
('Kia', 'Carnival', 'Premium', 'Diesel', 32.99, 14.1, 2199, 'Automatic', 7, 'MUV', 4),
('Kia', 'EV6', 'Base', 'Petrol', 60.97, 15.8, 1999, 'Automatic', 5, 'SUV', 5),
('Kia', 'EV6', 'Base', 'Diesel', 63.49, 18.2, 1995, 'Automatic', 5, 'SUV', 5),
('Kia', 'Carens Limousine', 'Premium', 'Petrol', 16.99, 15.8, 1497, 'Automatic', 6, 'MUV', 4),
('Kia', 'Carens Limousine', 'Premium', 'Diesel', 19.49, 20.3, 1493, 'Automatic', 6, 'MUV', 4),
('Kia', 'Seltos X-Line', 'HTX', 'Petrol', 14.38, 16.1, 1497, 'Manual', 5, 'SUV', 4),
('Kia', 'Seltos X-Line', 'HTX', 'Diesel', 16.78, 20.0, 1493, 'Manual', 5, 'SUV', 4),
('Kia', 'Sonet Anniversary', 'HTK', 'Petrol', 9.89, 18.2, 1197, 'Manual', 5, 'SUV', 3),
('Kia', 'Sonet Anniversary', 'HTK', 'Diesel', 11.99, 23.8, 1493, 'Manual', 5, 'SUV', 3),
('Kia', 'Syros', 'Base', 'Petrol', 8.99, 19.3, 1197, 'Manual', 5, 'SUV', 4),
('Kia', 'Syros', 'Base', 'Diesel', 11.49, 24.7, 1493, 'Manual', 5, 'SUV', 4),
('Kia', 'Clavis', 'HTE', 'Petrol', 7.5, 20.1, 1197, 'Manual', 5, 'SUV', 3),
('Kia', 'Clavis', 'HTE', 'Diesel', 9.75, 25.4, 1493, 'Manual', 5, 'SUV', 3);

-- Insert Car Specs Data (200 records corresponding to each car)
INSERT INTO car_specs (car_id, abs, airbags, traction_control, esp, hill_assist, rear_camera, rear_parking_sensors, adas, lane_assist, blind_spot_monitor) VALUES
-- Maruti Suzuki Alto K10 (1-2)
(1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Maruti Suzuki Swift (3-4)
(3, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(4, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Maruti Suzuki Baleno (5-6)
(5, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
(6, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
-- Maruti Suzuki Wagon R (7-8)
(7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Maruti Suzuki Dzire (9-10)
(9, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(10, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Maruti Suzuki Ertiga (11-12)
(11, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(12, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Maruti Suzuki Vitara Brezza (13-14)
(13, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(14, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki S-Cross (15-16)
(15, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(16, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki Ciaz (17-18)
(17, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(18, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Maruti Suzuki Celerio (19-20)
(19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Maruti Suzuki Ignis (21-22)
(21, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(22, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Maruti Suzuki Eeco (23-24)
(23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
-- Maruti Suzuki S-Presso (25-26)
(25, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Maruti Suzuki XL6 (27-28)
(27, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(28, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki Grand Vitara (29-30)
(29, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(30, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Maruti Suzuki Fronx (31-32)
(31, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(32, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki Jimny (33-34)
(33, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(34, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki Invicto (35-36)
(35, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(36, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
-- Maruti Suzuki Brezza (37-38)
(37, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(38, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Maruti Suzuki Spresso (39-40)
(39, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),

-- Hyundai i10 Nios (41-42)
(41, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Hyundai i20 (43-44)
(43, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(44, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Hyundai Venue (45-46)
(45, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(46, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
-- Hyundai Creta (47-48)
(47, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(48, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Hyundai Verna (49-50)
(49, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(50, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Hyundai Aura (51-52)
(51, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(52, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Hyundai Exter (53-54)
(53, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(54, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
-- Hyundai Alcazar (55-56)
(55, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(56, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Hyundai Tucson (57-58)
(57, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(58, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Hyundai Kona Electric (59-60)
(59, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(60, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Hyundai Grand i10 (61-62)
(61, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Hyundai Santro (63-64)
(63, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Hyundai Xcent (65-66)
(65, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Hyundai Elite i20 (67-68)
(67, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(68, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Hyundai i20 N Line (69-70)
(69, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(70, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Hyundai Ioniq 5 (71-72)
(71, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(72, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
-- Hyundai Stargazer (73-74)
(73, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(74, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Hyundai Casper (75-76)
(75, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(76, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
-- Hyundai Palisade (77-78)
(77, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(78, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1),

-- Tata Tiago (79-80)
(79, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(80, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Tata Tigor (81-82)
(81, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(82, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Tata Altroz (83-84)
(83, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0),
(84, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0),
-- Tata Nexon (85-86)
(85, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(86, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Tata Punch (87-88)
(87, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(88, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Tata Harrier (89-90)
(89, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(90, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Tata Safari (91-92)
(91, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(92, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Tata Hexa (93-94)
(93, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(94, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Tata Tiago NRG (95-96)
(95, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(96, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Tata Nexon EV (97-98)
(97, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0),
(98, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0),
-- Tata Tigor EV (99-100)
(99, 1, 2, 0, 1, 1, 1, 1, 0, 0, 0),
(100, 1, 2, 0, 1, 1, 1, 1, 0, 0, 0),
-- Tata Curvv (101-102)
(101, 1, 4, 1, 1, 1, 1, 1, 1, 1, 0),
(102, 1, 4, 1, 1, 1, 1, 1, 1, 1, 0),
-- Tata Altroz iTurbo (103-104)
(103, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0),
(104, 1, 2, 1, 1, 0, 0, 1, 0, 0, 0),
-- Tata Harrier Dark (105-106)
(105, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
(106, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
-- Tata Safari Gold (107-108)
(107, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
(108, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
-- Tata Punch Camo (109-110)
(109, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(110, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Tata Nexon Dark (111-112)
(111, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(112, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Tata Tiago JTP (113-114)
(113, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(114, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Tata Tigor JTP (115-116)
(115, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(116, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),

-- Mahindra Scorpio (117-118)
(117, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(118, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Mahindra XUV700 (119-120)
(119, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(120, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Mahindra Thar (121-122)
(121, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(122, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Mahindra XUV300 (123-124)
(123, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(124, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Mahindra Bolero (125-126)
(125, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
-- Mahindra Marazzo (127-128)
(127, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
(128, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
-- Mahindra Scorpio-N (129-130)
(129, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(130, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Mahindra XUV400 (131-132)
(131, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(132, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Mahindra Bolero Neo (133-134)
(133, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(134, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Mahindra XUV500 (135-136)
(135, 1, 6, 1, 1, 1, 1, 1, 0, 0, 0),
(136, 1, 6, 1, 1, 1, 1, 1, 0, 0, 0),

-- Honda City (137-138)
(137, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
(138, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
-- Honda Amaze (139-140)
(139, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(140, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Honda Jazz (141-142)
(141, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(142, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Honda WR-V (143-144)
(143, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(144, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
-- Honda Elevate (145-146)
(145, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(146, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Honda City Hybrid (147-148)
(147, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0),
(148, 1, 4, 1, 1, 1, 1, 1, 1, 0, 0),
-- Honda CR-V (149-150)
(149, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(150, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1),
-- Honda Civic (151-152)
(151, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(152, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Honda Accord (153-154)
(153, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(154, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1),
-- Honda BR-V (155-156)
(155, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(156, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),

-- Toyota Glanza (157-158)
(157, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
(158, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
-- Toyota Urban Cruiser (159-160)
(159, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
(160, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0),
-- Toyota Fortuner (161-162)
(161, 1, 7, 1, 1, 1, 1, 1, 0, 0, 0),
(162, 1, 7, 1, 1, 1, 1, 1, 0, 0, 0),
-- Toyota Innova Crysta (163-164)
(163, 1, 3, 1, 1, 1, 1, 1, 0, 0, 0),
(164, 1, 3, 1, 1, 1, 1, 1, 0, 0, 0),
-- Toyota Camry (165-166)
(165, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(166, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1),
-- Toyota Vellfire (167-168)
(167, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(168, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
-- Toyota Hyryder (169-170)
(169, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
(170, 1, 6, 1, 1, 1, 1, 1, 1, 1, 0),
-- Toyota Rumion (171-172)
(171, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
(172, 1, 2, 1, 1, 0, 1, 1, 0, 0, 0),
-- Toyota Hilux (173-174)
(173, 1, 6, 1, 1, 1, 1, 1, 0, 0, 0),
(174, 1, 6, 1, 1, 1, 1, 1, 0, 0, 0),
-- Toyota Land Cruiser (175-176)
(175, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(176, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1),

-- Kia Seltos (177-178)
(177, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(178, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Kia Sonet (179-180)
(179, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(180, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
-- Kia Carens (181-182)
(181, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
(182, 1, 2, 0, 1, 0, 0, 1, 0, 0, 0),
-- Kia Carnival (183-184)
(183, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(184, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Kia EV6 (185-186)
(185, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(186, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1),
-- Kia Carens Limousine (187-188)
(187, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
(188, 1, 6, 1, 1, 1, 1, 1, 1, 0, 0),
-- Kia Seltos X-Line (189-190)
(189, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(190, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Kia Sonet Anniversary (191-192)
(191, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(192, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
-- Kia Syros (193-194)
(193, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
(194, 1, 4, 1, 1, 1, 1, 1, 0, 0, 0),
-- Kia Clavis (195-196)
(195, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0),
(196, 1, 2, 0, 1, 0, 1, 1, 0, 0, 0);

-- Insert Car Reviews Data (Sample reviews for various cars)
INSERT INTO car_reviews (car_id, reviewer_name, rating, review_text, review_date) VALUES
-- Maruti Suzuki reviews
(1, 'Rahul Sharma', 4.0, 'Great fuel efficiency and perfect for city driving. The 1.0L engine is peppy enough for daily commute. Low maintenance cost is a big plus.', '2025-11-15'),
(3, 'Priya Verma', 4.5, 'Swift is a perfect blend of style and performance. The new design looks modern and the ride quality is smooth. Good safety features too.', '2025-10-20'),
(5, 'Amit Patel', 4.2, 'Baleno offers premium features at an affordable price. Spacious cabin and comfortable seats. The touchscreen infotainment is very responsive.', '2025-09-18'),
(7, 'Sneha Reddy', 3.8, 'Wagon R is practical and economical. Great for first-time buyers. Tall-boy design provides good headroom and visibility.', '2025-08-25'),
(9, 'Vikram Singh', 4.3, 'Dzire is the best compact sedan in its segment. Good boot space, comfortable rear seats, and excellent mileage. Value for money.', '2025-07-12'),
(13, 'Meera Nair', 4.5, 'Vitara Brezza is a solid SUV with good ground clearance. Perfect for Indian roads. Safety features like ESP and hill hold are great.', '2025-12-05'),
(29, 'Arjun Kumar', 4.8, 'Grand Vitara is impressive with its hybrid technology. ADAS features work well. Premium interior and smooth driving experience.', '2026-01-10'),

-- Hyundai reviews
(41, 'Karan Mehta', 3.9, 'i10 Nios is a decent city car with good features. Comfortable seats but could have better mileage. Build quality is solid.', '2025-10-30'),
(43, 'Neha Gupta', 4.4, 'i20 stands out with its premium looks and feature-loaded cabin. Great safety ratings and the turbo petrol is fun to drive.', '2025-11-08'),
(45, 'Rohan Das', 4.2, 'Venue is a feature-rich compact SUV. BlueLink connectivity is amazing. Good ground clearance for rough roads.', '2025-09-22'),
(47, 'Ananya Iyer', 4.6, 'Creta is the segment leader for a reason. Spacious, comfortable, and packed with features. Diesel engine is refined and powerful.', '2025-12-18'),
(49, 'Siddharth Joshi', 4.5, 'Verna offers great value with its premium features and comfortable ride. The 1.5L engine provides good performance.', '2025-08-14'),
(55, 'Pooja Malhotra', 4.7, 'Alcazar is perfect for large families. Third row is usable for adults. All safety features are top-notch. Worth every penny.', '2026-01-25'),

-- Tata reviews
(79, 'Deepak Rao', 4.4, 'Tiago is the safest car in its segment with 4-star rating. Build quality is excellent. Good features and punchy engine.', '2025-11-12'),
(83, 'Ritika Sharma', 4.5, 'Altroz has a premium feel with solid build quality. 5-star safety rating gives peace of mind. iTurbo engine is responsive.', '2025-10-05'),
(85, 'Manish Khanna', 4.7, 'Nexon is the best compact SUV under 15 lakhs. 5-star safety, great features, and powerful engines. Highly recommended.', '2025-12-22'),
(87, 'Kavita Desai', 4.3, 'Punch is a fun micro SUV with SUV stance. Good ground clearance and safety features. Perfect for city and highway drives.', '2025-09-28'),
(89, 'Aditya Bose', 4.6, 'Harrier looks stunning and drives like a dream. Spacious cabin with premium materials. Diesel engine is powerful and refined.', '2026-01-05'),
(91, 'Shruti Menon', 4.7, 'Safari is the ultimate family SUV. Third row is spacious and comfortable. ADAS features add to safety. Build quality is solid.', '2025-11-20'),

-- Mahindra reviews
(117, 'Rajesh Kumar', 4.0, 'Scorpio is a rugged SUV perfect for Indian conditions. Good for off-roading. Slightly dated interiors but very reliable.', '2025-10-18'),
(119, 'Lakshmi Pillai', 4.9, 'XUV700 is a game-changer. ADAS features are best-in-class. Spacious, feature-loaded, and powerful engines. Best value SUV.', '2026-01-15'),
(121, 'Nikhil Sinha', 4.6, 'Thar is a dream come true for off-road enthusiasts. Looks iconic and performs brilliantly on rough terrain. Pure fun to drive.', '2025-12-08'),
(123, 'Anjali Reddy', 4.4, 'XUV300 is a compact SUV with big car features. Safety rating is excellent. Perfect size for urban driving with SUV capabilities.', '2025-09-15'),
(129, 'Varun Kapoor', 4.7, 'Scorpio-N is a worthy successor. Modern design with traditional Scorpio toughness. Feature-rich and comfortable for long drives.', '2025-11-28'),

-- Honda reviews
(137, 'Swati Agarwal', 4.5, 'City is the most refined sedan in its class. Premium interiors and comfortable ride. Petrol engine is smooth and efficient.', '2025-10-22'),
(139, 'Gaurav Sharma', 4.1, 'Amaze is a practical sedan with good build quality. Spacious boot and comfortable rear seats. Diesel variant offers great mileage.', '2025-09-10'),
(145, 'Tanya Singh', 4.6, 'Elevate is Honda comeback in SUV segment. Spacious cabin, comfortable seats, and practical features. Great highway cruiser.', '2026-01-18'),

-- Toyota reviews
(157, 'Harsh Patel', 4.2, 'Glanza is essentially a premium Baleno. Good build quality and reliability. Toyota service network is a big advantage.', '2025-11-05'),
(161, 'Sunita Rao', 4.7, 'Fortuner is the king of SUVs in India. Premium build, powerful engine, and commanding road presence. Built like a tank.', '2025-12-12'),
(163, 'Mohit Verma', 4.6, 'Innova Crysta is the best MPV for family trips. Spacious, comfortable, and reliable. Diesel engine is a workhorse.', '2025-10-28'),
(169, 'Divya Nair', 4.8, 'Hyryder strong hybrid is impressive. Great mileage and smooth performance. ADAS features are cherry on top. Very refined.', '2026-01-22'),

-- Kia reviews
(177, 'Kunal Mehta', 4.3, 'Seltos is a stylish SUV with modern features. Good build quality and comfortable ride. Connected car features are useful.', '2025-11-18'),
(179, 'Priyanka Das', 4.4, 'Sonet is a feature-packed compact SUV. Stylish design and good performance. Perfect for young buyers looking for style and features.', '2025-10-12'),
(181, 'Abhishek Jain', 4.5, 'Carens offers great space for families. 6 and 7-seater options are practical. Feature-rich and comfortable for long journeys.', '2025-12-28'),
(183, 'Radhika Iyer', 4.8, 'Carnival is a luxury MPV with premium features. Spacious and comfortable for all passengers. Perfect for business and family use.', '2026-01-08'),

-- Additional reviews for variety
(11, 'Sandeep Kumar', 4.2, 'Ertiga is the go-to choice for large families. 7-seater with good fuel efficiency. Reliable and low maintenance.', '2025-09-05'),
(31, 'Kritika Rao', 4.4, 'Fronx is a stylish crossover with SUV looks. Good features and comfortable ride. Turbo engine is fun and efficient.', '2025-12-15'),
(101, 'Vivek Sharma', 4.6, 'Curvv SUV coupe design is unique and attractive. Feature-loaded with good safety. Comfortable for daily use and weekend trips.', '2026-01-20'),
(147, 'Megha Patel', 4.7, 'City Hybrid is the future. Amazing mileage without compromising on performance. Honda reliability with eco-friendly tech.', '2025-11-25'),
(185, 'Ravi Menon', 4.9, 'EV6 is a stunning electric SUV. Fast charging and good range. Premium features and futuristic design. Worth the premium price.', '2026-01-28');
