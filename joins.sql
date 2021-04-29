-- Join customer and invoice

SELECT 
	*
FROM 
	invoices
INNER JOIN 
	customers
ON
	invoices.CustomerId = customers.CustomerId
	
--inner join invoices and customers but this time use alias

SELECT 
	*
FROM 
	invoices AS i
INNER JOIN 
	customers as c
ON 
	i.CustomerId = c.CustomerID

-- Join chosen columns from invoice and customer table 

SELECT
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.CustomerId,
	i.InvoiceDate,
	i.Total 
FROM
	invoices as i
INNER JOIN 
	customers as c
ON 
	i.CustomerID = c.CustomerID
ORDER BY 
	c.LastName
	
-- Join columns from invoice and customer table using a left outer join 

SELECT 
	i.InvoiceId,
	c.CustomerId,
	c.FirstName,
	c.LastName,
	c.Address,
	i.InvoiceDate,
	i.BillingAddress,
	i.Total
FROM 
	invoices AS i
LEFT OUTER JOIN 
	customers AS c
ON 
	i.CustomerID = c.CustomerID

-- Find the employees that helped customers in the 10 highest sales

SELECT 
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.CustomerId,
	ii.UnitPrice,
	ii.Quantity
	i.Total
FROM 
	invoices AS i
INNER JOIN 
	customers AS c
ON 
	i.CustomerId = c.CustomerId
INNER JOIN 
	employees as e
ON 
	c.SupportRepId = e.EmployeeId
ORDER BY 
	i.Total DESC
LIMIT 10

-- We want to find out how many artists do not have an album listed

SELECT 
	ar.ArtistId AS [ArtistId from artists table],
	al.ArtistId AS [ArtistId from albums table],
	ar.Name AS [Artist Name],
	al.Title AS [Album Title]
FROM
	artists AS ar
LEFT OUTER JOIN 
	albums AS al 
ON 
	ar.ArtistId = al.ArtistId
WHERE
	al.ArtistId IS NULL

-- Merge album info with all tracks

SELECT
	t.TrackId,
	t.Composer,
	t.Name, 
	al.AlbumId,
	al.Title
FROM 
	tracks AS t
LEFT OUTER JOIN 
	albums AS al
ON 
	t.AlbumId = al.AlbumId
	
-- Display the join from above but only where composer is NULL

SELECT
	t.TrackId,
	t.Composer,
	t.Name, 
	al.AlbumId,
	al.Title
FROM 
	tracks AS t
LEFT OUTER JOIN 
	albums AS al
ON 
	t.AlbumId = al.AlbumId
WHERE 
	t.Composer IS NULL
	
-- Create an inner join between albums and tracks and display album names and track names 

SELECT 
	t.Name,
	t.Composer,
	a.Title,
	g.Name AS [Genre]
FROM 
	tracks AS t
INNER JOIN 
	albums AS a
ON 
	t.AlbumId = a.AlbumId
INNER JOIN 
	genres AS g
ON 
	g.GenreId = t.GenreId
	
	
-- See which genres have no tracks
SELECT 
	g.GenreId,
	t.Name,
	t.Composer,
	g.Name AS [Genre]
FROM 
	genres AS g
LEFT OUTER JOIN 
	tracks AS t
ON 
	t.GenreId = g.GenreId
ORDER BY 
	g.GenreId

	