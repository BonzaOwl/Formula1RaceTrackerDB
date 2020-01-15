/*******************************************************************************************************
Procedure: [dbo].[Get_Team_ID]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored proceudre get the Team ID of the driver 

Called By: Insert_Race_Data
Affected Table(s): [dbo].[Driver_Team]

Used By: FormulaOneRaceTrackerDB
Parameters: 
		@Driver_ID INT,
		@Team_ID INT OUTPUT

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [dbo].[Get_Team_ID]

@Driver_ID INT,
@Team_ID INT OUTPUT

AS

BEGIN

SET @Team_ID =
(
	SELECT 
		Team_ID 
	FROM 
		Driver_Team
	WHERE
		End_date IS NULL 
		AND Driver_ID = @Driver_ID
)

END