-- Denna fil inneh�ller ett exempel p� hur man kan radera data fr�n min databas

USE hrsystemdb -- Specificera att jag vill k�ra queryn mot min databas

SELECT * FROM Expenses

-- Delete expense report with ExpenseID 4 that was wrongly added 
DELETE FROM Expenses
WHERE ExpenseID=4;

