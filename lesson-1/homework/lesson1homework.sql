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
