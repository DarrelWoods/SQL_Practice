CREATE VIEW SalesTable AS 
SELECT 
	c.CustomerID,
	sh.SalesOrderID,
	c.CompanyName,
	p.Name AS ProductName,
	pc.Name AS CategoryName,
	sd.OrderQty,
	sd.UnitPrice
FROM SalesLT.Customer AS c INNER JOIN SalesLT.SalesOrderHeader AS sh
	ON c.CustomerID = sh.CustomerID
	INNER JOIN SalesLT.SalesOrderDetail AS sd
	ON sh.SalesOrderID = sd.SalesOrderID
	INNER JOIN SalesLT.Product AS p
	ON sd.ProductID = p.ProductID
	INNER JOIN SalesLT.ProductCategory AS pc
	ON p.ProductCategoryID = pc.ProductCategoryID