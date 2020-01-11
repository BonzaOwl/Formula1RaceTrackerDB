CREATE TABLE [dbo].[Drivers] (
    [Driver_ID]   INT          NOT NULL,
    [Forename]    VARCHAR (20) NULL,
    [Surname]     VARCHAR (20) NULL,
    [Nationality] VARCHAR (20) NULL,
    [Retired]     BIT          NULL,
    CONSTRAINT [PK_Drivers_ID] PRIMARY KEY CLUSTERED ([Driver_ID] ASC)
);

