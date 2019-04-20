CREATE TRIGGER check_seats_left ON FLIGHT
AFTER UPDATE
AS
  BEGIN
      IF UPDATE(seats_left)
		BEGIN
			UPDATE FLIGHT
			SET status = CASE WHEN (seats_left = 0 AND fc_seats_left = 0) THEN 'FULL' ELSE 'ACTIVE' END
		END
  END

/*
DROP TRIGGER check_seats_left
*/