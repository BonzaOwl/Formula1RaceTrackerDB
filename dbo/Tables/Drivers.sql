CREATE TABLE [dbo].[Drivers] (
    [Driver_ID]   INT IDENTITY(1,1) NOT NULL,
    [Forename]    VARCHAR (20) NULL,
    [Surname]     VARCHAR (20) NULL,
    [Country_ID] INT NULL,
    [Retired]     BIT          NULL DEFAULT 0,
    CONSTRAINT [PK_Drivers_ID] PRIMARY KEY CLUSTERED ([Driver_ID] ASC), 
    CONSTRAINT [FK_Drivers_CountryID] FOREIGN KEY (Country_ID) REFERENCES [dbo].[Country] (Country_ID)
);

