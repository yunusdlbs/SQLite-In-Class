--Single Row Subqueries
--1)
SELECT TrackId,Name,Milliseconds
FROM tracks
WHERE Milliseconds=(SELECT MAX(Milliseconds) FROM tracks);

--2)
SELECT TrackId,Name,Milliseconds
FROM tracks
WHERE Milliseconds=(SELECT MIN(Milliseconds) FROM tracks);

--3)
SELECT TrackId,Name,Bytes,ROUND((SELECT AVG(Bytes) FROM tracks),2) AS Avarage_Byte
FROM tracks
WHERE Bytes > (SELECT AVG(Bytes) FROM tracks)
ORDER BY Bytes DESC;

---Multiple-Row Subqueries
--1)
SELECT CustomerId,FirstName,LastName
FROM customers
WHERE SupportRepId IN (SELECT EmployeeId FROM employees WHERE LastName IN ('Peacock','Park'));

--2)
SELECT c.CustomerId,c.FirstName,c.LastName,c.SupportRepId
FROM customers c
JOIN employees e ON c.SupportRepId=e.EmployeeId
WHERE e.LastName IN ('Peacock','Park');

--DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements
--1)
CREATE TABLE courses (CourseId INT PRIMARY KEY,
            CourseName VARCHAR(20) NOT NULL,
            EmployeeId INT,
            CoursePrice REAL,
            FOREIGN KEY (EmployeeId) REFERENCES employees (EmployeeId)
);

--2)
INSERT INTO courses
VALUES (1,'English',3,750),(2,'Russian',3,650),
       (3,'German',3,690),(4,'Spanish',3,700),
       (5,'French',3,850);

--3)
DELETE FROM courses
WHERE CourseId=5;
SELECT *
FROM courses;

--4)
ALTER TABLE courses
ADD StartDate DATE NOT NULL DEFAULT 'Enter Date';

--5)
ALTER TABLE courses
DROP  COLUMN CoursePrice;

--6)
DELETE FROM courses;