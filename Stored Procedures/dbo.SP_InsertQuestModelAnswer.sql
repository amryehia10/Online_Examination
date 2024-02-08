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
		end
		if  exists(select @modelAnswer where @modelAnswer in('a', 'b','c','d'))
		begin
			RAISERROR('Model answer must be a or b or c or d', 16, 1);
			return;
		end
		insert into Quest_MODELANSWER(ModelAnswer, QuestionID)
		values(@modelAnswer, @QuestionID)
	end
GO
