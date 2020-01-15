/*******************************************************************************************************
Procedure: [GetData].[Get_Race_Types]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns the race types.

Called By: PopulateDropDown
Affected Table(s): [dbo].[Race_Types]

Used By: FormulaOneRaceWebApp
Parameters: 

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Race_Types]

AS

BEGIN
	
	SELECT 
		RT.Race_Type_ID,
		RT.Race_Type
	FROM
		[dbo].[Race_Types] RT

END