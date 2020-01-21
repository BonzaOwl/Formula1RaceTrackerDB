CREATE TABLE [dbo].[Circuit] (
    [Circuit_ID]       TINYINT        NOT NULL,
    [Circuit_Name]     NVARCHAR (60)  NULL,
    [Grands_Prix_Name] NVARCHAR (70)  NULL,
    [City_ID] INT NULL, 
    [Country_ID] INT NULL, 
    [CircuitType_ID]   INT            NULL,
    [CircuitDirection_ID]        INT  NULL,
    [Last_length_used] DECIMAL (5, 3) NULL,
    [Start_date]       DATETIME       NULL,
    [End_date]         DATETIME       NULL,
    [Rank]             TINYINT        NULL,
    [Active]           BIT            DEFAULT 1,
    CONSTRAINT [PK_Circuit_ID] PRIMARY KEY CLUSTERED ([Circuit_ID] ASC), 
    CONSTRAINT [FK_Circuit_City] FOREIGN KEY (City_ID) REFERENCES [dbo].[City](City_ID),
    CONSTRAINT [FK_Circuit_Country] FOREIGN KEY (Country_ID) REFERENCES [dbo].[Country](Country_ID),
    CONSTRAINT [FK_Circuit_CircuitTypes] FOREIGN KEY (CircuitType_ID) REFERENCES [Ref].[Circuit_Types](CircuitType_ID),
    CONSTRAINT [FK_Circuit_CircuitDirections] FOREIGN KEY (CircuitDirection_ID) REFERENCES [Ref].[Circuit_Directions](CircuitDirection_ID)
);

