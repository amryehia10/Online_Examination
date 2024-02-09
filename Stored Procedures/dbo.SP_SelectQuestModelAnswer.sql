SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   proc [dbo].[SP_SelectQuestModelAnswer] @QuestionID int
as
	begin
		if exists(select QuestionID from Quest_MODELANSWER where QuestionID=@QuestionID)
			select * from Quest_MODELANSWER where QuestionID=@QuestionID
		else
			RAISERROR('Question not found', 16, 1);
	END
GO
