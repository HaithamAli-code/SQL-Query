-- create table 
CREATE TABLE Person
(
    id INT NOT NULL,
    FirstName NVARCHAR(10) NOT NULL,
    LastName NVARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PRIMARY KEY (id)
);
-- drop table 
drop table Person;

-- add new column
ALTER TABLE Person
ADD phoneNumber NVARCHAR(10) NULL;

-- drop column
ALTER TABLE Person
DROP COLUMN phoneNumber;

-- alter column
ALTER TABLE Person
ALTER COLUMN phoneNumber NVARCHAR(11) NOT NULL;

-- rename column
EXEC sp_rename 'Person.phone', 'phoneNumber', 'COLUMN';
-- rename table
EXEC sp_rename 'Person', 'Persons';