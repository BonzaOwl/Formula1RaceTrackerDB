/*******************************************************************************************************
Procedure: [GetData].[Get_Results]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns all of the race results for the current year.
proceure. 

Called By: SaveData
Affected Table(s): [dbo].[Race], [dbo].[Driver_Team], [dbo].[Teams], [dbo].[Drivers]

Used By: FormulaOneRaceWebApp
Parameters: 

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Results]

AS 

BEGIN

	SELECT 
		D.Forename + ' ' + D.Surname as DriverName,
		T.Team_Name,
		SUM(R.Points) as Points

	FROM [dbo].[Race] R

	INNER JOIN [dbo].[Driver_Team] DT ON 
		DT.Driver_ID = R.Driver_ID

	INNER JOIN [dbo].[Teams] T ON 
		T.Team_ID = DT.Team_ID 
		AND T.Active = 1

	INNER JOIN [dbo].[Drivers] D ON 
		D.Driver_ID = DT.Driver_ID

	WHERE YEAR(Race_Date) = YEAR(GETDATE()) 

	GROUP BY D.Forename,D.Surname,T.Team_Name

END
