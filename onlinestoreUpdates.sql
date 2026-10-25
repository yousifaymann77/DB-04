-----Insert Operations-----
use OnlineRetailStoreDB

--Insert Customer--
insert into Customers
values(1,'Yousif Ayman Shehab','01064079131','yhehab693@gmail.com','Shebin Elkom','2026-10-11')


--Insert 3 Suppliers--
insert into Suppliers
values(1,'Mohamed','012345678' , 'Giza' , 'mohamed@gmail.com' , 'Giza Governorate'),
(2,'Ali','0105678456' , 'Cairo' , 'Ali@gmail.com' , 'Cairo Governorate'),
(3,'Ahmed','010123321' , 'Menofia' , 'Ahmed@gmail.com' , 'Menofia Governorate')


--Insert 2 categories--
insert into Categories
values(1 , 'Electric' , 'Electric Products' , 1),
(2 , 'Phones' , 'All Types of phones you need ' , 1)


--Insert a Product--
-- can not insert name and unit price only because the primary key does not have identity constraint and the stockquantity does not have default value or allow null
insert into Products (Name , UnitPrice)
values('Iphone 18 pro max' , 150000)


--This is valid
insert into Products (ProductId , Name ,StockQuantity, UnitPrice)
values(1,'Iphone 18 pro max' , 20,150000)


--Create Table ArchivedStock
Create Table ArchivedStock (
tranId int references stockTransactions(TranId) primary key ,
ProductId int references Products(ProductId) ,
QuantityChange int ,
TranDate Date 
)


--insert Trans before 2023
insert into ArchivedStock
select TranId , ProductId , QuantityChange , TranDate
from StockTransactions
where TranDate < '2023-01-01'


----UPDATE operations----

update Products
set UnitPrice += (UnitPrice *0.1) 
where UnitPrice < 100 


update Orders
set status = case 
				when TotalAmount > 5000 then 'Premium'
				else 'Standard'
				end