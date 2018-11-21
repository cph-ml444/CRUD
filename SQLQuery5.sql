Create procedure sp_DeletePestData  
@pestID int  
As  
Begin  
set nocount on;  
Delete from pests where pestID=@pestID  
End  