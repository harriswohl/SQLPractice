/* Create a new field in the invoices table that differentiates sales 
in given ranges and reframes them as ordinal categorical data. Order
by city to see sales goals in different regions.
*/

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	Total,
	CASE
	WHEN Total < 2.00 THEN 'Baseline Purchase'
	WHEN Total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	WHEN Total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performers'
	END AS PurchaseType
FROM
	invoices
ORDER BY 
	BillingCity;
	
-- Find which cities yield the most top performers

SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	BillingCountry,
	Total,
	CASE
	WHEN Total < 2.00 THEN 'Baseline Purchase'
	WHEN Total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	WHEN Total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performers'
	END AS PurchaseType
FROM
	invoices
WHERE 
	PurchaseType = 'Top Performers'
ORDER BY 
	BillingCity;