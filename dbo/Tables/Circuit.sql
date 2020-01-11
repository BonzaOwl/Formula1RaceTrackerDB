CREATE TABLE [dbo].[Circuit] (
    [Circuit_ID]       TINYINT        NOT NULL,
    [Circuit_Name]     NVARCHAR (60)  NULL,
    [Circuit_Type]     VARCHAR (50)   NULL,
    [Direction]        VARCHAR (500)  NULL,
    [Circuit_Location] NVARCHAR (50)  NULL,
    [Last_length_used] DECIMAL (5, 3) NULL,
    [Grands_Prix_Name] NVARCHAR (70)  NULL,
    [Start_date]       DATETIME       NULL,
    [End_date]         DATETIME       NULL,
    [Rank]             TINYINT        NULL,
    CONSTRAINT [PK_Circuit_ID] PRIMARY KEY CLUSTERED ([Circuit_ID] ASC)
);

