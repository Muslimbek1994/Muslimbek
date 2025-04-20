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
--Advanced-Level Tasks (9)
--17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

--18. Add a CHECK constraint to ensure Price is always greater than 0.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    StockQuantity INT
);
select * from Products
--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--20.Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';
--21. Insert 5 records into the Products table using standard INSERT INTO queries.
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES 
(1, 'Laptop', 'Electronics', 899.99, 30);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES 
(2, 'Smartphone', 'Electronics', 699.99, 50);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES 
(3, 'Desk Chair', 'Furniture', 129.99, 20);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES 
(4, 'Coffee Maker', 'Appliances', 59.99, 40);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES 
(5, 'Running Shoes', 'Sportswear', 79.99, 60);

--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
SELECT * INTO Products_Backup
FROM Products;

--23. Rename the Products table to Inventory.
EXEC sp_rename 'Products', 'Inventory';

--24.Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--25.Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5.
alter table Products add ProductCode decimal(10,5);
