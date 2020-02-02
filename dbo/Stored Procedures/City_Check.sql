CREATE PROCEDURE [dbo].[City_Check]

@City nvarchar(50),
@State INT = 0 OUTPUT

AS

BEGIN

    BEGIN TRY

        BEGIN TRANSACTION
		
		DECLARE @Cnt INT

		SELECT 
			@cnt = COUNT(*) 
		FROM 
			[dbo].[City] C
						

		WHERE
			LOWER(C.printable_name) = LOWER(@City)			

		IF @Cnt >= 1 SET @State = 1 ELSE SET @State = 0		

        COMMIT TRANSACTION;		

    END TRY

    BEGIN CATCH

    ROLLBACK TRANSACTION;

    END CATCH
END