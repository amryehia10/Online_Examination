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
		end
			if not exists(select Phone_Number from Student where Phone_Number=@Pnumber) and (@gender in ('male', 'female'))
				insert into student(Std_FirstName, Std_LastName, Address, Gender, Birth_Date, Phone_Number, Dept_ID)
				values(@FName, @LName, @address, @gender, @Bdate, @Pnumber, @deptID)
			else
				RAISERROR('Duplicate Phone Number or wrong gender', 16, 1);
	end
GO
