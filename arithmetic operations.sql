/*
Select total from the invoices table and perform arithmetic operations on the colums
*/

SELECT
	TOTAL AS [Original Amount],
	TOTAL + 10 AS [Addition Operator],
	TOTAL - 10 AS [Subtraction Operator],
	TOTAL / 10 AS [Division Operator],
	TOTAL * 10 AS [Multiplication Operator],
	TOTAL % 10 AS [Modulo Operator],
	TOTAL * 1.15 AS [Total plus Tax]
FROM 
	invoices
ORDER BY 
	TOTAL DESC;
	