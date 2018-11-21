Create procedure sp_UpdatePestData @pestID int,  
@name varchar(50),  
@price varchar(50)  
As Begin  
set  
nocount off;  
UPDATE  
pests  
SET  
name = @name,  
price = @price  
WHERE  
pestID = @pestID End 