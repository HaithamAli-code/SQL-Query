-- primary key inside create table
CREATE TABLE Persons
(
    ID INT NOT NULL -- Primary Key,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT,
    -- Primary Key (ID)
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