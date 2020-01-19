CREATE PROCEDURE [GetData].[Get_Teams]
	
AS

SELECT 

T.[Team_ID],
T.[Team_Name]

FROM 

	[dbo].[Teams] T

WHERE 

	T.Active = 1