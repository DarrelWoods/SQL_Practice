 --Calculate a running total column for the total order price of each company
   SELECT
	CompanyName,
	OrderQty,
	UnitPrice,
	SUM(OrderQty * UnitPrice) OVER (PARTITION BY Companyname ORDER BY unitprice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
 FROM [AdventureWorksLT2019].[dbo].[SalesTable]

 --Calculate a running total column for the amount of products sold
SELECT
	ProductName,
	OrderQty,
	SUM(orderqty) OVER (PARTITION BY productname ORDER BY orderqty ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
 FROM [AdventureWorksLT2019].[dbo].[SalesTable]
 /*
 By default analytic functions use a RANGE windowing directive. ie: the statment below will group the duplicated values together and provide the sum
 The following is needed to use a ROW based directive (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), in the case that certain rows contain the same values

 SELECT
	ProductName,
	OrderQty,
	SUM(orderqty) OVER (PARTITION BY productname ORDER BY orderqty) AS RunningTotal
 FROM [AdventureWorksLT2019].[dbo].[SalesTable]
  */