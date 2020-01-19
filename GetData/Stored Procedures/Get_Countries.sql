/*******************************************************************************************************
Procedure: [GetData].[Get_Countries]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns all currently active countries to the web application
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

CREATE PROCEDURE [GetData].[Get_Countries]
	
AS

SELECT 

C.Country_ID,
C.printable_name

FROM 

	 [dbo].[Country] C

WHERE 

	C.Active = 1

ORDER BY 
	C.Printable_Name