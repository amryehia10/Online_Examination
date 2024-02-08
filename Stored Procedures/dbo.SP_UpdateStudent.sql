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
		if exists(select Std_ID from Student where Std_ID=@SID)
		begin
			if not exists(select Phone_Number from Student where Phone_Number=@Pnumber) and (@gender in ('male', 'female', NULL))
				update Student
				set Std_FirstName = ISNULL(@FName, Std_FirstName),
					Std_LastName = ISNULL(@LName, Std_LastName),
					Address = ISNULL(@address, Address),
					Gender = ISNULL(@gender, Gender),
					Birth_Date = ISNULL(@Bdate, Birth_Date),
					Phone_Number = ISNULL(@Pnumber, Phone_Number),
					Dept_ID = ISNULL(@deptID, Dept_ID)
				where Std_ID = @SID
			else
				RAISERROR('Duplicate Phone Number or wrong gender', 16, 1);
		end
		else
			RAISERROR('ID Not found', 16, 1);
	end
GO
