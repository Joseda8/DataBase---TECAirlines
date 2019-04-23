CREATE PROCEDURE active_flight
AS
SELECT flight_id, seats_left, fc_seats_left FROM FLIGHT
WHERE(status = 'ACTIVE')
GO

EXEC active_flight

DROP PROCEDURE active_flight