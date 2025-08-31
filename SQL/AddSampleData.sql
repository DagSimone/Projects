-- Denna fil innehåller queries för att lägga till exempel-data i mina databastabeller
USE hrsystemdb -- Specificera att jag vill köra queryn mot min databas

-- Set variables for employees
DECLARE @EmployeeID AS int = 1
DECLARE @LastName AS varchar(100) = 'Doe'
DECLARE @FirstName AS varchar(100) = 'John'
DECLARE @BirthDate AS date = '1980-01-01'
DECLARE @HireDate AS date = '2020-05-14'
DECLARE @Salary AS int = 44091
DECLARE @SystemUserName as char(3) = 'Doj'

-- Insert employee 1
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Insert employee 2
SET @EmployeeID = 2
SET @LastName = 'Johnson'
SET @FirstName = 'Joseph'
SET @BirthDate = '1994-04-01'
SET @HireDate = '2021-05-19'
SET @Salary = 23000
SET @SystemUserName = 'Jos'

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Insert employee 3
SET @EmployeeID = 3
SET @LastName = 'Anderson'
SET @FirstName = 'Maria'
SET @BirthDate = '1991-07-10'
SET @HireDate = '2022-01-23'
SET @Salary = 45000
SET @SystemUserName = 'Anm'

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Insert employee 4
SET @EmployeeID = 4
SET @LastName = 'Svensson'
SET @FirstName = 'Sara'
SET @BirthDate = '1999-10-15'
SET @HireDate = '2020-03-20'
SET @Salary = 26400
SET @SystemUserName = 'Svs'

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Insert employee 5
SET @EmployeeID = 5
SET @LastName = 'Petterson'
SET @FirstName = 'Carl'
SET @BirthDate = '1977-12-01'
SET @HireDate = '2005-09-05'
SET @Salary = 47500
SET @SystemUserName = 'Pec'

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Insert employee 6
SET @EmployeeID = 6
SET @LastName = 'Moraeus'
SET @FirstName = 'Daniel'
SET @BirthDate = '1991-08-23'
SET @HireDate = '2017-08-16'
SET @Salary = 29500
SET @SystemUserName = 'Dnm'

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, HireDate, Salary, SystemUserName)
VALUES (@EmployeeID, @LastName, @FirstName, @BirthDate, @HireDate, @Salary, @SystemUserName);

-- Set variables for expenses
DECLARE @ExpenseID AS int = 1
DECLARE @Amount AS float = 255.50
DECLARE @ExpenseDate AS date = '2022-01-01'
DECLARE @CreatedDate AS date = '2022-01-14'
DECLARE @EmployeeIDExpenseFK AS int = 1 

INSERT INTO Expenses (ExpenseID, ExpenseDate, CreatedDate, Amount, EmployeeID)
VALUES (@ExpenseID, @ExpenseDate, @CreatedDate, @Amount, @EmployeeIDExpenseFK);

-- INSERT Expenses 2
SET @ExpenseID = 2
SET @ExpenseDate = '2022-02-05'
SET @CreatedDate = '2022-02-12'
SET @Amount = 1250
SET @EmployeeIDExpenseFK = 2

INSERT INTO Expenses (ExpenseID, ExpenseDate, CreatedDate, Amount, EmployeeID)
VALUES (@ExpenseID, @ExpenseDate, @CreatedDate, @Amount, @EmployeeIDExpenseFK);

-- INSERT Expenses 3
SET @ExpenseID = 3
SET @ExpenseDate = '2022-05-15'
SET @CreatedDate = '2022-06-25'
SET @Amount = 3055.50
SET @EmployeeIDExpenseFK = 1

INSERT INTO Expenses (ExpenseID, ExpenseDate, CreatedDate, Amount, EmployeeID)
VALUES (@ExpenseID, @ExpenseDate, @CreatedDate, @Amount, @EmployeeIDExpenseFK);

-- INSERT Expenses 4
SET @ExpenseID = 4
SET @ExpenseDate = '2022-07-10'
SET @CreatedDate = '2022-07-18'
SET @Amount = 150
SET @EmployeeIDExpenseFK = 2

INSERT INTO Expenses (ExpenseID, ExpenseDate, CreatedDate, Amount, EmployeeID)
VALUES (@ExpenseID, @ExpenseDate, @CreatedDate, @Amount, @EmployeeIDExpenseFK);

-- INSERT Expenses 5
SET @ExpenseID = 5
SET @ExpenseDate = '2022-03-03'
SET @CreatedDate = '2022-03-28'
SET @Amount = 2500
SET @EmployeeIDExpenseFK = 5

INSERT INTO Expenses (ExpenseID, ExpenseDate, CreatedDate, Amount, EmployeeID)
VALUES (@ExpenseID, @ExpenseDate, @CreatedDate, @Amount, @EmployeeIDExpenseFK);

-- Set variables for deparments 
DECLARE @DeparmentID AS int = 1
DECLARE @DepartmentName AS varchar(50) = 'IT'
DECLARE @Country AS varchar(50) = 'Germany'

INSERT INTO Departments (DepartmentID, Departmentname, Country)
VALUES (@DeparmentID, @DepartmentName, @Country);

SET @DeparmentID = 2
SET @DepartmentName = 'HR'
SET @Country = 'Sweden'

INSERT INTO Departments (DepartmentID, Departmentname, Country)
VALUES (@DeparmentID, @DepartmentName, @Country);

SET @DeparmentID = 3
SET @DepartmentName = 'Finance'
SET @Country = 'France'

INSERT INTO Departments (DepartmentID, Departmentname, Country)
VALUES (@DeparmentID, @DepartmentName, @Country);

SET @DeparmentID = 4
SET @DepartmentName = 'Certification'
SET @Country = 'Sweden'

INSERT INTO Departments (DepartmentID, Departmentname, Country)
VALUES (@DeparmentID, @DepartmentName, @Country);

SET @DeparmentID = 5
SET @DepartmentName = 'HomeAppliances'
SET @Country = 'Sweden'

INSERT INTO Departments (DepartmentID, Departmentname, Country)
VALUES (@DeparmentID, @DepartmentName, @Country);

-- SET variables for department_employees
DECLARE @DeparmentIDFK AS int = 1
DECLARE @EmployeeIDFK AS int = 1
DECLARE @FromDate AS date = '2020-05-14'
DECLARE @EmployeeRole AS varchar(50)= 'Developer'
DECLARE @WorkingHoursPercentage AS int=100

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

SET @DeparmentIDFK = 2
SET @EmployeeIDFK = 2
SET @FromDate  = '2021-05-19'
SET @EmployeeRole = 'HRassistant'
SET @WorkingHoursPercentage =75

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

SET @DeparmentIDFK = 3
SET @EmployeeIDFK = 2
SET @FromDate = '2022-05-19'
SET @EmployeeRole = 'CertificationOfficer'
SET @WorkingHoursPercentage =25

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

SET @DeparmentIDFK = 4
SET @EmployeeIDFK = 3
SET @FromDate = '2022-01-23'
SET @EmployeeRole = 'CertificationManager'
SET @WorkingHoursPercentage = 75

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

SET @DeparmentIDFK = 4
SET @EmployeeIDFK = 4
SET @FromDate = '2020-03-20'
SET @EmployeeRole = 'FinanceAssistant'
SET @WorkingHoursPercentage = 100

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

SET @DeparmentIDFK = 5
SET @EmployeeIDFK = 5
SET @FromDate = '2005-09-05'
SET @EmployeeRole = 'Engineer'
SET @WorkingHoursPercentage = 100

INSERT INTO Employee_Departments(DepartmentID, EmployeeID, FromDate, EmployeeRole, WorkingHoursPercentage)
VALUES (@DeparmentIDFK, @EmployeeIDFK, @FromDate, @EmployeeRole, @WorkingHoursPercentage);

-- Insert data into emergency contact 
DECLARE @ContactID AS int = 1
DECLARE @EmergencyFirstname AS varchar(50) = 'Anna'
DECLARE @EmergencyLastname AS varchar(50) = 'Doe'
DECLARE @PhoneNumber as varchar(50) = '077851358'
DECLARE @RelationToEmp as varchar(50) = 'Wife'
DECLARE @EmployeeIDEM as int = 1

INSERT INTO Emergencycontacts(ContactID, FirstName, LastName, PhoneNumber, RelationToEmp, EmployeeID)
VALUES (@ContactID, @FirstName, @LastName, @PhoneNumber, @RelationToEmp, @EmployeeIDEM);

SET @ContactID = 2
SET @EmergencyFirstname = 'Stefan'
SET @EmergencyLastname = 'Johnson'
SET @PhoneNumber = '076521478'
SET @RelationToEmp = 'Brother'
SET @EmployeeIDEM = 2

INSERT INTO Emergencycontacts(ContactID, FirstName, LastName, PhoneNumber, RelationToEmp, EmployeeID)
VALUES (@ContactID, @FirstName, @LastName, @PhoneNumber, @RelationToEmp, @EmployeeIDEM);

SET @ContactID = 3
SET @EmergencyFirstname = 'Daniel'
SET @EmergencyLastname = 'Anderson'
SET @PhoneNumber = '086523987'
SET @RelationToEmp = 'Husband'
SET @EmployeeIDEM = 3

INSERT INTO Emergencycontacts(ContactID, FirstName, LastName, PhoneNumber, RelationToEmp, EmployeeID)
VALUES (@ContactID, @FirstName, @LastName, @PhoneNumber, @RelationToEmp, @EmployeeIDEM);

SET @ContactID = 4
SET @EmergencyFirstname = 'David'
SET @EmergencyLastname = 'Svensson'
SET @PhoneNumber = '075865231'
SET @RelationToEmp = 'Brother'
SET @EmployeeIDEM = 4

INSERT INTO Emergencycontacts(ContactID, FirstName, LastName, PhoneNumber, RelationToEmp, EmployeeID)
VALUES (@ContactID, @FirstName, @LastName, @PhoneNumber, @RelationToEmp, @EmployeeIDEM);

SET @ContactID = 5
SET @EmergencyFirstname = 'Anna'
SET @EmergencyLastname = 'Pettersson'
SET @PhoneNumber = '08654136'
SET @RelationToEmp = 'Sister'
SET @EmployeeIDEM = 5

INSERT INTO Emergencycontacts(ContactID, FirstName, LastName, PhoneNumber, RelationToEmp, EmployeeID)
VALUES (@ContactID, @FirstName, @LastName, @PhoneNumber, @RelationToEmp, @EmployeeIDEM);

-- select top 3 empoloyees with most expenses
--SELECT * FROM (SELECT TOP 3 * FROM Expenses ORDER BY Amount DESC) AS firstThree;

-- Select all employees that has worked here from 1 year back in time 
--SELECT *
--FROM employees
--WHERE HireDate <= DATEADD(year, -1, GETDATE())

-- Select all employees with salary higher than avg (nested query) 
--SELECT *
--FROM Employees
--WHERE salary > (SELECT AVG(salary) FROM Employees)

-- Select all employees per department (group by) 
--SELECT COUNT (*) AS num_employees, Country
--FROM Departments
--GROUP BY Country

-- Select all employees and their expens report - inner join 
SELECT *
FROM Employees 
INNER JOIN Expenses
ON Employees.EmployeeID=Expenses.EmployeeID;

SELECT * FROM Departments
