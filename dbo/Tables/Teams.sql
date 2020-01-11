CREATE TABLE [dbo].[Teams] (
    [Team_ID]   TINYINT      NOT NULL,
    [Team_Name] VARCHAR (20) NULL,
    [Active]    BIT          DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Team_ID] PRIMARY KEY CLUSTERED ([Team_ID] ASC)
);

