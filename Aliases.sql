/* 
Created by: Harris Wohl
Created on: 4/15/2021
Description: This query selects first name, last name, email, 
and phone number fields from the customer table and demonstrates 
four ways to create an alias. 
*/

SELECT 
	FirstName AS 'First Name',
	LastName AS [Last Name],
	Email AS Email,
	Phone CELL
FROM
	customers;