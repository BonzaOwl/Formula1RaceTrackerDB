CREATE PROCEDURE [dbo].[Insert_Driver]

@Forename nvarchar(50),
@Surname nvarchar(50),
@Team_ID INT,
@Country_ID INT,
@State INT = 0 OUTPUT

AS

BEGIN 

	BEGIN TRY

		BEGIN TRANSACTION

			DECLARE @Driver_ID INT

			INSERT INTO [dbo].[Drivers] ([Forename], [Surname], [Country_ID])
			VALUES
			(@Forename,@Surname,@Country_ID)

			SET @Driver_ID = SCOPE_IDENTITY()

			INSERT INTO [dbo].[Driver_Team] (Driver_ID,Team_ID,Start_date)
			VALUES
			(@Driver_ID,@Team_ID,GETDATE())

			COMMIT TRANSACTION

			SET @State = 1

	END TRY

	BEGIN CATCH

	ROLLBACK TRANSACTION

	END CATCH

END
