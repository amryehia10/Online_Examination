SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_DeleteDepartment] @DID int
as
	begin
		if exists(select Dept_ID from dbo.Department where Dept_ID=@DID)
			delete from dbo.Department where Dept_ID = @DID
		else
			RAISERROR('ID Not found', 16, 1);
	end
GO
