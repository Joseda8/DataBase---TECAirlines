CREATE PROCEDURE flights_of_airport @iata_code char(3)
AS
SELECT arrival_ap, depart_ap, flight_id FROM FLIGHT
WHERE(arrival_ap = (SELECT ap_name FROM AIRPORT WHERE(iata_code=@iata_code)) OR depart_ap = (SELECT ap_name FROM AIRPORT WHERE(iata_code=@iata_code)))
GO

EXEC flights_of_airport @iata_code = 'ABS'

DROP PROCEDURE flights_of_airport