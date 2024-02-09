SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_InsertCRS_QUES]
	@CID INT,
	@OldQID int,
	@NewQID int
	as
	begin
		if NOT EXISTS(select @CID, @OldQID from dbo.CRS_QUES where Course_ID = @CID AND QuestionID = @OldQID)
		begin
			RAISERROR('Question not found or the course not found', 16, 1);
			RETURN;
		end

		if NOT EXISTS(SELECT QuestionID FROM dbo.Questions WHERE QuestionID = @NewQID)
		BEGIN
			RAISERROR('The the new Question isnot found', 16, 1);
			RETURN;
		END

		update dbo.CRS_QUES
		SET QuestionID = @NewQID
		where Course_ID = @CID AND QuestionID=@OldQID	
	END

GO
