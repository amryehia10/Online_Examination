CREATE TABLE [dbo].[Department]
(
[Dept_ID] [int] NOT NULL IDENTITY(1, 1),
[Dept_Location] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Dept_Name] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Manager_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([Dept_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [deptNameConstraint] UNIQUE NONCLUSTERED ([Dept_Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [FK_Department_Instructor] FOREIGN KEY ([Manager_ID]) REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
