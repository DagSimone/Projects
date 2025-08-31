-- Denna fil innehåller queries för att modifiera existerande data i databasen

USE hrsystemdb -- Specificera att jag vill köra queryn mot min databas

SELECT * FROM Departments;

-- Deparment HomeAppliances changed name to HomeAppliances&Tools
UPDATE Departments
SET Departmentname = 'HomeAppliances&Tools'
WHERE DepartmentID = 5;

SELECT * FROM Departments;


