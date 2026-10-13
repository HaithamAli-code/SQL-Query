-- Top 3 Distinct Salaries
SELECT DISTINCT TOP 3 MonthlySalary
FROM Employees
ORDER BY MonthlySalary DESC;

-- Employees With Top 3 Distinct Salaries
SELECT * FROM Employees
WHERE MonthlySalary IN
(
    SELECT DISTINCT TOP 3 MonthlySalary
    FROM Employees
    ORDER BY MonthlySalary DESC
)
ORDER BY MonthlySalary DESC;