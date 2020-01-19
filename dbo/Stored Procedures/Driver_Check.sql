/*******************************************************************************************************
Procedure: [dbo].[Driver_Check]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns a integer value depending on the existance of the submitted 
driver. 

Called By: PopulateDropDown
Affected Table(s): [dbo].[Drivers], [dbo].[Driver_Team], [dbo].[Country]

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [dbo].[Driver_Check]

@Forename nvarchar(50),
@Surname nvarchar(50),
@Team_ID INT,
@Country_ID INT,
@State INT = 0 OUTPUT

AS

BEGIN

    BEGIN TRY

        BEGIN TRANSACTION
		
		DECLARE @Cnt INT

		SELECT 
			@cnt = COUNT(*) 
		FROM 
			[dbo].[Drivers] D

			INNER JOIN [dbo].[Driver_Team] DT ON DT.Driver_ID = D.Driver_ID

			INNER JOIN [dbo].Country C ON C.Country_ID = D.Country_ID

		WHERE
			D.Forename = @Forename
			AND D.Surname = @Surname
			AND DT.Team_ID = @Team_ID
			AND C.Country_ID = @Country_ID

		IF @Cnt >= 1 SET @State = 1		

        COMMIT TRANSACTION;		

    END TRY

    BEGIN CATCH

    ROLLBACK TRANSACTION;

    END CATCH
END