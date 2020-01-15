/*******************************************************************************************************
Procedure: [GetData].[Get_Circuits]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns all currently active circuits to the web application
proceure. 

Called By: PopulateDropDown
Affected Table(s): [dbo].[Circuit]

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Circuits]

AS

BEGIN
	
	SELECT 
		C.Circuit_ID,
		C.Grands_Prix_Name as Circuit_Name
	FROM
		[dbo].[Circuit] C
	ORDER BY [Rank]

END