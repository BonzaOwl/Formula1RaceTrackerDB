CREATE PROCEDURE [dbo].[Insert_Circuit]
	@CircuitName nvarchar(60),
	@GrandPrixName nvarchar(70),
	@Country_ID INT,
	@City_ID INT,
	@Circuit_Type INT,
	@CircuitDirection_ID INT

AS

BEGIN

	BEGIN TRY

		BEGIN TRANSACTION

			DECLARE @Now DATETIME,@Circuit_ID INT, @Rank INT
			SET @Now = GETDATE()
			SET @Circuit_ID = (SELECT MAX(Circuit_ID) FROM [dbo].[Circuit])
			SET @Circuit_ID = @Circuit_ID + 1
			SET @Rank = (SELECT MAX(Rank) FROM [dbo].[Circuit])
			SET @Rank = @Rank + 1

			SELECT @Circuit_ID

			INSERT INTO dbo.Circuit ([Circuit_ID],[Circuit_Name], [Grands_Prix_Name], [Start_date], [City_ID], [Country_ID], [CircuitType_ID], [CircuitDirection_ID])
			VALUES
			(@Circuit_ID,@CircuitName,@GrandPrixName,@Now,@City_ID,@Country_ID,@Circuit_Type,@CircuitDirection_ID)

		COMMIT TRANSACTION

	END TRY

	BEGIN CATCH 

	ROLLBACK TRANSACTION

	END CATCH

END