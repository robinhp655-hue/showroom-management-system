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