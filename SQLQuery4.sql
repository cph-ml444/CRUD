create procedure sp_SelectPestData  
@pestID int  
As  
Begin  
set nocount on;  
select pestID, name, price from pests where pestID=@pestID  
End  