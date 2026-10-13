-- CALCULATIONS AND ALIASES

-- Year Salary
SELECT YearSalary = MonthlySalary * 12
FROM Employees;

-- Full Name
SELECT FullName = FirstName + ' ' + LastName
FROM Employees;

-- Age In Days
SELECT AgeInDays = DATEDIFF(DAY, DateOfBirth, GETDATE())
FROM Employees;