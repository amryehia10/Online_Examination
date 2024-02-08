CREATE TABLE [dbo].[Course]
(
[Course_ID] [int] NOT NULL IDENTITY(1, 1),
[Course_Name] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Duration] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([Course_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [CourseNameConstraint] UNIQUE NONCLUSTERED ([Course_Name]) ON [PRIMARY]
GO
