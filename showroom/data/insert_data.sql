
INSERT INTO Showroom (ShowroomName, City, State, Phone, Email)
VALUES
('Elite Motors', 'Delhi', 'Delhi', '9876543210', 'delhi@elitemotors.com'),
('Luxury Wheels', 'Mumbai', 'Maharashtra', '9876501234', 'mumbai@luxurywheels.com');


INSERT INTO Brand (BrandName)
VALUES
('BMW'),
('Mercedes-Benz'),
('Audi'),
('Porsche'),
('Lemborghini');

INSERT INTO CarModel (BrandID, ModelName, FuelType, BodyType, BasePrice)
VALUES
(1, 'BMW X5', 'Petrol', 'SUV', 9500000),
(1, 'BMW 7 Series', 'Petrol', 'Sedan', 17500000),
(2, 'Mercedes GLE', 'Diesel', 'SUV', 9800000),
(3, 'Audi A8', 'Petrol', 'Sedan', 16000000),
(4, 'Porsche Cayenne', 'Petrol', 'SUV', 19000000),
(5, 'Lemborghini Aventador', 'Petrol', 'Sedan',900000000);


INSERT INTO CarInventory (ModelID, ShowroomID, Color, VIN, StockStatus)
VALUES
(1, 1, 'Black', 'VINBMWX5001', 'Available'),
(2, 1, 'White', 'VINBMW7001', 'Available'),
(3, 2, 'Silver', 'VINMBGLE001', 'Available'),
(4, 2, 'Blue', 'VINA8AUDI01', 'Available'),
(5, 1, 'Red', 'VINPOR001', 'Available'),
(6, 1, 'Grey', 'VINAVN001', 'Available');


INSERT INTO Customer (FullName, Phone, Email, City)
VALUES
('Rohit Sharma', '9123456789', 'rohit@gmail.com', 'Delhi'),
('Ankit Verma', '9234567890', 'ankit@gmail.com', 'Mumbai'),
('Neha Kapoor', '9345678901', 'neha@gmail.com', 'Delhi');

INSERT INTO SalesExecutive (FullName, Phone, Email, ShowroomID)
VALUES
('Amit Singh', '9000000001', 'amit@elitemotors.com', 1),
('Karan Mehta', '9000000002', 'karan@luxurywheels.com', 2);


INSERT INTO Sales (BrandID,CarID ,CustomerID, ExecutiveID, SaleDate, SalePrice, PaymentMode)
VALUES
(1,1, 1, 1, '2024-01-15', 9800000, 'Bank Transfer'),
(3,3, 2, 2, '2024-02-10', 10050000, 'Loan');


INSERT INTO ServiceRecord (CarID, ServiceDate, ServiceType, Cost)
VALUES
(1, '2024-06-20', 'First Service', 250000),
(3, '2024-07-15', 'General Service', 300000);


INSERT INTO Insurance (CarID, Provider, PolicyNumber, StartDate, EndDate)
VALUES
(1, 'ICICI Lombard', 'ICICI12345', '2024-01-16', '2025-01-15'),
(3, 'HDFC Ergo', 'HDFC67890', '2024-02-11', '2025-02-10');