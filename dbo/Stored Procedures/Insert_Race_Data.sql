CREATE PROCEDURE [dbo].[Insert_Race_Data]

@Race_Date DATETIME,
@Driver_ID INT,
@Circuit_ID INT,    
@Final_Position TINYINT,
@Points INT,
@Race_Type TINYINT,
@State INT = 0 OUTPUT

AS

BEGIN

	DECLARE @Team_ID INT

    BEGIN TRY

        BEGIN TRANSACTION

		EXEC @Team_ID = [dbo].[Get_Team_ID] @Driver_ID = @Driver_ID, @Team_ID = @Team_ID OUTPUT

		SET @Team_ID = @Team_ID

        INSERT INTO Race 
        (
        Race_Date,
        Driver_ID,
		Team_ID,
        Circuit_ID,    
        Final_Position,
        Race_Type,
		Points
        )
        VALUES
        (
            @Race_Date,
            @Driver_ID,
			@Team_ID,
            @Circuit_ID,
            @Final_Position,
            @Race_Type,
			@Points
        );

        COMMIT TRANSACTION;

		SET @State = 1;

    END TRY

    BEGIN CATCH

    ROLLBACK TRANSACTION;

    END CATCH
END


