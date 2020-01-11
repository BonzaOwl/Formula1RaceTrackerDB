CREATE PROCEDURE Get_Team_ID

@Driver_ID INT,
@Team_ID INT OUTPUT

AS

BEGIN

SET @Team_ID =
(
	SELECT 
		Team_ID 
	FROM 
		Driver_Team
	WHERE
		End_date IS NULL 
		AND Driver_ID = @Driver_ID
)

END