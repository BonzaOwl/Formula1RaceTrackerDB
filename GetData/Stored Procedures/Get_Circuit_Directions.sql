CREATE PROCEDURE GetData.Get_Circuit_Directions

AS

SELECT
	CircuitDirection_ID,
	Circuit_Direction

FROM 
	[Ref].[Circuit_Directions]