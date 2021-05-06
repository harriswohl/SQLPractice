-- Return the average invoice total 

SELECT 
	ROUND(AVG(Total), 2) AS [Average Total]
FROM 
invoices

-- Return data about all invoices lower than the average

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	Total < 
	(select avg(Total) from invoices)
ORDER BY 
	Total DESC
	
-- Display information on how each individual city is performing relative to total average sales 

SELECT 
	BillingCity,
	ROUND(AVG(Total),2) AS [City Average],
	(select round(avg(total),2) from invoices) AS [Global Average]
FROM 
	invoices
GROUP BY 
	BillingCity 
ORDER BY 
	BillingCity 
	
-- Find out if there are any invoice totals in 2013 which are higher than the largest sale in 2009-2012

SELECT 
	InvoiceDate,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	InvoiceDate >= '2013-01-01' AND total > 
	(select max(total) 
	from invoices
	where InvoiceDate < '2013-01-01') 
	
-- How many invoices were recorded on or before Jan 1 2010 that were above the average invoice amount?

SELECT 
	COUNT(Total)
FROM 
	invoices
WHERE 
	Total > (select avg(total) from invoices) AND InvoiceDate <= '2010-01-01'
	
-- View the invoices recieved after invoice 251

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM 
	invoices
WHERE 
	InvoiceDate > 
	(select InvoiceDate from invoices where InvoiceId = 251)
		
-- View the invoices recieved the same day as invoices 251, 252, and 255

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM 
	invoices
WHERE 
	InvoiceDate IN (select InvoiceDate from invoices where InvoiceID IN (251, 252, 255))
	
-- View InvoiceId and TrackId for my own reference 

SELECT 
	InvoiceId,
	TrackId
FROM 
	invoice_items
ORDER BY 
	TrackId
	
-- Which tracks are not selling at all? 

SELECT 
	TrackId,
	Composer,
	name
FROM 
	tracks 
WHERE 
	TrackId NOT IN 
	(select distinct TrackId from invoice_items)
	
-- How many invoices exceed the average invoice amount generated in 2010?

SELECT 
	COUNT(Total)
FROM 
	invoices
WHERE 
	Total > (select avg(total) from invoices where InvoiceDate between '2010-01-01' and '2010-12-31')
	
-- Who are the customers responsible for these invoices?

SELECT 
	i.CustomerId, 
	i.Total,
	c.FirstName,
	c.LastName,
	c.Country,
	c.Email
FROM 
	invoices as i
INNER JOIN 
	customers as c
ON
	i.CustomerId = c.CustomerId
WHERE
	i.Total > (select avg(total) from invoices where InvoiceDate between '2010-01-01' and '2010-12-31')
ORDER BY 
	Total DESC

-- How many of these customers are from the USA?

SELECT 
	i.CustomerId, 
	i.Total,
	c.FirstName,
	c.LastName,
	c.Email
FROM 
	invoices as i
INNER JOIN 
	customers as c
ON
	i.CustomerId = c.CustomerId
WHERE
	i.Total > (select avg(total) from invoices where InvoiceDate between '2010-01-01' and '2010-12-31')
	AND c.Country = 'USA'
ORDER BY 
	Total DESC