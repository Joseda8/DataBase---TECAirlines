CREATE PROCEDURE same_university @university varchar(60), @flight_id varchar(10)
AS
SELECT full_name FROM CUSTOMER
WHERE(username IN (SELECT username FROM RESERVATION
					WHERE(flight_id = @flight_id)
			) AND is_student='True')
GO

EXEC same_university @university = 'ITCR', @flight_id = '8'

DROP PROCEDURE same_university