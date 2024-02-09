SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_DeleteCRS_QUES] @CID int
as
	begin
		if exists(select Course_ID from dbo.CRS_QUES where Course_ID=@CID)
			delete from CRS_QUES where Course_ID = @CID
		else
			RAISERROR('Course not found', 16, 1);
	end

GO
