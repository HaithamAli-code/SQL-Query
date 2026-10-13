-- Default Constraint 
CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   City varchar(255) DEFAULT 'Amman'
);

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Amman' FOR City;

ALTER TABLE Persons
DROP Constraint  df_City;