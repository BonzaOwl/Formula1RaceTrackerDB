/*******************************************************************************************************
Procedure: [dbo].[Update_Driver]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure updates teh specified driver details 
proceure. 

Called By: SaveData
Affected Table(s): dbo.Driver_Team, dbo.Drivers

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [dbo].[Update_Driver]

@Driver_ID INT,
@Forename nvarchar(50),
@Surname nvarchar(50),
@Team_ID INT,
@Country_ID INT,
@State INT = 0 OUTPUT

AS

BEGIN 

	BEGIN TRY

		BEGIN TRANSACTION

			DECLARE @CurTeam INT, @Now DATETIME
			
			SET @CurTeam = (SELECT Team_ID FROM dbo.Driver_Team WHERE Driver_ID = @Driver_ID AND End_date IS NULL)
			SET @Now = GETDATE()

			IF (@CurTeam != @Team_ID)

			BEGIN

				UPDATE dbo.Driver_Team 
			
				SET 
					End_date = @Now

				WHERE
					Driver_ID = @Driver_ID 
					AND End_date IS NULL

				INSERT INTO dbo.Driver_Team (Driver_ID,Team_ID,Start_date)
				VALUES
				(@Driver_ID,@Team_ID,@Now)

			END

			UPDATE dbo.Drivers

			SET 
				Forename = @Forename,
				Surname = @Surname,
				Country_ID = @Country_ID

			WHERE 
				Driver_ID = @Driver_ID
			
			COMMIT TRANSACTION

			SET @State = 1

	END TRY

	BEGIN CATCH

	ROLLBACK TRANSACTION

	END CATCH

END
