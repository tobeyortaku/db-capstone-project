use littlelemondb;

-- Task 1
CREATE VIEW OrdersView as select order_id, quantity, total_cost as Cost from Orders;
Select * from OrdersView;

-- Task 2
SELECT
  C.customer_id,
  C.fullname,
  O.orderid,
  O.TotalCost,
  M.menuname,
  MI.coursename,
  MI.startername
FROM
  Customers AS C
JOIN
  Orders AS O ON C.customerid = O.customerid
JOIN
  Menus AS M ON O.menuid = M.menuid
JOIN
  MenusItems AS MI ON M.menuitemsid = MI.menuitemsid
WHERE
  O.TotalCost > 150
ORDER BY
  O.TotalCost ASC;
  
-- Task 3
SELECT
  menuname
FROM
  Menus
WHERE
  menuname = ANY (
    SELECT
      menuname
    FROM
      Orders
    GROUP BY
      menuname
    HAVING
      COUNT(*) > 2
  );
