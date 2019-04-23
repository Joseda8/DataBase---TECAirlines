CREATE PROCEDURE flights_of_airplane @plane_id int
AS
SELECT flight_id FROM FLIGHT
WHERE(plane_id = @plane_id)
GO

EXEC flights_of_airplane @plane_id = 87

DROP PROCEDURE flights_of_airplane