/*******************************************************************************************************
Procedure: [GetData].[Get_Teams]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns all currently active teams to the web application
proceure. 

Called By: PopulateDropDown
Affected Table(s): [[dbo].[Teams] 

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Teams]
	
AS

SELECT 

T.[Team_ID],
T.[Team_Name]

FROM 

	[dbo].[Teams] T

WHERE 

	T.Active = 1