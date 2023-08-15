-----Task1
DELIMITER //

CREATE PROCEDURE AddBooking(IN p_bookingID INT, IN p_customerID INT, IN p_bookingDate DATE, IN p_tableNumber INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (p_bookingID, p_customerID, p_bookingDate, p_tableNumber);
    
    SELECT 'New booking added' AS Message;
END;
//

DELIMITER ;

---- Task 2
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

----Task 3
DELIMITER //

CREATE PROCEDURE CancelBooking(IN p_bookingID INT)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = p_bookingID;
    
    SELECT concat('Booking ', p_bookingID ,' cancelled') AS Message;
END;
//

DELIMITER ;
