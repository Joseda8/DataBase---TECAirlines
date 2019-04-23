CREATE PROCEDURE users_on_firstclass @flight_id varchar(10)
AS
SELECT full_name FROM CUSTOMER
WHERE(username IN (SELECT username FROM RESERVATION
					WHERE(flight_id = @flight_id) 
					AND is_first_class='True')
			)
GO

EXEC users_on_firstclass @flight_id = '8'

DROP PROCEDURE users_on_firstclass