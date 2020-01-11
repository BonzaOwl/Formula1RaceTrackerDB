CREATE PROCEDURE [GetData].Get_Race_Types

AS

BEGIN
	
	SELECT 
		Race_Type_ID,
		Race_Type
	FROM
		Race_Types

END