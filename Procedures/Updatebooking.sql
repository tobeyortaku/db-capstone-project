DELIMITER //

CREATE PROCEDURE UpdateBooking(IN p_bookingID INT, IN p_bookingDate DATE)
BEGIN
    UPDATE Bookings
    SET BookingDate = p_bookingDate
    WHERE BookingID = p_bookingID;
    
    SELECT concat('Booking ', p_bookingID ,' updated') AS Message;
END;
//

DELIMITER ;