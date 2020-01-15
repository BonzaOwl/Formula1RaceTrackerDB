/*******************************************************************************************************
Procedure: [GetData].[Get_Drivers]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns a list of all the active drivers within the database
proceure. 

Called By: PopulateDropDown
Affected Table(s): [dbo].[Drivers], [dbo].[Driver_Team], [dbo].[Teams] 

Used By: FormulaOneRaceWebApp
Parameters: 		

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Drivers]

AS

BEGIN
	
	SELECT 
		D.Driver_ID,
		Forename + ' ' + Surname + ' (' + T.Team_Name + ')' as DriverName,
		T.Team_Name
	FROM
		[dbo].[Drivers] D

	INNER JOIN [dbo].[Driver_Team] DT ON
		DT.Driver_ID = D.Driver_ID

	INNER JOIN [dbo].[Teams] T ON 
		T.Team_ID = DT.Team_ID

	WHERE D.Retired = 0

	ORDER BY 
		Team_Name,DriverName
END