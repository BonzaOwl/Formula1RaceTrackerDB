CREATE PROCEDURE [GetData].[Get_Next_Race]

AS

BEGIN

SELECT TOP 1

C.Circuit_Name,
RD.Race_Date

FROM
	[Ref].[RaceDates] RD

INNER JOIN [dbo].[Circuit] C ON C.Circuit_ID = RD.Circuit_ID

WHERE 
	RD.Race_Type = 5
	AND CAST(Race_Date as DATE) >= CAST(GETDATE() as date)
ORDER BY 
	RD.Race_Date

END