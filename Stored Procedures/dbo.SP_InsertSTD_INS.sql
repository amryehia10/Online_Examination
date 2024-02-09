SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_InsertSTD_INS] @SID int, @InsID int
	as
	begin
		IF @SID IS NULL or not exists(select Std_ID from dbo.Student where Std_ID=@SID)
		begin
			RAISERROR('Student ID not found', 16, 1);
			return;
		end
		IF @InsID IS NULL or not exists(select Ins_ID from dbo.Instructor where Ins_ID=@InsID)
		begin
			RAISERROR('Instructor ID not found', 16, 1);
			return;
		end
		insert into STD_INS(Std_ID, Ins_ID)
		values(@SID, @InsID)
	end
GO
