CREATE TABLE [dbo].[Race] (
    [Race_ID]        INT      IDENTITY (1, 1) NOT NULL,
    [Race_Date]      DATETIME NULL,
    [Driver_ID]      INT      NULL,
    [Team_ID]        TINYINT  NULL,
    [Circuit_ID]     TINYINT  NULL,
    [Final_Position] TINYINT  NULL,
    [Points]         TINYINT  NULL,
    [Race_Type]      TINYINT  NULL,
    CONSTRAINT [PK_Race_ID] PRIMARY KEY CLUSTERED ([Race_ID] ASC),
    CONSTRAINT [FK_Race_CircuitID] FOREIGN KEY ([Circuit_ID]) REFERENCES [dbo].[Circuit] ([Circuit_ID]),
    CONSTRAINT [FK_Race_DriveID] FOREIGN KEY ([Driver_ID]) REFERENCES [dbo].[Drivers] ([Driver_ID]),
    CONSTRAINT [FK_Race_Team] FOREIGN KEY ([Team_ID]) REFERENCES [dbo].[Teams] ([Team_ID]),
    CONSTRAINT [FK_Race_Type_TypeRef] FOREIGN KEY ([Race_Type]) REFERENCES [dbo].[Race_Types] ([Race_Type_ID])
);

