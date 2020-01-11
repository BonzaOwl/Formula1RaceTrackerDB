﻿CREATE VIEW vw_View_Race_Results_Detailed

AS

SELECT 

R.Race_Date,
D.Forename,
D.Surname,
T.Team_Name,
C.Circuit_Name,
R.Final_Position

FROM Race R

INNER JOIN Drivers D ON 
D.Driver_ID = R.Driver_ID

INNER JOIN Teams T ON
T.Team_ID = R.Team_ID

INNER JOIN Circuit C ON
C.Circuit_ID = R.Circuit_ID

--WHERE C.Circuit_Name = 'Silverstone' AND D.Forename = 'Lewis'