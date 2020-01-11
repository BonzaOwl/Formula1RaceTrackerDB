CREATE PROCEDURE [GetData].[Get_Results]

AS 

BEGIN

	SELECT 
		D.Forename + ' ' + D.Surname as DriverName,
		T.Team_Name,
		SUM(R.Points) as Points

	FROM Race R

	INNER JOIN Driver_Team DT ON 
		DT.Driver_ID = R.Driver_ID

	INNER JOIN Teams T ON 
		T.Team_ID = DT.Team_ID 
		AND T.Active = 1

	INNER JOIN Drivers D ON 
		D.Driver_ID = DT.Driver_ID

	WHERE YEAR(Race_Date) = YEAR(GETDATE()) 

	GROUP BY D.Forename,D.Surname,T.Team_Name

END
