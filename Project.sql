--Use Database
USE BookstoreDB
GO

DROP TABLE Authors

--Create Authors Table
CREATE TABLE Authors
(AuthorID INT PRIMARY KEY  IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Birthdate DATE);

DROP TABLE Books

--Create Books Table
CREATE TABLE Books
(BookID INT PRIMARY KEY IDENTITY(1,1),
Title VARCHAR(100) NOT NULL,
Genre VARCHAR(50) NOT NULL,
PublishedYear INT,
Price DECIMAL(10,2));

--Add ISBN Column
ALTER TABLE Books
ADD ISBN VARCHAR(20);

--Modify Genre Column
ALTER TABLE Books
ALTER COLUMN Genre VARCHAR(75);

DROP TABLE Customers

--Create Customers Table
CREATE TABLE Customers 
(CustomerID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE);

--Temporary Table (Truncate & Drop)
CREATE TABLE TemporaryInfo
(TempData VARCHAR(100));

INSERT INTO TemporaryInfo VALUES ('Test1'), ('Test2'), ('Test3');

TRUNCATE TABLE TemporaryInfo;

DROP TABLE TemporaryInfo;

-- Insert into Authors
INSERT INTO Authors (FirstName, LastName, Birthdate)
VALUES 
('Chinua', 'Achebe', '1930-11-16'),
('Wole', 'Soyinka', '1934-07-13'),
('Chimamanda', 'Adichie', '1977-09-15');

-- Insert into Books
INSERT INTO Books (Title, Genre, PublishedYear, Price)
VALUES
('Things Fall Apart', 'Fiction', 1958, 5000.00),
('No Longer at Ease', 'Fiction', 1960, 4500.00),
('The Lion and the Jewel', 'Drama', 1963, 4000.00),
('Half of a Yellow Sun', 'Historical Fiction', 2006, 6000.00),
('Americanah', 'Romance', 2013, 5500.00);

-- Update Book Price
UPDATE Books
SET Price = 6500.00
WHERE Title = 'Americanah';

ALTER TABLE Books
ADD ISBN VARCHAR(20);

--Update ISBN
UPDATE Books
SET ISBN = 'ISBN-' + CAST(BookID AS VARCHAR)
WHERE ISBN IS NULL;

SELECT BookID, ISBN FROM Books;

--Delete a Book
DELETE FROM Books
WHERE Title = 'The Lion and the jewel';

-- Select All Authors
SELECT * FROM Authors;

-- Select All Books
SELECT * FROM Books;

-- Select Specific Columns
SELECT Title, Price FROM Books;

-- Books Published After 2000
SELECT * FROM Books
WHERE PublishedYear > 2000;

-- Authors with Last Name Starting with 'S'
SELECT * FROM Authors
WHERE LastName LIKE 'S%';

-- Add AuthorID to Books
ALTER TABLE Books
ADD AuthorID INT

-- Create Foreign Key
ALTER TABLE Books
ADD CONSTRAINT FK_Books_Authors
FOREIGN KEY (AuthorID)
REFERENCES Authors(AuthorID);


-- Update Books with AuthorID
UPDATE Books SET AuthorID = 1 WHERE Title = 'Things Fall Apart';
UPDATE Books SET AuthorID = 1 WHERE Title = 'No Longer at Ease';
UPDATE Books SET AuthorID = 2 WHERE Title = 'The Lion and the Jewel';
UPDATE Books SET AuthorID = 3 WHERE Title = 'Half of a Yellow Sun';
UPDATE Books SET AuthorID = 3 WHERE Title = 'Americanah';

-- Join Tables
SELECT 
    B.Title,
    B.PublishedYear,
    A.FirstName,
    A.LastName
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;