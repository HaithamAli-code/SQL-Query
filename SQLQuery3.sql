-- ============================================
-- 1. database
-- ============================================

-- create database
CREATE DATABASE MyD;

-- drop database
-- DROP DATABASE MyD;

-- use database
USE MyD;

-- check if database exists
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'koko')
BEGIN
    PRINT 'database does not exist';
END;


-- ============================================
-- 2. create table
-- ============================================

CREATE TABLE Person
(
    id INT NOT NULL,
    FirstName NVARCHAR(10) NOT NULL,
    LastName NVARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,

    PRIMARY KEY (id)
);


-- ============================================
-- 3. alter table
-- ============================================

-- add new column
ALTER TABLE Person
ADD phoneNumber NVARCHAR(10) NULL;

-- drop column
ALTER TABLE Person
DROP COLUMN phoneNumber;

-- alter column
ALTER TABLE Person
ADD phone NVARCHAR(10) NULL;

ALTER TABLE Person
ALTER COLUMN phone NVARCHAR(11) NOT NULL;

-- rename column
EXEC sp_rename 'Person.phone', 'phoneNumber', 'COLUMN';

-- rename table
EXEC sp_rename 'Person', 'Persons';

-- drop table
-- DROP TABLE Person;


-- ============================================
-- 4. insert into
-- ============================================

-- insert data
INSERT INTO Person
VALUES
(1, 'haitham', 'ali', '1999-01-01'),
(2, 'haitham', 'ali', '1999-01-01'),
(3, 'haitham', 'ali', '1999-01-01');

-- insert into specific columns
INSERT INTO Person (id, FirstName, LastName, DateOfBirth)
VALUES (4, 'bara', 'ali', '2000-01-01');


-- ============================================
-- 5. update
-- ============================================

UPDATE Person
SET FirstName = 'bara'
WHERE id = 3;


-- ============================================
-- 6. delete
-- ============================================

DELETE FROM Person
WHERE id = 2;


-- ============================================
-- 7. select into
-- ============================================

-- create a new table and copy data
SELECT *
INTO EmployeesCopy
FROM Employees;


-- ============================================
-- 8. insert into select
-- ============================================

-- copy data into an existing table
INSERT INTO OldPersons
SELECT *
FROM Persons;


-- ============================================
-- 9. identity
-- ============================================

CREATE TABLE Persons
(
    Personid INT IDENTITY(1,1) PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT
);


-- ============================================
-- 10. truncate table
-- ============================================

TRUNCATE TABLE Person;


-- ============================================
-- 11. primary key
-- ============================================

-- primary key inside create table
CREATE TABLE Persons
(
    ID INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT,

    CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);


-- add primary key
ALTER TABLE Persons
ADD PRIMARY KEY (ID);


-- add named primary key
ALTER TABLE Persons
ADD CONSTRAINT PK_Person
PRIMARY KEY (ID, LastName);


-- drop primary key
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;


-- ============================================
-- 12. foreign key
-- ============================================

-- foreign key inside create table
CREATE TABLE Orders
(
    OrderID INT NOT NULL PRIMARY KEY,
    OrderNumber INT NOT NULL,
    PersonID INT FOREIGN KEY REFERENCES Persons(PersonID)
);


-- foreign key with constraint name
CREATE TABLE Orders
(
    OrderID INT NOT NULL,
    OrderNumber INT NOT NULL,
    PersonID INT,

    PRIMARY KEY (OrderID),

    CONSTRAINT FK_PersonOrder
    FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);


-- add foreign key
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID)
REFERENCES Persons(PersonID);


-- drop foreign key
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;


-- ============================================
-- 13. select
-- ============================================

-- select all columns
SELECT *
FROM Employees;

-- select all columns using table name
SELECT Employees.*
FROM Employees;

-- select specific columns
SELECT FirstName, LastName, DateOfBirth
FROM Employees;

-- select from countries
SELECT *
FROM Countries;

-- select from departments
SELECT *
FROM Departments;


-- ============================================
-- 14. distinct
-- ============================================

-- select unique department ids
SELECT DISTINCT DepartmentID
FROM Employees;


-- ============================================
-- 15. where
-- ============================================

-- equal
SELECT *
FROM Employees
WHERE Gendor = 'F';

-- not
SELECT *
FROM Employees
WHERE NOT MonthlySalary < 300
  AND Gendor = 'F';

-- or
SELECT *
FROM Employees
WHERE CountryID = 1
   OR CountryID = 2;

-- in
SELECT *
FROM Employees
WHERE DepartmentID IN (1);

SELECT *
FROM Employees
WHERE FirstName IN ('Jacob');

-- subquery
SELECT *
FROM Departments
WHERE ID IN
(
    SELECT DISTINCT DepartmentID
    FROM Employees
    WHERE MonthlySalary <= 500
);

-- between
SELECT *
FROM Employees
WHERE MonthlySalary BETWEEN 900 AND 1000;


-- ============================================
-- 16. order by
-- ============================================

SELECT FirstName, LastName, MonthlySalary
FROM Employees
WHERE DepartmentID = 1
ORDER BY MonthlySalary DESC;


-- ============================================
-- 17. top
-- ============================================

-- top 3 distinct salaries
SELECT DISTINCT TOP 3 MonthlySalary
FROM Employees
ORDER BY MonthlySalary DESC;

-- employees with top 3 distinct salaries
SELECT *
FROM Employees
WHERE MonthlySalary IN
(
    SELECT DISTINCT TOP 3 MonthlySalary
    FROM Employees
    ORDER BY MonthlySalary DESC
)
ORDER BY MonthlySalary DESC;


-- ============================================
-- 18. calculations and aliases
-- ============================================

SELECT
    YearSalary = MonthlySalary * 12,
    FullName = FirstName + ' ' + LastName,
    AgeInDays = DATEDIFF(DAY, DateOfBirth, GETDATE())
FROM Employees;


-- ============================================
-- 19. aggregate functions
-- ============================================

-- count, sum, avg, min, max
SELECT
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees;

-- aggregate functions with where
SELECT
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees
WHERE DepartmentID = 1;

-- count ids
SELECT CountId = COUNT(ID)
FROM Employees;


-- ============================================
-- 20. group by and having
-- ============================================

SELECT
    DepartmentID,
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees
-- WHERE MonthlySalary > 1000
GROUP BY DepartmentID
HAVING COUNT(MonthlySalary) >= 120
ORDER BY DepartmentID;


-- ============================================
-- 21. like
-- ============================================

-- names starting with a
SELECT *
FROM Employees
WHERE FirstName LIKE 'a%';

-- contains a
-- WHERE FirstName LIKE '%a%';

-- third character is a
-- WHERE FirstName LIKE '__a%';

-- contains tell
-- WHERE FirstName LIKE '%tell%';

-- exact pattern
SELECT *
FROM Employees
WHERE FirstName LIKE 'Mohamm[ea]d';

-- not like
SELECT *
FROM Employees
WHERE FirstName NOT LIKE 'Mohamm[ea]d';

-- names starting with a, b, or c
SELECT *
FROM Employees
WHERE FirstName LIKE '[abc]%';

-- names starting from a to c
SELECT *
FROM Employees
WHERE FirstName LIKE '[a-c]%';


-- ============================================
-- 22. inner join
-- ============================================

SELECT Customers.customer_id,
       Customers.first_name,
       Orders.amount
FROM Customers
INNER JOIN Orders
    ON Customers.customer_id = Orders.customer;


-- ============================================
-- 23. left join
-- ============================================

SELECT Customers.customer_id,
       Customers.first_name,
       Orders.amount
FROM Customers
LEFT JOIN Orders
    ON Customers.customer_id = Orders.customer;


-- ============================================
-- 24. view
-- ============================================

CREATE VIEW view_name AS
SELECT *
FROM Departments;


-- ============================================
-- 25. union
-- ============================================

SELECT *
FROM Departments

UNION

SELECT *
FROM Departments;


-- ============================================
-- 26. case
-- ============================================

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;