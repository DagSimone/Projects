-- Denna fil inneh�ller queries f�r att modifiera existerande data i databasen

USE hrsystemdb -- Specificera att jag vill k�ra queryn mot min databas

SELECT * FROM Departments;

-- Deparment HomeAppliances changed name to HomeAppliances&Tools
UPDATE Departments
SET Departmentname = 'HomeAppliances&Tools'
WHERE DepartmentID = 5;

SELECT * FROM Departments;


