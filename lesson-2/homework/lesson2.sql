--Easy
/*1. Create a table `Employees` with columns: `EmpID` INT, `Name` (VARCHAR(50)), and `Salary` (DECIMAL(10,2))*/
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
-- 2. Insert three records into the `Employees` table using different INSERT INTO approaches (single-row insert and multiple-row insert). 

INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Alice Johnson', 55000.00);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (2, 'Bob Smith', 62000.50);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (3, 'Charlie Brown', 47000.75);

truncate table Employees

INSERT INTO Employees (EmpID, Name, Salary) VALUES
	(1, 'Alice Johnson', 55000.00),
	(2, 'Bob Smith', 62000.50),
	(3, 'Charlie Brown', 47000.75);

--3. Update the `Salary` of an employee where `EmpID = 1`.
UPDATE Employees
SET Salary = 60000.00
WHERE EmpID = 1;

--4. Delete a record from the `Employees` table where `EmpID = 2`
DELETE FROM Employees
WHERE EmpID = 2;

--5. Demonstrate the difference between `DELETE`, `TRUNCATE`, and `DROP` commands on a test table.
CREATE TABLE TestTable (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO TestTable (ID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

DELETE FROM TestTable WHERE ID = 2;

TRUNCATE TABLE TestTable;

DROP TABLE TestTable;

--6. Modify the `Name` column in the `Employees` table to `VARCHAR(100)
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

--7. Add a new column `Department` (`VARCHAR(50)`) to the `Employees` table.  
ALTER TABLE Employees
ADD Department VARCHAR(50);

--8. Change the data type of the `Salary` column to `FLOAT`
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

--9. Create another table `Departments` with columns `DepartmentID` (INT, PRIMARY KEY) and `DepartmentName` (VARCHAR(50)). 
create table Departments (
	DepartmentId INT Primary key, 
	Departmentname varchar(50)
); 
--10. Remove all records from the `Employees` table without deleting its structure. 
truncate table Departments

--### **Intermediate-Level Tasks (6)**  
--11. Insert five records into the `Departments` table using `INSERT INTO SELECT` from an existing table. 
INSERT INTO Departments (DeptID, DeptName, Location)
SELECT DeptID, DeptName, Location
FROM ExistingDepartments
WHERE DeptID <= 5;

--12. Update the `Department` of all employees where `Salary > 5000` to 'Management'
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

--13. Write a query that removes all employees but keeps the table structure intact. 
truncate table Employees

--14. Drop the `Department` column from the `Employees` table.   
drop table Employees

--15. Rename the `Employees` table to `StaffMembers` using SQL commands. 
EXEC sp_rename 'Employees', 'StaffMembers';

--16. Write a query to completely remove the `Departments` table from the database. 
drop table Departments
