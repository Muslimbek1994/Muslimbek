
1. Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT in SQL Server is a command used to quickly import large volumes of data from a file into a database table. It is particularly useful for loading massive datasets efficiently while minimizing transaction overhead.
Purpose of BULK INSERT
- High-speed Data Loading: Compared to traditional INSERT statements, BULK INSERT significantly improves performance when handling large files.
- Minimized Transaction Overhead: Reduces the number of individual transactions, making the import process faster.
- File-Based Data Import: Allows importing data directly from various file formats, such as CSV or TXT.
- Flexible Column Mapping: Supports custom data formats, delimiter settings, and field terminators.

Example Usage
Here’s a simple example of how to use BULK INSERT:
BULK INSERT dbo.MyTable
FROM 'C:\Data\file.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

2. List four file formats that can be imported into SQL Server.
SQL Server supports importing data from various file formats. Here are four commonly used ones:

1. **CSV (Comma-Separated Values)** – A widely used format where data is structured with commas separating fields.
2. **TXT (Plain Text Files)** – Can contain tab-separated or fixed-width data.
3. **XML (Extensible Markup Language)** – Useful for structured data exchange between systems.
4. **JSON (JavaScript Object Notation)** – A popular format for storing and transferring structured data, especially in web applications.

3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
Create table Products (
	ProductID INT PRIMARY KEY, 
	ProductName VARCHAR(50), 
	Price DECIMAL(10,2)
)
4. Insert three records into the Products table using INSERT INTO.

insert into Products values
	(1, 'Carrot', 5000),
	(2,'Onion', 6000),
	(3,'Potato', 4000)
Select * from Products

5. Explain the difference between NULL and NOT NULL with examples. 

In SQL Server, **NULL** and **NOT NULL** define whether a column can store missing or unknown values.

### **Difference Between NULL and NOT NULL**
- **NULL**: Represents an absence of data. It does not equal zero, an empty string, or any other value.
- **NOT NULL**: Ensures a column must always contain a value. It prevents storing NULL values.

### **Example**
#### **Creating a Table with NULL and NOT NULL Constraints**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,  -- Must have a value
    Email VARCHAR(100) NULL      -- Can be left empty
);
```
- **`Name`** column is **NOT NULL**, meaning every employee must have a name.
- **`Email`** column is **NULL**, so an employee might not have an email.

#### **Inserting Data**
```sql
INSERT INTO Employees (EmployeeID, Name, Email) VALUES (1, 'Alice', NULL);
INSERT INTO Employees (EmployeeID, Name, Email) VALUES (2, 'Bob', 'bob@example.com');
```
- Alice’s email is **NULL** because it is not provided.
- Bob’s email is **NOT NULL** since he has one.

**Checking for NULL Values**
```sql
SELECT * FROM Employees WHERE Email IS NULL;
```
This query retrieves employees **who do not have an email**.

6. Add a UNIQUE constraint to the ProductName column in the Products table.
To ensure that the `ProductName` column in the `Products` table contains only unique values (no duplicates), you can add a **UNIQUE constraint**.

### **Method 1: Adding UNIQUE Constraint During Table Creation**
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) UNIQUE,  -- Ensures unique product names
    Price DECIMAL(10,2)
);
```
- The `ProductName` column is defined with the `UNIQUE` constraint, preventing duplicate entries.

### **Method 2: Adding UNIQUE Constraint to an Existing Table**
If the `Products` table already exists, you can add the constraint using `ALTER TABLE`:
```sql
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
```
- `UQ_ProductName` is the name of the constraint (you can choose any name).
- Ensures each `ProductName` remains unique.

### **Verifying the Constraint**
Try inserting duplicate values:
```sql
INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Laptop', 999.99);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (2, 'Laptop', 899.99); -- Will fail due to UNIQUE constraint
```
7. Write a comment in a SQL query explaining its purpose.
In SQL, comments are used to provide explanations or notes within a query. This helps developers understand the purpose of specific SQL statements. There are two ways to write comments:

### **1. Single-Line Comment (`--`)**
Used for short explanations within a query.
```sql
-- Retrieve all employees who have a salary greater than $50,000
SELECT * FROM Employees WHERE Salary > 50000;
```

### **2. Multi-Line Comment (`/* */`)**
Used for detailed comments spanning multiple lines.
```sql
/*
This query selects employees whose salary is above 50,000.
Useful for filtering high-income earners in payroll reports.
*/
SELECT * FROM Employees WHERE Salary > 50000;
```
8. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
Create table Categories(
	CategoryID int PRIMARY KEY,
	CategoryName varchar(50) UNIQUE
)
9.Explain the purpose of the IDENTITY column in SQL Server.
The **IDENTITY** column in SQL Server is used to generate **auto-incrementing** values for a table’s primary key. It ensures that each row receives a unique number without requiring manual input, making it ideal for **unique identifiers** like `ID` fields.

### **Purpose of IDENTITY Column**
- **Auto-incrementing values** – Automatically generates a sequential number for each new row.
- **Ensures uniqueness** – Helps maintain primary key integrity.
- **Simplifies data insertion** – Eliminates the need for manual ID assignment.
- **Optimized for performance** – Efficiently generates IDs compared to manual numbering.

### **Example Usage**
When creating a table with an **IDENTITY** column:
```sql
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,  -- Starts at 1, increments by 1
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);
```
- **`IDENTITY(1,1)`** – The first `1` is the starting value, and the second `1` is the increment.
- SQL Server automatically assigns `ProductID` values when new rows are inserted.

### **Inserting Data**
You don’t need to specify the `ProductID` manually:
```sql
INSERT INTO Products (ProductName, Price) VALUES ('Laptop', 999.99);
INSERT INTO Products (ProductName, Price) VALUES ('Mouse', 29.99);
```
The `ProductID` column will automatically populate:
```
ProductID | ProductName | Price
--------------------------------
1         | Laptop     | 999.99
2         | Mouse      | 29.99
```

### **Retrieving the Last Inserted ID**
To get the most recent identity value:
```sql
SELECT SCOPE_IDENTITY();
```
This ensures accurate tracking of new records.



Medium-Level Tasks (10)
10. Use BULK INSERT to import data from a text file into the Products table.


create table example(
	Region varchar(50),
	Sales decimal (10,2),
	Profit decimal(10,2)
);



BULK INSERT example
FROM 'C:\Users\musli\MBI course materials\Homework\example.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
select * from example

11.Create a FOREIGN KEY in the Products table that references the Categories table.
create table Products(
	customer_id int primary key,
	customer_name varchar(50)
)

create table Categories (
	sale_id int primary key,
	product_name varchar(50),
	customer_id int foreign key references Products(customer_id) on delete cascade --uzi bog'langan tabledagi malumotlarni uchirib tashlash imkoniyatini beradi
)
--prevents invalid data entry

insert into Products values (1, 'Tim'), (2, 'John'), (3, 'Paul')
insert into Categories values (100, 'Phone', 2), (101, 'Laptop', 2), (102, 'Charger', 1)
--insert into Sales values (100, 'PC', 4) this shows incorrect

12.Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
Both **PRIMARY KEY** and **UNIQUE KEY** constraints ensure uniqueness in SQL Server, but they have key differences in functionality and usage.

### **Differences Between PRIMARY KEY and UNIQUE KEY**
| Feature            | PRIMARY KEY                              | UNIQUE KEY                               |
|--------------------|----------------------------------------|-----------------------------------------|
| **Uniqueness**    | Ensures all values are unique         | Ensures all values are unique          |
| **NULL Values**   | **Cannot** contain NULL values        | **Can** contain NULL values            |
| **Number per Table** | Only **one** PRIMARY KEY per table | Can have **multiple** UNIQUE constraints |
| **Index Type**    | Creates **clustered** index by default | Creates **non-clustered** index by default |
| **Purpose**       | Defines the main identifier of a record | Prevents duplicate values in a column |

---

### **Example: PRIMARY KEY**
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,  -- Each customer must have a unique ID
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE  -- Ensures emails are unique
);
```
- `CustomerID` uniquely identifies each record and **cannot** be NULL.
- `Email` has a **UNIQUE KEY** constraint, ensuring no duplicate emails.

---

### **Example: UNIQUE KEY**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, 
    SSN VARCHAR(11) UNIQUE,  -- Social Security Number must be unique, but can be NULL
    PhoneNumber VARCHAR(15) UNIQUE  -- Phone numbers must be unique, allowing NULL values
);
```
- `SSN` and `PhoneNumber` are **UNIQUE**, preventing duplicates but allowing NULLs.
- `EmployeeID` is the **PRIMARY KEY**, ensuring record uniqueness.

### **Key Takeaway**
- Use **PRIMARY KEY** when defining the **main identifier** of a table (one per table).
- Use **UNIQUE KEY** for enforcing uniqueness **without setting it as the main identifier** (multiple allowed).

13. Add a CHECK constraint to the Products table ensuring Price > 0.

select * from Products
ALTER TABLE Products
ADD CONSTRAINT CHK_PricePositive CHECK (Price > 0);

14. Modify the Products table to add a column Stock (INT, NOT NULL).
alter table Products add Stock int not null default 10;

15. Use the ISNULL function to replace NULL values in a column with a default value.
UPDATE Products
SET Stock = ISNULL(Stock, 0);

16. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server
A **FOREIGN KEY** constraint in SQL Server is used to **maintain referential integrity** between tables by enforcing a relationship between a column in one table and the **PRIMARY KEY** of another table.

### **Purpose of FOREIGN KEY**
- **Ensures Data Integrity** – Prevents invalid data entries by restricting values to those that exist in the referenced table.
- **Creates Relationships Between Tables** – Establishes links between related tables for structured data storage.
- **Prevents Deletion of Referenced Records** – Restricts deleting parent records if dependent child records exist.
- **Supports Cascading Actions** – Can enable automatic updates or deletions via `ON DELETE` and `ON UPDATE` options.

### **Example Usage**
#### **Creating Two Related Tables**
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Establishes relationship
);
```
- **Customers Table** – Holds customer details (`CustomerID` is the primary key).
- **Orders Table** – Stores orders with a `CustomerID` that **must** exist in the `Customers` table.

#### **Restricting Invalid Entries**
```sql
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (1, 999, '2025-04-20'); -- Will fail if CustomerID 999 doesn't exist in Customers
```

#### **Using Cascading Actions**
Modify the constraint to enable automatic behavior:
```sql
ALTER TABLE Orders 
ADD CONSTRAINT FK_CustomerOrders FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
ON DELETE CASCADE;
```
- **`ON DELETE CASCADE`** – Deletes all related orders if a customer is deleted.

Hard-Level Tasks
17. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
create table Customers(
	ID int primary key identity (100, 10),
	Name varchar(50),
	Age int check(Age>0)
);
insert into Customers(Name, age) values('Smith', 32);
select * from Customers
18. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
create table Customers(
	ID int primary key identity (100, 10),
	Name varchar(50),
	Age int check(Age>0)
);
19. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID) -- Composite Primary Key
);
20.Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
Both **COALESCE** and **ISNULL** in SQL Server are used to handle **NULL values** by replacing them with a default value. However, they function differently in certain scenarios.

---

### **1. ISNULL Function**
- **Replaces NULL with a specified value**.
- **Accepts only two arguments**: The column being checked and the replacement value.
- **Returns the same data type as the first argument**.

#### **Example: Using ISNULL**
```sql
SELECT ProductID, ProductName, ISNULL(Stock, 0) AS StockCount
FROM Products;
```
- If `Stock` is `NULL`, it will be replaced with `0`.
- `StockCount` displays non-NULL values normally.

#### **Output Example**
| ProductID | ProductName | StockCount |
|-----------|------------|------------|
| 1         | Laptop     | 10         |
| 2         | Mouse      | 5          |
| 3         | Keyboard   | 0          | _(Originally NULL, replaced by `0`)_

---

### **2. COALESCE Function**
- **Returns the first non-NULL value** from a list of arguments.
- **Can handle multiple fallback values**.
- **Returns the highest data type of its arguments**.

#### **Example: Using COALESCE**
```sql
SELECT OrderID, COALESCE(CustomerName, 'Guest', 'Unknown') AS DisplayName
FROM Orders;
```
- If `CustomerName` is **NULL**, it checks `'Guest'`, then `'Unknown'`.
- Returns the **first non-NULL** value in sequence.

#### **Key Difference:**
Unlike `ISNULL`, which **only allows one replacement value**, `COALESCE` lets you specify multiple fallback options.

---

### **When to Use Each?**
- Use **`ISNULL`** for simple NULL replacements.
- Use **`COALESCE`** when dealing with multiple possible fallback values.

21. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
drop table Employees
create table Employees (
	EmpID int primary key,
	Email varchar(50) unique
);
select * from Employees
22. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) 
        REFERENCES Consumers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
