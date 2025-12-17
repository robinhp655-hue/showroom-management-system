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