-- Denna fil innehåller ett exempel på hur man kan radera data från min databas

USE hrsystemdb -- Specificera att jag vill köra queryn mot min databas

SELECT * FROM Expenses

-- Delete expense report with ExpenseID 4 that was wrongly added 
DELETE FROM Expenses
WHERE ExpenseID=4;

