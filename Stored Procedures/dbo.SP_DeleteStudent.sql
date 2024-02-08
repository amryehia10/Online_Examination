SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_DeleteStudent] @SID int
as
	begin
		if exists(select Std_ID from Student where Std_ID=@SID)
			delete from Student where Std_ID = @SID
		else
			RAISERROR('ID Not found', 16, 1);
	end
GO
