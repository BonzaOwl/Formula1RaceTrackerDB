/*******************************************************************************************************
Procedure: dbo.Retire_Driver
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure sets teh driver into the retired state
proceure. 

Called By: x_retire_driver_Click
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

CREATE PROCEDURE dbo.Retire_Driver

@Driver_ID INT 

AS

BEGIN

	BEGIN TRY

		BEGIN TRANSACTION

		UPDATE 
			dbo.Drivers
		SET Retired = 1
		WHERE
			Driver_ID = @Driver_ID

		COMMIT TRANSACTION

	END TRY

	BEGIN CATCH
	ROLLBACK TRANSACTION
	END CATCH

END