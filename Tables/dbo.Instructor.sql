CREATE TABLE [dbo].[Instructor]
(
[Ins_ID] [int] NOT NULL IDENTITY(1, 1),
[Ins_Name] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Salary] [int] NOT NULL,
[Degree] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Dept_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([Ins_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [FK_Instructor_Department] FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department] ([Dept_ID])
GO
