SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_UpdateStudent] 
	@SID int,
	@FName varchar(20) = NULL, 
	@LName varchar(20) = NULL, 
	@address varchar(20) = NULL, 
	@gender varchar(10) = NULL, 
	@Bdate date = NULL, 
	@Pnumber varchar(20) = NULL, 
	@deptID int = NULL
	as
	begin
		if NOT EXISTS(select Std_ID from Student where Std_ID=@SID)
		begin
			RAISERROR('Student not found', 16, 1);
			RETURN;
		end
	
		if exists(select Phone_Number from Student where Phone_Number=@Pnumber)
		begin
			RAISERROR('Duplicate Phone Number', 16, 1);
			RETURN;
		end
		IF (@gender NOT IN ('male', 'female')) OR @gender IS NOT NULL
		begin
			RAISERROR('Wrong gender', 16, 1);
			RETURN;
		end

		IF NOT EXISTS(SELECT Dept_ID FROM dbo.Department WHERE Dept_ID = @deptID) AND @deptID IS NOT NULL
		begin
			RAISERROR('Department ID Not found', 16, 1);
			RETURN;
		END
        
		update Student
		set Std_FirstName = ISNULL(@FName, Std_FirstName),
			Std_LastName = ISNULL(@LName, Std_LastName),
			Address = ISNULL(@address, Address),
			Gender = ISNULL(@gender, Gender),
			Birth_Date = ISNULL(@Bdate, Birth_Date),
			Phone_Number = ISNULL(@Pnumber, Phone_Number),
			Dept_ID = ISNULL(@deptID, Dept_ID)
		where Std_ID = @SID	
	end
GO
