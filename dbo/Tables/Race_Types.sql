CREATE TABLE [dbo].[Race_Types] (
    [Race_Type_ID] TINYINT       NOT NULL,
    [Race_Type]    NVARCHAR (10) NULL,
    CONSTRAINT [PK_Race_Type_Ref] PRIMARY KEY CLUSTERED ([Race_Type_ID] ASC)
);

