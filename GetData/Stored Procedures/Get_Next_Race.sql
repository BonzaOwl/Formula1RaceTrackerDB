/*******************************************************************************************************
Procedure: [GetData].[Get_Next_Race]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns the next circuit on the race calendar to the web application
this includes the circuit name and the race date. 
proceure. 

Called By: NextRace
Affected Table(s): [Ref].[RaceDates], [dbo].[Circuit]

Used By: FormulaOneRaceWebApp
Parameters: 

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Next_Race]

AS

BEGIN

SELECT TOP 1

C.Circuit_Name,
RD.Race_Date

FROM
	[Ref].[RaceDates] RD

INNER JOIN [dbo].[Circuit] C ON 
	C.Circuit_ID = RD.Circuit_ID

WHERE 
	RD.Race_Type = 5 --Race
	AND CAST(Race_Date as DATE) >= CAST(GETDATE() as date)

ORDER BY 

	RD.Race_Date
END