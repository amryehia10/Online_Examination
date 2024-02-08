CREATE TABLE [dbo].[Student]
(
[Std_ID] [int] NOT NULL IDENTITY(1, 1),
[Std_FirstName] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Std_LastName] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Address] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Gender] [varchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Birth_Date] [date] NOT NULL,
[Phone_Number] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Dept_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [CheckGender] CHECK (([Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([Std_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PhoneNumberConstraint] UNIQUE NONCLUSTERED ([Phone_Number]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Department] FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department] ([Dept_ID])
GO
