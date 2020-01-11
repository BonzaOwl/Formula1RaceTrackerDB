CREATE PROCEDURE [GetData].[Get_Circuits]

AS

BEGIN
	
	SELECT 
		Circuit_ID,
		Grands_Prix_Name as Circuit_Name
	FROM
		Circuit
	ORDER BY Rank

END