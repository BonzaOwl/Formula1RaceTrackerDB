CREATE PROCEDURE GetData.Get_Circuit_Details

@Circuit_ID INT

AS

SELECT
	Cir.[Circuit_ID],
	Cir.[Circuit_Name],
	Cir.[Last_length_used],
	Cir.[Grands_Prix_Name],
	Cir.[Start_date],
	Cir.[End_date],
	Cir.[Rank],
	Cir.Circuit_ID,
	Cir.City_ID,
	Cit.[printable_name] as City,
	Cir.Country_ID,
	Cou.printable_name as Country,
	CT.Circuit_Type,
	Cir.CircuitType_ID,
	CD.Circuit_Direction
	FROM 
		[dbo].[Circuit] Cir

	INNER JOIN dbo.City Cit ON 
		Cit.City_ID = Cir.City_ID

	INNER JOIN dbo.Country Cou ON 
		Cou.Country_ID = Cir.Country_ID
		AND Cou.Active = 1

	INNER JOIN Ref.Circuit_Types CT ON 
		CT.CircuitType_ID = Cir.CircuitType_ID
		AND CT.Active = 1

	INNER JOIN Ref.Circuit_Directions CD ON 
		CD.CircuitDirection_ID = Cir.CircuitDirection_ID
		AND CD.Active = 1

WHERE Circuit_ID = @Circuit_ID