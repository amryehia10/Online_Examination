SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_InsertQuestModelAnswer] @QuestionID int, @modelAnswer nchar(10)
	as
	begin
		IF @QuestionID IS NULL or not exists(select QuestionID from Questions where QuestionID=@QuestionID)
		begin
			RAISERROR('ID not found', 16, 1);
			return;
		END
        IF NOT EXISTS(SELECT letter FROM dbo.QUEST_CHOICES WHERE letter = @modelAnswer AND QuestionID = @QuestionID)
		begin
			RAISERROR('Model answer isnot found in the choices', 16, 1);
			return;
		end
		insert into Quest_MODELANSWER(ModelAnswer, QuestionID)
		values(@modelAnswer, @QuestionID)
	end
GO
