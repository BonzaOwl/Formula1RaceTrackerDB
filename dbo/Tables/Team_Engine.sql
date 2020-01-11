CREATE TABLE [dbo].[Team_Engine] (
    [Team_ID]    TINYINT      NULL,
    [Engine]     VARCHAR (15) NULL,
    [Start_Date] DATETIME     NULL,
    [End_date]   DATETIME     NULL,
    CONSTRAINT [FK_Team_ID] FOREIGN KEY ([Team_ID]) REFERENCES [dbo].[Teams] ([Team_ID])
);

