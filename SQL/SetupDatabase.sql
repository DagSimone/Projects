-- Denna fil innehåller queries för att skapa min databas och alla tabeller

-- Create the database
CREATE DATABASE hrsystemdb
GO

-- Create table for employees 
CREATE TABLE hrsystemdb.dbo.Employees (
    EmployeeID int NOT NULL,
    LastName varchar(50),
    FirstName varchar(50),
    BirthDate date NOT NULL,
    HireDate date NOT NULL,
	Salary int NOT NULL,
	SystemUserName char(3)
	PRIMARY KEY (EmployeeID)
);

-- Create tabel for expenses
CREATE TABLE hrsystemdb.dbo.Expenses (
    ExpenseID int NOT NULL,
    ExpenseDate date NOT NULL,
    CreatedDate date NOT NULL,
	Amount int NOT NULL,
	EmployeeID int NOT NULL,
	PRIMARY KEY (ExpenseID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create tabel for emergency contact
CREATE TABLE hrsystemdb.dbo.Emergencycontacts (
    ContactID int NOT NULL,
    FirstName varchar(50),
    LastName varchar(50),
    PhoneNumber varchar(50),
	RelationToEmp varchar(50),
	EmployeeID int NOT NULL
	PRIMARY KEY (ContactID)
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
	);

	-- Create tabel for departments 
CREATE TABLE hrsystemdb.dbo.Departments (
    DepartmentID int NOT NULL,
    Departmentname varchar(50),
	Country varchar(50),
   PRIMARY KEY (DepartmentID)
   );

   
	-- Create tabel for employee deparments 
CREATE TABLE hrsystemdb.dbo.Employee_Departments (
    DepartmentID int NOT NULL,
    EmployeeID int NOT NULL,
	FromDate date NOT NULL,
	EmployeeRole varchar(50),
	WorkingHoursPercentage int NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  );