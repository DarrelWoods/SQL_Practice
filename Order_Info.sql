--Creating one table to conduct the analysis

SELECT c.[FirstName]
      ,c.[LastName]
	  ,g.City
	  ,g.StateProvinceName AS StateName
	  ,g.EnglishCountryRegionName AS CountryName
	  ,d.FullDateAlternateKey AS OrderDate
	  ,s.OrderQuantity
	  ,s.UnitPrice
	  ,p.EnglishProductName AS ProductName
	  ,sp.EnglishProductSubcategoryName AS SubcategoryName
	  ,c.[CustomerKey]
	  ,c.[GeographyKey]
	  ,s.ProductKey
	  ,s.OrderDateKey
	  ,p.ProductSubcategoryKey
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] AS c INNER JOIN DimGeography AS g ON c.GeographyKey = g.GeographyKey
	INNER JOIN FactInternetSales AS s ON c.CustomerKey = s.CustomerKey
	INNER JOIN DimDate AS d ON s.OrderDateKey = d.DateKey
	INNER JOIN DimProduct AS p ON s.ProductKey = p.ProductKey
	INNER JOIN DimProductSubcategory AS sp ON p.ProductSubcategoryKey = sp.ProductSubcategoryKey