CREATE TABLE [Ref].[RaceDates] (
    [RaceDateID] INT      IDENTITY (1, 1) NOT NULL,
    [Circuit_ID] TINYINT  NULL,
    [Race_Date]  DATETIME NULL,
    [Race_Type]  TINYINT  NULL,
    [Enabled]    BIT      NULL,
    CONSTRAINT [PK_RaceDates_RaceDateID] PRIMARY KEY CLUSTERED ([RaceDateID] ASC),
    CONSTRAINT [FK_RaceDates_CircuitID] FOREIGN KEY ([Circuit_ID]) REFERENCES [dbo].[Circuit] ([Circuit_ID]),
    CONSTRAINT [FK_RaceDates_Race_Type] FOREIGN KEY ([Race_Type]) REFERENCES [dbo].[Race_Types] ([Race_Type_ID])
);

