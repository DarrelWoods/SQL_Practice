--Creating a table that calculates the total order price per company and assigns a rank to each in descending order
SELECT 
	companyname,
	salesorderid,
	o.Total,
	RANK() OVER(ORDER BY Total DESC) AS TotalRank
FROM
	(SELECT 
		salesorderid,
		companyname,
		SUM(orderqty * unitprice) OVER (PARTITION BY salesorderid) AS Total 
	FROM [AdventureWorksLT2019].[dbo].[SalesTable]
	) AS O
 GROUP BY companyname, salesorderid, o.total