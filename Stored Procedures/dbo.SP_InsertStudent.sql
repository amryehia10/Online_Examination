SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_InsertStudent] 
	@FName varchar(20), 
	@LName varchar(20), 
	@address varchar(20), 
	@gender varchar(10), 
	@Bdate date, 
	@Pnumber varchar(20), 
	@deptID int
	as
	begin
		IF @FName IS NULL OR @LName IS NULL OR @address IS NULL OR @gender IS NULL
        OR @Bdate IS NULL OR @Pnumber IS NULL OR @deptID IS NULL
		begin
			RAISERROR('One or more parameters are NULL', 16, 1);
			return;
		END

        if exists(select Phone_Number from Student where Phone_Number=@Pnumber)
		begin
			RAISERROR('Duplicate Phone Number', 16, 1);
			RETURN;
		end
		IF (@gender NOT IN ('male', 'female'))
		begin
			RAISERROR('Wrong gender', 16, 1);
			RETURN;
		end
		
		IF NOT EXISTS(SELECT Dept_ID FROM dbo.Department WHERE Dept_ID = @deptID)
		begin
			RAISERROR('Department ID Not found', 16, 1);
			RETURN;
		END
        
		insert into student(Std_FirstName, Std_LastName, Address, Gender, Birth_Date, Phone_Number, Dept_ID)
		values(@FName, @LName, @address, @gender, @Bdate, @Pnumber, @deptID)
		
	end
GO
