-- insert data
INSERT INTO Person
VALUES
(1, 'koko', 'koko', '1999-01-01'),
(2, 'koko', 'koko', '1999-01-01'),
(3, 'koko', 'koko', '1999-01-01');

-- insert into specific columns
INSERT INTO Person (id, FirstName, LastName, DateOfBirth)
VALUES 
(4, 'koko', 'koko', '2000-01-01');