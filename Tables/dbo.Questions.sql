CREATE TABLE [dbo].[Questions]
(
[QuestionID] [int] NOT NULL IDENTITY(1, 1),
[Grade] [int] NOT NULL,
[TypeID] [int] NULL,
[QuestionHead] [varchar] (500) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questions] ADD CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED ([QuestionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questions] ADD CONSTRAINT [FK_Questions_QUES_TYPE] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[QUES_TYPE] ([TypeID])
GO
