-- Task 1
DELIMITER //
CREATE PROCEDURE GetMaxQuantity (iN quantity int)
BEGIN
    SELECT MAX(quantity) AS MaxQuantity
    FROM Orders;
END;
//

DELIMITER ;

-- Task 2
PREPARE GetOrderDetail FROM
    'SELECT order_id, quantity, total_cost
     FROM Orders
     WHERE customer_id = ?';
     
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3
DELIMITER //
CREATE PROCEDURE CancelOrder(IN p_order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE order_id = p_order_id;
END;
//
DELIMITER ;

CALL CancelOrder(5);



