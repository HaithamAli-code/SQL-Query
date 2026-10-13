-- Names Starting With A
SELECT *
FROM Employees
WHERE FirstName LIKE 'a%';

-- Names Containing A
SELECT *
FROM Employees
WHERE FirstName LIKE '%a%';

-- Third Character Is A
SELECT *
FROM Employees
WHERE FirstName LIKE '__a%';

-- Names Containing Tell
SELECT *
FROM Employees
WHERE FirstName LIKE '%tell%';

-- Exact Pattern
SELECT *
FROM Employees
WHERE FirstName LIKE 'Mohamm[ea]d';

-- NOT LIKE
SELECT *
FROM Employees
WHERE FirstName NOT LIKE 'Mohamm[ea]d';

-- Names Starting With A, B, Or C
SELECT *
FROM Employees
WHERE FirstName LIKE '[abc]%';

-- Names Starting From A To C
SELECT *
FROM Employees
WHERE FirstName LIKE '[a-c]%';