CREATE PROCEDURE [GetData].[Get_Race_Calendar]

AS

SELECT

RaceDateID,
C.Grands_Prix_Name,
Race_Date,
RT.Race_Type

FROM Ref.RaceDates RD

INNER JOIN [dbo].[Race_Types] RT ON RT.Race_Type_ID = RD.Race_Type

INNER JOIN [dbo].Circuit C ON C.Circuit_ID = RD.Circuit_ID