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
	   [Circuit_ID]
      ,[Circuit_Name]
      ,Cirt.Circuit_Type
      ,Cird.Circuit_Direction as Direction
      ,Cit.printable_name + ',' + Cou.printable_name as Circuit_Location
      ,[Last_length_used]
      ,[Grands_Prix_Name]
      ,[Start_date]
      ,[End_date]
      ,[Rank]
	FROM
		[dbo].[Circuit] C

		INNER JOIN dbo.Country Cou ON 
			Cou.Country_ID = C.Country_ID

		INNER JOIN dbo.City Cit ON 
			Cit.City_ID = C.City_ID

		INNER JOIN Ref.Circuit_Directions CirD ON 
			CirD.CircuitDirection_ID = C.CircuitDirection_ID

		INNER JOIN Ref.Circuit_Types CirT ON 
			CirT.CircuitType_ID = C.CircuitType_ID

	ORDER BY [Rank]

END