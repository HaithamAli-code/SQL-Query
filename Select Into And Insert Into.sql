-- create a new table and copy data
SELECT *
INTO Person2
FROM Person;

-- copy data into an existing table
INSERT INTO Person2
SELECT *
FROM Persons;
