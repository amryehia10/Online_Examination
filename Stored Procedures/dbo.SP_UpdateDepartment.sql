SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_UpdateDepartment]
	@DID int,
	@DeptName varchar(50) = NULL, 
	@location varchar(20) = NULL, 
	@manager INT = NULL
	as
	begin
		if NOT EXISTS(select Dept_ID from dbo.Department where Dept_ID=@DID)
		begin
			RAISERROR('Department not found', 16, 1);
			RETURN;
		end
	
		if NOT EXISTS(select Ins_ID from dbo.Instructor where Ins_ID=@manager) AND @manager IS NOT NULL
		begin
			RAISERROR('Instructor not found', 16, 1);
			RETURN;
		end
		
		update dbo.Department
		set Dept_Name = ISNULL(@DeptName, Dept_Name),
			Dept_Location = ISNULL(@location, Dept_Location),
			Manager_ID = ISNULL(@manager, Manager_ID)
		where Dept_ID = @DID	
	end
GO
