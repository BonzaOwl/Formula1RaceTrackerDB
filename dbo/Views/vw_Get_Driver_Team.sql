﻿CREATE VIEW vw_Get_Driver_Team

AS

SELECT 
	D.Forename,
	D.Surname,
	Cou.printable_name,
	T.Team_Name,
	DT.Start_date,
	DT.End_date 
FROM 
	Driver_Team DT 

INNER JOIN Drivers D ON 
	D.Driver_ID = DT.Driver_ID 
	
INNER JOIN Teams T ON 
	T.Team_ID = DT.Team_ID

INNER JOIN [dbo].[Country] Cou ON
	Cou.Country_ID = D.Country_ID