SELECT *
FROM users
WHERE Status = 'Active'
ORDER BY RegistrationDate DESC;

SELECT CategoryName, COUNT(*) AS ProductCount
FROM products
INNER JOIN productcategories ON products.CategoryID = productcategories.CategoryID
GROUP BY CategoryName
ORDER BY ProductCount DESC;

SELECT *
FROM orders
WHERE Status = 'Shipped'
ORDER BY OrderDate DESC
LIMIT 5;
