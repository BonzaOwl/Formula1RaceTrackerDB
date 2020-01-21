CREATE TABLE [dbo].[City]
(
	[City_ID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [name] NVARCHAR(80) NULL, 
    [printable_name] NVARCHAR(80) NULL, 
    [Country_ID] INT,
    [Active] BIT NULL DEFAULT 1, 
    CONSTRAINT [FK_City_Country] FOREIGN KEY (Country_ID) REFERENCES [dbo].[Country](Country_ID)
)
