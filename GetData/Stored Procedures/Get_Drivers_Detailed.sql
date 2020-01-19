/*******************************************************************************************************
Procedure: [GetData].[Get_Drivers_Detailed]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns detailed information about the drivers
proceure. 

Called By: LoadDrivers
Affected Table(s): dbo.Drivers, dbo.Country, dbo.Driver_Team, dbo.Teams

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Drivers_Detailed]

AS

BEGIN
	
	SELECT 

		D.Driver_ID,
		D.Forename,
		D.Surname,
		CASE WHEN Retired = 1 THEN 'Retired' ELSE 'Active' END AS Retired,
		C.printable_name as Country,
		T.Team_Name

		FROM dbo.Drivers D 

		INNER JOIN dbo.Country C ON 
			C.Country_ID = D.Country_ID  

		INNER JOIN dbo.Driver_Team DT ON 
			DT.Driver_ID = D.Driver_ID
			AND End_date IS NULL

		INNER JOIN dbo.Teams T ON 
			T.Team_ID = DT.Team_ID

		ORDER BY 
			T.Team_ID,
			D.Forename,
			D.Surname

END