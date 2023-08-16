DELIMITER //
CREATE PROCEDURE GetMaxQuantity (iN quantity int)
BEGIN
    SELECT MAX(quantity) AS MaxQuantity
    FROM Orders;
END;
//

DELIMITER ;
