-- AGGREGATE FUNCTIONS

-- Count
SELECT TotalCount = COUNT(MonthlySalary)
FROM Employees;

-- Sum
SELECT TotalSum = SUM(MonthlySalary)
FROM Employees;

-- Average
SELECT Average = AVG(MonthlySalary)
FROM Employees;

-- Minimum
SELECT MinSalary = MIN(MonthlySalary)
FROM Employees;

-- Maximum
SELECT MaxSalary = MAX(MonthlySalary)
FROM Employees;

-- Aggregate Functions With WHERE
SELECT
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees
WHERE DepartmentID = 1;

-- Count IDs
SELECT CountId = COUNT(ID)
FROM Employees;