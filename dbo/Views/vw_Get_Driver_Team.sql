CREATE VIEW vw_Get_Driver_Team

AS

SELECT 
	D.Forename,
	D.Surname,
	D.Nationality,
	T.Team_Name,
	DT.Start_date,
	DT.End_date 
FROM 
	[dbo].[Driver_Team] DT 

INNER JOIN [dbo].[Drivers] D ON 
	D.Driver_ID = DT.Driver_ID 
	
INNER JOIN [dbo].[Teams] T ON 
	T.Team_ID = DT.Team_ID