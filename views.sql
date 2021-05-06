-- Creating a VIEW of the average total 

CREATE VIEW V_AvgTotal AS
SELECT 
	ROUND(AVG(Total), 2) AS [Average Total]
FROM 
	invoices;

-- View the invoices lower than the grand average  

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE Total < 
	(select * from V_AvgTotal)
ORDER BY 
	Total DESC
	
-- Turn the 2010 invoice total average into a VIEW

CREATE VIEW V_2010AvgTotal AS 
SELECT 
	AVG(Total) 
FROM 
	invoices
WHERE 
	InvoiceDate BETWEEN '2010-01-01' AND '2010-12-31';
	
-- Create a view that acts as an inner join between tracks and invoice items

CREATE VIEW V_Tracks_InvoiceItems AS
SELECT 
	ii.InvoiceId,
	ii.UnitPrice,
	ii.Quantity,
	t.Name,
	t.Composer,
	t.Milliseconds
FROM 
	invoice_items AS ii
INNER JOIN 
	tracks AS t
ON 
	ii.TrackId = t.TrackId;

-- Create a view that acts as an inner join betwen invoices, customers, and employee id

CREATE VIEW V_inv_cus_emp AS 
SELECT 
	i.InvoiceId,
	i.InvoiceDate,
	i.Total,
	i.CustomerId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	e.EmployeeId,
	e.LastName,
	e.FirstName,
	e.Title
FROM 
	invoices AS i
INNER JOIN 
	customers as c
ON 
	i.CustomerId = c.CustomerId
INNER JOIN 
	employees as e
ON 
	e.EmployeeId = c.SupportRepId
ORDER BY 
	InvoiceDate;
	
-- Use two views in an inner join 

SELECT 
	* 
FROM 
	V_Tracks_InvoiceItems AS ii
INNER JOIN 
	V_inv_cus_emp AS ice
ON 
	ii.InvoiceId = ice.InvoiceId
	
-- Compare individual city averages against the global average using a view

SELECT 
	BillingCity,
	AVG(Total) AS [City Average],
	(select * FROM V_AvgTotal) AS [Global Average]
FROM
	invoices
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity

-- Save the above query as a VIEW

CREATE VIEW V_CityAvgVsGlobalAvg AS
SELECT 
	BillingCity,
	ROUND(AVG(Total),2) AS [City Average],
	(select * FROM V_AvgTotal) AS [Global Average]
FROM
	invoices
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity;
