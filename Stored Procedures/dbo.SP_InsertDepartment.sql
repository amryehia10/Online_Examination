SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_InsertDepartment]
	@DeptName VARCHAR(50), 
	@location varchar(20), 
	@manager int
	as
	begin
		IF @DeptName IS NULL OR @location IS NULL OR @manager IS NULL
		begin
			RAISERROR('One or more parameters are NULL', 16, 1);
			return;
		end

		if NOT EXISTS(select Ins_ID from dbo.Instructor where Ins_ID=@manager)
		begin
			RAISERROR('Instructor ID Not found', 16, 1);
			RETURN;
		END

		insert into Department(Dept_Location, Dept_Name, Manager_ID)
		values(@location, @DeptName, @manager)
	
	end
GO
