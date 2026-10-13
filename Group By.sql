-- Group By Department
SELECT
    DepartmentID,
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(MonthlySalary) >= 120
ORDER BY DepartmentID;

-- Group By With WHERE
SELECT
    DepartmentID,
    TotalCount = COUNT(MonthlySalary),
    TotalSum = SUM(MonthlySalary),
    Average = AVG(MonthlySalary),
    MinSalary = MIN(MonthlySalary),
    MaxSalary = MAX(MonthlySalary)
FROM Employees
WHERE MonthlySalary > 1000
GROUP BY DepartmentID
HAVING COUNT(MonthlySalary) >= 120
ORDER BY DepartmentID;