---- Task 1
INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID)
VALUES
    (1, 5, '2022-10-10', 1),
    (2, 3, '2022-11-12', 3),
    (3, 2, '2022-10-11', 2),
    (4, 2, '2022-10-13', 1)


DELIMITER //

CREATE PROCEDURE ManageBooking(IN p_bookingDate DATE, IN p_tableNumber INT, IN p_customerName VARCHAR(100), IN p_contactNumber VARCHAR(20), IN p_email VARCHAR(100))
BEGIN
    DECLARE customerID INT;
    DECLARE tableStatus VARCHAR(50);
    DECLARE customerCount INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO customerCount
    FROM Bookings
    WHERE BookingDate = p_bookingDate AND TableNumber = p_tableNumber;

    IF customerCount > 0 THEN
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked.' AS Message;
    ELSE

        INSERT INTO Customers (FullName, ContactNumber, Email)
        VALUES (p_customerName, p_contactNumber, p_email);

        SET customerID = LAST_INSERT_ID();
        
        INSERT INTO Bookings (TableNumber, BookingDate, CustomerID)
        VALUES (p_tableNumber, p_bookingDate, customerID);

        COMMIT;
        SELECT 'Booking successful.' AS Message;
    END IF;
END;
//

DELIMITER ;


