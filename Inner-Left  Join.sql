-- inner join
SELECT Customers.customer_id,Customers.first_name,Orders.amount
    FROM Customers INNER JOIN Orders
    ON Customers.customer_id = Orders.customer;

-- left join
SELECT Customers.customer_id,Customers.first_name,Orders.amount
    FROM Customers LEFT JOIN Orders
    ON Customers.customer_id = Orders.customer;