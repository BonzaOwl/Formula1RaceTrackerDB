/*******************************************************************************************************
Procedure: [GetData].[Get_Race_Calendar]
Create Date: 12/01/2020
Author: Bonza Owl
Description: This stored procedure returns all currently active race dates 
proceure. 

Called By: LoadRaceDates
Affected Table(s): [Ref].[RaceDates], [dbo].[Race_Types], [dbo].Circuit]

Used By: FormulaOneRaceWebApp
Parameters: 


********************************************************************************************************
** Change History
********************************************************************************************************

** PR	Date (yyyy-mm-dd)		Author			Description
** --	-----------------		-----------		--------------------------------------------------------
** 1
********************************************************************************************************/

CREATE PROCEDURE [GetData].[Get_Race_Calendar]

AS

SELECT

RaceDateID,
C.Grands_Prix_Name,
Race_Date,
RT.Race_Type

FROM Ref.RaceDates RD

INNER JOIN [dbo].[Race_Types] RT ON RT.Race_Type_ID = RD.Race_Type

INNER JOIN [dbo].Circuit C ON C.Circuit_ID = RD.Circuit_ID