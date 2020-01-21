CREATE VIEW vw_Circuit_Info_Detailed

AS

SELECT 
	[Circuit_ID]
	,[Circuit_Name]
	,Cirt.Circuit_Type
	,CirD.Circuit_Direction
	,[Last_length_used]
	,[Grands_Prix_Name]
	,Cit.printable_name as City
	,Cou.printable_name as Country
	,[Start_date]
	,[End_date]
	,[Rank]

FROM 
	[dbo].[Circuit] Cir

INNER JOIN [dbo].[City] Cit ON 
	Cit.City_ID = Cir.City_ID
	AND Cit.Active = 1

INNER JOIN [dbo].[Country] Cou ON 
	Cou.Country_ID = Cit.Country_ID
	AND Cou.Active = 1

INNER JOIN [Ref].[Circuit_Directions] CirD ON 
	CirD.CircuitDirection_ID = Cir.CircuitDirection_ID

INNER JOIN [Ref].[Circuit_Types] CirT ON 
	CirT.CircuitType_ID = Cir.CircuitType_ID