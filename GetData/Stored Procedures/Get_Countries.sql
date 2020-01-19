CREATE PROCEDURE [GetData].[Get_Countries]
	
AS

SELECT 

C.Country_ID,
C.printable_name

FROM 

	 [dbo].[Country] C

WHERE 

	C.Active = 1

ORDER BY 
	C.Printable_Name