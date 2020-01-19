CREATE PROCEDURE [GetData].[Get_Driver_Details]

@Driver_ID INT

AS

SELECT 

D.Forename,
D.Surname,
C.Country_ID,
T.Team_ID

FROM dbo.Drivers D

INNER JOIN dbo.Driver_Team DT ON DT.Driver_ID = D.Driver_ID

INNER JOIN dbo.Teams T ON T.Team_ID = DT.Team_ID

INNER JOIN dbo.Country C ON C.Country_ID = D.Country_ID

WHERE 
	D.Driver_ID = @Driver_ID