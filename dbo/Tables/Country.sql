CREATE TABLE [dbo].[Country]
(
	[Country_ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](80) NOT NULL,
	[Printable_Name] [varchar](80) NOT NULL,
	[Active] [bit] NULL DEFAULT 1
)
