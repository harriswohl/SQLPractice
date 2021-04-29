-- Count the number of customer entries whose last name starts with B 

SELECT 
	COUNT(LastName) AS [Name Count]
FROM 
	customers
WHERE 
	LastName LIKE 'B%'
	
-- Select names and addresses from the customers table who live in the US

SELECT 
	FirstName,
	LastName,
	Address
FROM 
	customers
WHERE 
	Country = 'USA'
	
-- Concatenate first name and last name 

SELECT 
	FirstName,
	LastName,
	FirstName || ' ' || LastName AS [Full Name]
FROM 
	customers
WHERE 
	Country = 'USA'

	
-- Add a space to this to create a mailing list 

SELECT 
	FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ' ' || PostalCode AS [Mailing Address]
FROM 
	customers
WHERE
	Country = 'USA'
	
-- Find out the zip code length for each entry 

SELECT 
	PostalCode,
	LENGTH(PostalCode) AS [Postal Code Length]
FROM 
	customers
WHERE 
	Country = 'USA'

-- Truncate the zip codes for uniformity

SELECT 
	PostalCode,
	SUBSTR(PostalCode, 1, 5) AS [Five Digit Postal Code],
	SUBSTR(PostalCode, 7) AS [Digits Removed From Postal Code]
FROM 
	customers
WHERE 
	Country = 'USA'
	
-- Use upper and lower functions

SELECT 
	FirstName AS [First Name Unmodified],
	UPPER(FirstName) AS [First Name in UPPERCASE],
	LOWER(FirstName) AS [First Name in lowercase],
	UPPER(FirstName) || ' ' || UPPER(LastName) AS [Full Name in UPPERCASE]
FROM 
	customers
	
-- Create a list of customers with the last name listed first in capital letters and only the first initial of the first name 

SELECT 
	LastName || ' ' || SUBSTR(FirstName, 1, 1)
FROM 
	customers 
	
-- Convert a datetime value to a string

SELECT 
	STRFTIME('The year is: %Y, the day is: %d, the month is %m', '2011-05-22') AS [Text with conversion specifications]
	
-- Calculate the ages of all employees

SELECT 
	LastName,
	FirstName,
	STRFTIME('%Y-%m-%d', BirthDate) AS [Birthday no Timecode],
	STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', BirthDate) AS Age
FROM 
	employees 
ORDER BY 
	Age
	
/* Birthdays are celebrated at the first of each month. Create a table that shows employee names, birthdays, and the celebration day 
*/

SELECT 
	LastName, 
	FirstName, 
	STRFTIME('%m-%d', Birthdate) AS [Birthday],
	STRFTIME('%m-01', Birthdate) AS [Celebration Day]
FROM 
	employees
ORDER BY 
	Birthday
	
-- List employees by number of years with the company 

SELECT 
	LastName,
	FirstName,
	STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', HireDate) AS [Tenure]
FROM 
	employees
ORDER BY 
	Tenure 
	
-- Find total sales 

SELECT 
	SUM(Total) AS [Total Sales]
FROM 
	invoices

-- Compile summary statistics of sales

SELECT 
	SUM(Total) AS TotalSales,
	ROUND(AVG(Total), 2) AS AverageSales,
	MAX(Total) AS MaxSale,
	MIN(TOTAL) AS MinSale,
	COUNT(*) AS SalesCount
FROM
	invoices
	
-- List the average invoice amount of each City:1

SELECT 
	BillingCity,
	ROUND(AVG(Total),2) AS [Invoice Average]
FROM 
	invoices
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity
	
-- Return the same as the above query, but only for cities that start with L 

SELECT 
	BillingCity,
	ROUND(AVG(Total),2) AS [Invoice Average]
FROM 
	invoices
WHERE 
	BillingCity LIKE 'L%'
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity
	
-- Returns only averages that are greater than $5

SELECT 
	BillingCity,
	AVG(Total)AS [Invoice Average]
FROM 
	invoices
GROUP BY 
	BillingCity
HAVING	
	AVG(Total) > 5
ORDER BY
	BillingCity

-- Returns averages greater than 5 in cities that start with B 

SELECT 
	BillingCity, 
	AVG(Total) AS [Average]
FROM
	invoices
WHERE 
	BillingCity LIKE 'B%'
GROUP BY 
	BillingCity 
HAVING
	AVG(Total) > 5
ORDER BY 
	BillingCity
	
-- Find averages, grouping first by country, then by city 

SELECT 
	BillingCountry, 
	BillingCity,
	AVG(Total) 
FROM 
	invoices
GROUP BY 
	BillingCountry, BillingCity
ORDER BY 
	BillingCountry
	
-- Create a single line mailing list for US customers

SELECT
	UPPER(FirstName) || ' ' || UPPER(LastName) || ' ' || Address || ', ' || City || ', ' || State || SUBSTR(PostalCode, 1, 5) AS [Mailing List]
FROM 
	customers
WHERE 
	Country = 'USA'
	
-- What is average annual sales from US customers

SELECT 
	AVG(Total)
FROM 
	invoices
WHERE
	BillingCountry = 'USA'
	
-- What is the company's all-time total sales

SELECT 
	SUM(Total)
FROM 
	invoices

-- Which ten customers bring in the most revenue?

SELECT 
	c.CustomerId,
	c.LastName,
	c.FirstName,
	SUM(i.Total) AS [Customer Total]
FROM
	invoices AS i 
INNER JOIN 
	customers AS c
ON 
	c.CustomerId = i.CustomerId
GROUP BY 
	c.CustomerId
ORDER BY 
	[Customer Total] DESC
LIMIT 10