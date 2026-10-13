-- foreign key inside create table
CREATE TABLE Orders
(
    OrderID INT NOT NULL PRIMARY KEY,
    OrderNumber INT NOT NULL,

    PersonID INT FOREIGN KEY REFERENCES Persons(PersonID)
);

-- foreign key with constraint name
CREATE TABLE Orders
(
    OrderID INT NOT NULL,
    OrderNumber INT NOT NULL,
    PersonID INT,
    PRIMARY KEY (OrderID),

    CONSTRAINT FK_PersonOrder
    FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

-- add foreign key
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID)
REFERENCES Persons(PersonID);

-- drop foreign key
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;