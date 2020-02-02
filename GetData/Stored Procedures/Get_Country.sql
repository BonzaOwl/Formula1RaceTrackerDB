CREATE PROCEDURE GetData.Get_Country

AS

SELECT 
	[Country_ID], 
	[printable_name]
FROM
	[dbo].[Country]