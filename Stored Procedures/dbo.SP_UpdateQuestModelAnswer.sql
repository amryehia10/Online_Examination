SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_UpdateQuestModelAnswer] 
	@QuestionID int, @OldmodelAnswer nchar(10), @NewmodelAnswer nchar(10)
	as
	begin
		if NOT EXISTS(select @QuestionID, @OldmodelAnswer from QUEST_MODELANSWER where QuestionID=@QuestionID AND ModelAnswer = @OldmodelAnswer)
		BEGIN
			RAISERROR('Question not found or model answer in the question isnot found', 16, 1);
			RETURN;
		END

		if NOT EXISTS(SELECT letter FROM dbo.QUEST_CHOICES WHERE letter = @NewmodelAnswer)
		BEGIN
			RAISERROR('The letter of the new model answer isnot correct', 16, 1);
			RETURN;
		END

		update Quest_MODELANSWER
		SET ModelAnswer = @NewmodelAnswer
		where ModelAnswer = @OldmodelAnswer AND QuestionID=@QuestionID	
	end
GO
