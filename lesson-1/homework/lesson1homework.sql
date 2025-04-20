/* Easy
1. Definitions
Data: Information in raw form that can be processed or analyzed to make it meaningful. For example, text, numbers, images, etc.

Database: A structured collection of data, stored electronically, that allows users to access, manage, and manipulate the information efficiently.

Relational Database: A type of database that organizes data into tables where relationships exist between those tables. It uses structures like rows and columns for data representation.

Table: A data structure within a relational database consisting of rows and columns. Each row represents a record, and each column represents a field within that record.

2. Five Key Features of SQL Server
High Performance: Advanced query optimization and indexing features ensure quick data processing.

Integrated Security: Protects data with encryption, access controls, and authentication.

Scalability: Handles large amounts of data and concurrent users seamlessly.

Advanced Analytics: Includes tools like SQL Server Machine Learning Services for predictive analytics.

Replication and Backup: Offers robust replication, backup, and restore features for data integrity.

3. Authentication Modes in SQL Server
Windows Authentication: Uses Windows credentials for access; ideal for integration with Active Directory.

SQL Server Authentication: Requires a username and password specific to SQL Server.*/

--MEDIUM
CREATE DATABASE SchoolDB;
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
NAME VARCHAR(50),
AGE INT
);
SELECT * FROM Students;

/*Differences Between SQL Server, SSMS, and SQL
SQL Server:

A relational database management system (RDBMS) developed by Microsoft. It is the engine where databases are stored, processed, and queried.

Think of it as the "backend server" that handles data storage, management, and security.

SSMS (SQL Server Management Studio):

A graphical user interface (GUI) tool that allows users to interact with SQL Server.

Developers and database administrators (DBAs) use it to run queries, design databases, monitor performance, and handle other database management tasks.

SQL (Structured Query Language):

A programming language used to communicate with and manipulate databases.

It is a standard language, not limited to SQL Server, and can be used with other database systems (e.g., MySQL, PostgreSQL, Oracle).*/
##hard
SQL commands are categorized into five types:
- DQL (Data Query Language): Used to retrieve data.*/
SELECT * FROM Students;

- DML (Data Manipulation Language): Used to modify data.INSERT INTO Students (ID, Name, Age) VALUES (1, 'Alice', 20);
UPDATE Students SET Age = 21 WHERE ID = 1;
DELETE FROM Students WHERE ID = 1;

- DDL (Data Definition Language): Used to define database structures.CREATE TABLE Students (ID INT, Name VARCHAR(50), Age INT);
ALTER TABLE Students ADD COLUMN Grade VARCHAR(10);
DROP TABLE Students;

- DCL (Data Control Language): Used for permissions.
GRANT SELECT ON Students TO User1;
REVOKE SELECT ON Students FROM User1;

- TCL (Transaction Control Language): Used to manage transactions.BEGIN TRANSACTION;
UPDATE Students SET Age = 22 WHERE ID = 2;
COMMIT;


For more details, you can check this resource.
8. Insert Three Records into Students Table*/
INSERT INTO Students (ID, Name, Age) VALUES
(1, 'Alice', 20),
(2, 'Bob', 21),
(3, 'Charlie', 22);


--9. Backup and Restore SchoolDB Database
Backup:
BACKUP DATABASE SchoolDB TO DISK = 'C:\Backups\SchoolDB.bak';


Restore:
RESTORE DATABASE SchoolDB FROM DISK = 'C:\Backups\SchoolDB.bak';

