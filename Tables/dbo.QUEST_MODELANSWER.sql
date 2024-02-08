CREATE TABLE [dbo].[QUEST_MODELANSWER]
(
[ModelAnswer] [nchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[QuestionID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QUEST_MODELANSWER] ADD CONSTRAINT [PK_QUEST_MODELANSWER] PRIMARY KEY CLUSTERED ([ModelAnswer], [QuestionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QUEST_MODELANSWER] ADD CONSTRAINT [FK_QUEST_MODELANSWER_Questions] FOREIGN KEY ([QuestionID]) REFERENCES [dbo].[Questions] ([QuestionID])
GO