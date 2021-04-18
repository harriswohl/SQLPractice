/* We want to find out how many customers purchased 2 songs at $.99 each. 
This query selects rows in the invoice table that have a total equal to $1.98 
and the number of rows gives us the answer. */

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total 
FROM 
	invoices
WHERE 
	Total = 1.98
ORDER BY 
	InvoiceDate DESC;
	
-- This returns all invoices greater than 1.98

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total > 1.98
ORDER BY 
	InvoiceDate DESC

-- This returns all invoices greater than or equal to 1.98

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total >= 1.98
ORDER BY 
	InvoiceDate DESC
	
-- This returns all invoices that are not 1.98

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total != 1.98
ORDER BY 
	InvoiceDate DESC

-- This returns all invoices between 1.98 and 5.00

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total BETWEEN 1.98 AND 5.00
ORDER BY 
	InvoiceDate DESC
	
-- Find the highest invoice amount in the dataset

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
ORDER BY 
	Total DESC;
	
-- Returns the invoices that have total 1.98 or 3.96

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total in (1.98, 3.96)
ORDER BY 
	InvoiceDate DESC;
	
-- Returns all invoices that have the total amount 13.86, 18.86, and 21.86

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total
FROM
	invoices
WHERE 
	Total in (13.86, 18.86, 21.86)
ORDER BY 
	InvoiceDate DESC;
	
-- Returns the number of invoices billed to Tuscon

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity = 'Tucson'
ORDER BY 
	total;
	
-- Returns invoices mailed to Tucson, Paris, and London

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity in ('Tucson', 'Paris', 'London')
ORDER BY 
	total;

-- Returns invoices that were billed to cities that start with T

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity LIKE 'T%'
ORDER BY 
	total;
	
-- Returns invoices that were shipped to any city that contains a T

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity LIKE '%T%'
ORDER BY 
	total;
	
-- Returns invoices that were shipped to a city that does not have a T in the name

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity NOT LIKE '%T%'
ORDER BY 
	total;
	
-- Returns invoices that were processed Jan 3 2009

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	InvoiceDate = '2009-01-03 00:00:00'
ORDER BY 
	total;
	
-- Returns all invoices issued in 2009

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	InvoiceDate BETWEEN '2009-01-01 00:00:00' AND '2009-12-31 00:00:00'
ORDER BY 
	total;
	
-- Returns the top 10 highest value invoices that occured after July 5 2009

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	InvoiceDate > '07-05-2009 00:00:00'
ORDER BY 
	total DESC
LIMIT 10;
	
-- Returns all invoices processed on Jan 3 2009, this time using the date function 

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	DATE(InvoiceDate) = '2009-01-03'
ORDER BY 
	total;
	
-- Returns invoices that were processed after Jan 2 2010 and had a total of less than $3

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	DATE(InvoiceDate) > '2010-01-02' AND Total < 3
ORDER BY 
	Total;
	
-- Returns invoices whose billing city starts with P and and whose total is greater than $2

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity LIKE 'P%' AND Total > 2
ORDER BY 
	total;

-- Return invoices whose city starts with P or starts with D

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	BillingCity LIKE 'P%' OR BillingCity LIKE 'D%'
ORDER BY 
	total;

-- Return invoices over 1.98 from any city that starts with P or D

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	Total > 1.98 AND (BillingCity LIKE 'p%' or BillingCity LIKE 'd%')
ORDER BY 
	total;

-- Return invoices over $3 from any city that starts with P or D

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM 
	invoices
WHERE 
	Total > 3 AND (BillingCity LIKE 'p%' or BillingCity LIKE 'd%')
ORDER BY 
	total;
	
