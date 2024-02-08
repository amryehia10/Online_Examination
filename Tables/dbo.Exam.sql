CREATE TABLE [dbo].[Exam]
(
[ExamID] [int] NOT NULL IDENTITY(1, 1),
[Duration] [int] NOT NULL,
[Type] [varchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Course_ID] [int] NULL,
[Grade] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED ([ExamID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [FK_Exam_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID])
GO
