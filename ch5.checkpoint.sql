/* Create a case statement that labels all sales from USA as 
domestic and all other sales as foreign
*/

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	BillingCountry,
	Total,
	CASE 
	WHEN BillingCountry = 'USA' THEN 'Domestic Sales'
	ELSE 'Foreign Sales'
	END AS 'SalesType'
FROM 
	invoices
ORDER BY SalesType;

-- How many invoices from Domestic sales were over $15

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	BillingCountry,
	Total,
	CASE 
	WHEN BillingCountry = 'USA' THEN 'Domestic Sales'
	ELSE 'Foreign Sales'
	END AS 'SalesType'
FROM 
	invoices
WHERE 
	BillingCountry LIKE 'USA' AND Total > 15.00;