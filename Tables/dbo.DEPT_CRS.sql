CREATE TABLE [dbo].[DEPT_CRS]
(
[Dept_ID] [int] NOT NULL,
[Course_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DEPT_CRS] ADD CONSTRAINT [PK_DEPT_CRS] PRIMARY KEY CLUSTERED ([Dept_ID], [Course_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DEPT_CRS] ADD CONSTRAINT [FK_DEPT_CRS_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DEPT_CRS] ADD CONSTRAINT [FK_DEPT_CRS_Department] FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department] ([Dept_ID])
GO
