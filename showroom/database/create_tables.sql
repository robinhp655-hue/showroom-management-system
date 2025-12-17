Create Database BBT;
Use BBT

CREATE TABLE Showroom (
    ShowroomID INT IDENTITY PRIMARY KEY,
    ShowroomName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)); 

    SELECT * FROM Showroom

CREATE TABLE Brand (
    BrandID INT IDENTITY PRIMARY KEY,
    BrandName VARCHAR(50),
    Country VARCHAR(50) DEFAULT'Germany');

    CREATE TABLE CarModel (
    ModelID INT IDENTITY PRIMARY KEY,
    BrandID INT,
    ModelName VARCHAR(50),
    FuelType VARCHAR(20),
    Transmission VARCHAR(20) DEFAULT 'Automatic',
    BodyType VARCHAR(30),
    BasePrice DECIMAL(12,2),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID));

    CREATE TABLE CarInventory (
    CarID INT IDENTITY PRIMARY KEY,
    ModelID INT,
    ShowroomID INT,
    Color VARCHAR(30),
    VIN VARCHAR(50) UNIQUE,
    StockStatus VARCHAR(20), -- Available / Sold
    FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID),
    FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID));

    CREATE TABLE Customer (
    CustomerID INT IDENTITY PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50));

    CREATE TABLE SalesExecutive (
    ExecutiveID INT IDENTITY PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    ShowroomID INT,
    FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID));

    
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

    CREATE TABLE ServiceRecord (
    ServiceID INT IDENTITY PRIMARY KEY,
    CarID INT,
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES CarInventory(CarID));


    CREATE TABLE Insurance (
    InsuranceID INT IDENTITY PRIMARY KEY,
    CarID INT,
    Provider VARCHAR(50),
    PolicyNumber VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CarID) REFERENCES CarInventory(CarID));

    