-- Insert an artist into the artist TABLE

INSERT INTO 
artists (Name)
VALUES ('Bob Marley')

-- Write a select statement to find this new value 

SELECT 
	*
FROM 
	artists
WHERE 
	Name = 'Bob Marley'
	
-- Insert a new record into the employees table 

INSERT INTO 
employees
VALUES ('9', 'Martin', 'Ricky', 'Sales Support Agent', '2', 
'1975-02-07', '2018-01-05', '123 Houston St', 'New York', 
'NY', 'United States', '11201', '(347) 525-8588', '', 'rmartin@gmail.com')

-- Update Ricky Martin's postal code

UPDATE 
	employees
SET PostalCode = '11202'
WHERE 
	EmployeeId = 9
	
-- Delete Ricky Martin from the employees table 

SELECT * FROM 
	employees 
WHERE
	EmployeeId = 9;
	
DELETE FROM 
	employees
WHERE 
	EmployeeId = 9