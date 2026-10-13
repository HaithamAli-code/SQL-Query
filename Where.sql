-- Where

-- Equal
SELECT *
FROM Employees
WHERE Gendor = 'F';

-- Not
SELECT *
FROM Employees
WHERE NOT MonthlySalary < 300
  AND Gendor = 'F';

-- OR
SELECT *
FROM Employees
WHERE CountryID = 1
   OR CountryID = 2;

-- IN
SELECT *
FROM Employees
WHERE DepartmentID IN (1);

-- IN With FirstName
SELECT *
FROM Employees
WHERE FirstName IN ('Jacob');

-- Subquery
SELECT *
FROM Departments
WHERE ID IN
(
    SELECT DISTINCT DepartmentID
    FROM Employees
    WHERE MonthlySalary <= 500
);

-- BETWEEN
SELECT *
FROM Employees
WHERE MonthlySalary BETWEEN 900 AND 1000;