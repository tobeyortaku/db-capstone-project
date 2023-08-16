DELIMITER //

CREATE PROCEDURE AddBooking(IN p_bookingID INT, IN p_customerID INT, IN p_bookingDate DATE, IN p_tableNumber INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (p_bookingID, p_customerID, p_bookingDate, p_tableNumber);
    
    SELECT 'New booking added' AS Message;
END;
//

DELIMITER ;