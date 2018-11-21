create procedure sp_InsertPestData @name varchar(50),  
@price varchar(50) As Begin  
set  
nocount on;  
Insert into dbo.pests (name, price)  
values  
(@name, @price) End  