CREATE TRIGGER delete_sale ON FLIGHT
AFTER UPDATE
AS
	BEGIN
		IF UPDATE(status)
			DELETE FROM SALE WHERE flight_id = (SELECT flight_id FROM FLIGHT WHERE(status='Closed'))
	END

/*
DROP TRIGGER delete_sale
*/
