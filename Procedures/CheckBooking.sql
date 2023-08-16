---- Task 2
DELIMITER //

CREATE PROCEDURE CheckBooking(IN p_bookingDate DATE, IN p_tableNumber INT)
BEGIN
    DECLARE tableStatus VARCHAR(50);

    SELECT CASE
        WHEN COUNT(*) > 0 THEN 'Booked'
        ELSE 'Available'
    END INTO tableStatus
    FROM Bookings
    WHERE BookingDate = p_bookingDate AND TableNumber = p_tableNumber;

    -- Return the table status
    IF tableStatus = 'Booked' THEN
        SELECT CONCAT('Table ', p_tableNumber, ' is already booked') AS Message;
    ELSE
        SELECT CONCAT('Table ', p_tableNumber, ' is available') AS Message;
    END IF;
END;
//

DELIMITER ;
