

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
