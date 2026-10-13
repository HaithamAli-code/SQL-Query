-- Auto Primary Key
CREATE TABLE Persons
(
    Personid INT IDENTITY(1,1) PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT
);