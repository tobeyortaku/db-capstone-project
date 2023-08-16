DELIMITER //

CREATE PROCEDURE CancelBooking(IN p_bookingID INT)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = p_bookingID;
    
    SELECT concat('Booking ', p_bookingID ,' cancelled') AS Message;
END;
//

DELIMITER ;