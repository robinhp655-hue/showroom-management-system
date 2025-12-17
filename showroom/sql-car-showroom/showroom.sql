Create Database BBT;
Use BBT

CREATE TABLE Showroom (
    ShowroomID INT IDENTITY PRIMARY KEY,
    ShowroomName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)); 

INSERT INTO Showroom (ShowroomName, City, State, Phone, Email)
VALUES
('Elite Motors', 'Delhi', 'Delhi', '9876543210', 'delhi@elitemotors.com'),
('Luxury Wheels', 'Mumbai', 'Maharashtra', '9876501234', 'mumbai@luxurywheels.com');

SELECT * FROM Showroom

CREATE TABLE Brand (
    BrandID INT IDENTITY PRIMARY KEY,
    BrandName VARCHAR(50),
    Country VARCHAR(50) DEFAULT'Germany');

INSERT INTO Brand (BrandName)
VALUES
('BMW'),
('Mercedes-Benz'),
('Audi'),
('Porsche'),
('Lemborghini');

SELECT * FROM Brand

CREATE TABLE CarModel (
    ModelID INT IDENTITY PRIMARY KEY,
    BrandID INT,
    ModelName VARCHAR(50),
    FuelType VARCHAR(20),
    Transmission VARCHAR(20) DEFAULT 'Automatic',
    BodyType VARCHAR(30),
    BasePrice DECIMAL(12,2),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID));

INSERT INTO CarModel (BrandID, ModelName, FuelType, BodyType, BasePrice)
VALUES
(1, 'BMW X5', 'Petrol', 'SUV', 9500000),
(1, 'BMW 7 Series', 'Petrol', 'Sedan', 17500000),
(2, 'Mercedes GLE', 'Diesel', 'SUV', 9800000),
(3, 'Audi A8', 'Petrol', 'Sedan', 16000000),
(4, 'Porsche Cayenne', 'Petrol', 'SUV', 19000000),
(5, 'Lemborghini Aventador', 'Petrol', 'Sedan',900000000);

SELECT * FROM CarModel

CREATE TABLE CarInventory (
    CarID INT IDENTITY PRIMARY KEY,
    ModelID INT,
    ShowroomID INT,
    Color VARCHAR(30),
    VIN VARCHAR(50) UNIQUE,
    StockStatus VARCHAR(20), -- Available / Sold
    FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID),
    FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID));

INSERT INTO CarInventory (ModelID, ShowroomID, Color, VIN, StockStatus)
VALUES
(1, 1, 'Black', 'VINBMWX5001', 'Available'),
(2, 1, 'White', 'VINBMW7001', 'Available'),
(3, 2, 'Silver', 'VINMBGLE001', 'Available'),
(4, 2, 'Blue', 'VINA8AUDI01', 'Available'),
(5, 1, 'Red', 'VINPOR001', 'Available'),
(6, 1, 'Grey', 'VINAVN001', 'Available');

SELECT * FROM CarInventory

CREATE TABLE Customer (
    CustomerID INT IDENTITY PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50));

INSERT INTO Customer (FullName, Phone, Email, City)
VALUES
('Rohit Sharma', '9123456789', 'rohit@gmail.com', 'Delhi'),
('Ankit Verma', '9234567890', 'ankit@gmail.com', 'Mumbai'),
('Neha Kapoor', '9345678901', 'neha@gmail.com', 'Delhi');

SELECT * FROM Customer

CREATE TABLE SalesExecutive (
    ExecutiveID INT IDENTITY PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    ShowroomID INT,
    FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID));

INSERT INTO SalesExecutive (FullName, Phone, Email, ShowroomID)
VALUES
('Amit Singh', '9000000001', 'amit@elitemotors.com', 1),
('Karan Mehta', '9000000002', 'karan@luxurywheels.com', 2);

SELECT * FROM SalesExecutive

CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    BrandID INT,
    CarID INT,
    CustomerID INT,
    ExecutiveID INT,
    SaleDate DATE,
    SalePrice DECIMAL(12,2),
    PaymentMode VARCHAR(30),
    FOREIGN KEY (CarID) REFERENCES CarInventory(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ExecutiveID) REFERENCES SalesExecutive(ExecutiveID));
INSERT INTO Sales (BrandID,CarID ,CustomerID, ExecutiveID, SaleDate, SalePrice, PaymentMode)
VALUES
(1,1, 1, 1, '2024-01-15', 9800000, 'Bank Transfer'),
(3,3, 2, 2, '2024-02-10', 10050000, 'Loan');

SELECT * FROM Sales

CREATE TABLE ServiceRecord (
    ServiceID INT IDENTITY PRIMARY KEY,
    CarID INT,
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES CarInventory(CarID));

INSERT INTO ServiceRecord (CarID, ServiceDate, ServiceType, Cost)
VALUES
(1, '2024-06-20', 'First Service', 250000),
(3, '2024-07-15', 'General Service', 300000);

SELECT * FROM ServiceRecord

CREATE TABLE Insurance (
    InsuranceID INT IDENTITY PRIMARY KEY,
    CarID INT,
    Provider VARCHAR(50),
    PolicyNumber VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CarID) REFERENCES CarInventory(CarID));

INSERT INTO Insurance (CarID, Provider, PolicyNumber, StartDate, EndDate)
VALUES
(1, 'ICICI Lombard', 'ICICI12345', '2024-01-16', '2025-01-15'),
(3, 'HDFC Ergo', 'HDFC67890', '2024-02-11', '2025-02-10');

SELECT * FROM Insurance

--ALTER

--Add a column WarrantyYears (default 3) to the CarModel table.
ALTER table CarModel add  WarrantyYears int default 3

--UPDATE

--Update the StockStatus to 'Sold' for all cars that exist in the Sales table.

update CarInventory
set StockStatus ='Sold'

select * from CarInventory

--Increase the BasePrice of all BMW car models by 5%.

update CarModel
set BasePrice=((BasePrice*5)/100)+BasePrice
where ModelName='BMW X5'

SELECT * FROM CarModel


-- GROUP BY

--Find the total number of cars sold by each showroom.
SELECT Showroom.ShowroomName, count(CarInventory.StockStatus) as StockSold
from Showroom
join CarInventory
on Showroom.ShowroomID=CarInventory.ShowroomID
group by Showroom.ShowroomID,Showroom.ShowroomName

--Display total sales amount generated by each car brand.
select Brand.BrandName ,sum(sales.SalePrice) as TotalSales
from Brand
join Sales
on Brand.BrandID=Sales.BrandID
group by Brand.BrandName,Brand.BrandID


--HAVING

--List sales executives whose total sales value exceeds ₹1 crore.

select SalesExecutive.FullName,sum(Sales.SalePrice) as TotalSales
from SalesExecutive
join Sales
on SalesExecutive.ExecutiveID=Sales.ExecutiveID
group by SalesExecutive.FullName,SalesExecutive.ExecutiveID
having sum(Sales.SalePrice)>10000000


--🔀 IF…ELSE

--If SalePrice ≥ ₹1,00,00,000 → print 'High Value Sale'
--Else → print 'Standard Sale'
declare @saleprice int
select @saleprice = SalePrice from Sales
if @saleprice>=10000000
print('High Value Sale')
Else
print 'Standard Sale'

--Check whether a given CarID exists in CarInventory.
--If yes → print 'Car Exists in Inventory'
--Else → print 'Invalid Car ID'

declare @carexists int
select @carexists= CarID from CarInventory where CarID=2
if @carexists is not null
print 'Car Exists in Inventory'
else
print 'Invalid Car ID'

--Using a WHILE loop, update all cars whose StockStatus is NULL and set it to 'Available'.

declare @count int=1;
declare @stockstatus varchar(20)

select @stockstatus = count (*) from CarInventory
while @count<=@stockstatus
begin
      update CarInventory
      set StockStatus='Available'
      where StockStatus='Sold'
    set @count+=@count
end

select* from CarInventory

 --TRIGGER

 --Create a trigger that automatically updates CarInventory.StockStatus to 'Sold' 
 --when a new record is inserted into the Sales table.

 create table CarInventory_log
 (
    log_id int identity,
    actiondate date,
    actiontype varchar(20)
    );
   
    create trigger trg_CarInventory
    on CarInventory
    after insert
    as
    begin
    insert into CarInventory_log(actiondate,actiontype)
    select getdate(),'Insert'
    from inserted

    end;

--Create a trigger that prevents selling a car if its StockStatus is already 'Sold'

  create trigger trg_stockStatus
  on CarInventory
  after update
  as
  begin 
      if exists(
                select 1
                from inserted
                join deleted
                on inserted.CarID=deleted.CarID
                where inserted.StockStatus='Sold'
                and deleted.StockStatus='Sold'
                )
     begin 
          
          throw 50001,'Car already sold', 1;
    end;
end;

--Display all sales with:
--SaleID
--SalePrice
--Running total of sales amount ordered by SaleDate

SELECT
    SaleID,
    SalePrice,
    SaleDate,
    SUM(SalePrice) OVER (
        ORDER BY SaleDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Sales
ORDER BY SaleDate;





















