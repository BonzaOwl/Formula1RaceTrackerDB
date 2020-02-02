CREATE PROCEDURE [GetData].[Circuit_Types]

AS

SELECT 
	[CircuitType_ID], 
	[Circuit_Type]

FROM
	[Ref].[Circuit_Types]