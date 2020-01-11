CREATE PROCEDURE [GetData].[Get_Drivers]

AS

BEGIN
	
	SELECT 
		D.Driver_ID,
		Forename + ' ' + Surname + ' (' + T.Team_Name + ')' as DriverName,
		T.Team_Name
	FROM
		Drivers D

	INNER JOIN [dbo].[Driver_Team] DT ON
		DT.Driver_ID = D.Driver_ID

	INNER JOIN Teams T ON 
		T.Team_ID = DT.Team_ID

	WHERE D.Retired = 0

	ORDER BY 
		Team_Name,DriverName
END