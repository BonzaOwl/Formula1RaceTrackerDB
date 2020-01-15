/*******************************************************************************************************
Procedure: [dbo].[Check_Race_Results]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure will check to see if the results being submitted have already been
added to the database 

Called By: ResultCheck
Affected Table(s): [dbo].[Race]

Used By: FormulaOneWebApp
Parameters: 
		@Race_Date DATETIME,
		@Driver_ID INT,
		@Race_Type INT,
		@Circuit_ID INT,    
		@State INT = 0 OUTPUT

********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [dbo].[Check_Race_Results]

@Race_Date DATETIME,
@Driver_ID INT,
@Race_Type INT,
@Circuit_ID INT,    
@State INT = 0 OUTPUT

AS

BEGIN

    BEGIN TRY

        BEGIN TRANSACTION
		
		DECLARE @Cnt INT

		SELECT 
			@cnt = COUNT(*) 
		FROM 
			[dbo].[Race] R
		WHERE
			Driver_ID = @Driver_ID
			AND Race_Date = @Race_Date
			AND Race_Type = @Race_Type
			AND Circuit_ID = @Circuit_ID		

		IF @Cnt >= 1 SET @State = 1		

        COMMIT TRANSACTION;		

    END TRY

    BEGIN CATCH

    ROLLBACK TRANSACTION;

    END CATCH
END


