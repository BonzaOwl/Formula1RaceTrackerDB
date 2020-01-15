CREATE VIEW vw_View_Race_Results_Detailed

AS

SELECT 

R.Race_Date,
D.Forename,
D.Surname,
T.Team_Name,
C.Circuit_Name,
R.Final_Position

FROM [dbo].[Race] R

INNER JOIN [dbo].[Drivers] D ON 
	D.Driver_ID = R.Driver_ID

INNER JOIN [dbo].[Teams] T ON
	T.Team_ID = R.Team_ID

INNER JOIN [dbo].[Circuit] C ON
	C.Circuit_ID = R.Circuit_ID

--WHERE C.Circuit_Name = 'Silverstone' AND D.Forename = 'Lewis'