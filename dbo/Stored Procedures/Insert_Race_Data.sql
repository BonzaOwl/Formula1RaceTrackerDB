/*******************************************************************************************************
Procedure: [dbo].[Insert_Race_Data]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure takes the parameters passed from the web application and inserts the 
result data into the race table. The Team ID of the affected driver is also looked up as part of this
proceure. 

Called By: SaveData
Affected Table(s): [dbo].[Race]

Used By: FormulaOneRaceWebApp
Parameters: 
		@Race_Date DATETIME,
		@Driver_ID INT,
		@Circuit_ID INT,    
		@Final_Position TINYINT,
		@Points INT,
		@Race_Type TINYINT,
		@State INT = 0 OUTPUT

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

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

		EXEC [dbo].[Get_Team_ID] @Driver_ID = @Driver_ID, @Team_ID = @Team_ID OUTPUT

        INSERT INTO [dbo].[Race]
        (
        Race_Date,
        Driver_ID,
		Team_ID,
        Circuit_ID,    
        Final_Position,
        Race_Type,
		Points,
        Date_Submitted
        )
        VALUES
        (
            @Race_Date,
            @Driver_ID,
			@Team_ID,
            @Circuit_ID,
            @Final_Position,
            @Race_Type,
			@Points,
            GETDATE()
        );

        COMMIT TRANSACTION;

		SET @State = 1;

    END TRY

    BEGIN CATCH

    ROLLBACK TRANSACTION;

    END CATCH
END


