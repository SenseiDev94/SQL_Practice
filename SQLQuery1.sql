--SQL Constraints
-- Primary Key
-- Foreign Key
-- UNIQUE
-- CHECK
-- DEFAULT
-- Not NULL

-- Update (DML)
-- Alter (DDL)

-- Between / Order By
-- Group By / Count Of
-- Sub Queries/Embedded Queries

-- CREATE Commands
	--CREATE TABLE
	--CREATE VIEW
	--CREATE INDEX
	--CREATE UNIQUE INDEX
	--CREATE DATABASE
	--CREATE PROCEDURE

-- DROP Commands
	--DROP COLUMN
	--DROP TABLE
	--DROP CONSTRAINT
	--DROP VIEW
	--DROP INDEX
	--DROP DATABASE

Create table Cust_Department
(Dept_Id Int,
Dept_Name Varchar(50),
Dept_Loc Varchar(50)
CONSTRAINT PK_Dept_ID
PRIMARY KEY (Dept_Id));

Create table Customers
(Cust_Id Int,
Cust_Fname Varchar (50),
Cust_Lname Varchar(50),
Cust_Addr1 Varchar (50),
Cust_Addr2 Varchar(50),
Cust_City Varchar(50),
Cust_Zip int,
Cust_DOB Date,
Dept_Id Int,
Cust_Basic_Sal Decimal(10,2),
Cust_Benefits Decimal(10,2),
Cust_Commision Decimal(10,2)
CONSTRAINT PK_Cust_Id PRIMARY KEY (Cust_Id),
CONSTRAINT FK_Dept_ID FOREIGN KEY (Dept_Id) REFERENCES Cust_Department(Dept_Id));

Select * from Customers
Select * from Cust_Department

Bulk 
Insert Cust_Department 
From 'C:\Users\dtayl\Downloads\Data Analytics\Cust_Department.txt'
With (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Bulk 
Insert Customers 
From 'C:\Users\dtayl\Downloads\Data Analytics\Customers.txt'
With (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Insert into Cust_Department (Dept_Id, Dept_Name, Dept_Loc)
Values (111, 'Salon', 'North Lake')

-- Retrieve data from customers between 1001 and 1005
-- Retrieve data for customers who belong to Dept_id 104
-- Retrieve data for cust_department where dept_id = 101

Select * from Customers where Cust_Id between 1001 and 1005
Select * from Customers where Dept_Id = 104
Select * from Cust_Department where Dept_Id = 101

-- Primary Key
-- Foreign Key
-- UNIQUE
-- CHECK
-- DEFAULT
-- Not NULL

Select * from Persons

--Unique Constraint
Create TABLE Person_Uniq
(P_ID Int,
P_name varchar (50),
P_Age Int,
P_City varchar (40),
P_zip Varchar (10)
CONSTRAINT UQ_P_ID Unique (P_Id))

Select * from Person_Uniq

Insert into Person_Uniq (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Unique', 34, 'Charlotte', 23098) -- This will show data with no error

Insert into Person_Uniq (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Unique', 34, 'Charlotte', 23098) -- This will show an error for Unique Constraint

Insert into Person_Uniq (P_ID, P_Name, P_Age, P_City, P_zip)
Values (101, 'Test Unique', 34, 'Charlotte', 23098) -- This will show data with no error


--Check Constraint
Create TABLE Person_Chck
(P_ID Int,
P_name varchar (50),
P_Age Int CHECK (P_Age > 18),
P_City varchar (40),
P_zip Varchar (10))

Select * from Person_Chck

Insert into Person_Chck (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Unique', 34, 'Charlotte', 23098)

Insert into Person_Chck (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Unique', 12, 'Charlotte', 23098) -- This will give an error becasue of Check constraint age < 18


Create TABLE Person_Defa
(P_ID Int,
P_name varchar (50),
P_Age Int,
P_City varchar (40) Default 'Charlotte',
P_zip Varchar (10))

Select * from Person_Defa

Insert into Person_Defa (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Default', 19, 'Charlotte', 23098)

-- Not NULL
Create TABLE Person_Null
(P_ID Int,
P_name varchar (50),
P_Age Int,
P_City varchar (40) Not Null,
P_zip Varchar (10))

Select * from Person_Null

Insert into Person_Null (P_ID, P_Name, P_Age, P_City, P_zip)
Values (100, 'Test Null', 19, 'Charleston', 23098)

-- DROP Commands
	--DROP COLUMN (with Alter)
	--DROP TABLE
	--DROP CONSTRAINT (with Alter)
	--DROP VIEW
	--DROP INDEX
	--DROP DATABASE

Create table DropTest
(DropDept_Id Int,
Dept_Name Varchar(50),
Dept_Loc Varchar(50),
Dept_Startdate date
CONSTRAINT PK_DropDeptID	
PRIMARY KEY (DropDept_Id));

Create Index IX_Dept_Name
On DropTest (Dept_Name ASC)

Select * from DropTest

Select * from Products2

--ALTER Command with ADD will help add a Col., Index, or Constraint
--ALTER Command with DROP will help drop a Col., Index, or Constraint

--ADD Column
Select * from DropTest
--Add Email1 to DropTest table 

ALTER table DropTest 
ADD Email1 Varchar (50)

Select * from DropTest

ALTER table Droptest
ADD Phone1 varchar(10), Phone2 varchar (10)

--Delete a Column using Alter and DROP Command
ALTER table DropTest
DROP Column Phone1


--DROP Index (do not have to use ALTER command)
DROP INDEX  DropTest.IX_Dept_Name
DROP INDEX DropTest.PK_DropDeptID -- This will show an error, cannot drop Primary Key as Index

--DROP Constraint using ALTER Command
ALTER table DropTest
DROP CONSTRAINT PK_DropDeptID

--ADD Constraint using ALTER ADD Command
ALTER table DropTest
ADD CONSTRAINT PK_DropDeptID PRIMARY KEY (DropDept_ID)

--Create Database
Create Database DropTestDB

--DROP Database
DROP Database DropTestDB

Create Table Dept_Location
(Department_City Varchar (30),
Addr1 Varchar(50),
Addr2 Varchar(50),
Zip_Code int,
Phone_No Varchar(10),
CONSTRAINT PK_DeptCity Primary Key (Department_City))

BULK
INSERT Dept_Location
FROM 'C:\Users\dtayl\Downloads\Data Analytics\Dept_Location.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

CREATE TABLE EMP_DEPARTMENT
(Dept_Id Int,
Dept_Name Varchar(40),
Dept_City Varchar(30),
Dept_State Varchar(10)
CONSTRAINT PK_Deptid PRIMARY KEY (Dept_Id)
CONSTRAINT FK_Deptcity FOREIGN KEY (Dept_City) REFERENCES Dept_Location(Department_City));

BULK
INSERT Emp_Department
FROM 'C:\Users\dtayl\Downloads\Data Analytics\Department.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

CREATE TABLE EMPLOYEE
(Emp_ID Int,
Emp_FName Varchar (50),
Emp_LName Varchar (50),
Emp_Addr1 Varchar (40),
Emp_Addr2 Varchar (40),
Emp_City Varchar (40),
Emp_Zip Int,
Emp_Sal Decimal(10,2),
Dept_Id Int,
CONSTRAINT PK_EMPID PRIMARY KEY (Emp_ID),
CONSTRAINT FK_DeptId FOREIGN KEY (Dept_Id) REFERENCES EMP_DEPARTMENT(Dept_Id));

BULK
INSERT Employee
FROM 'C:\Users\dtayl\Downloads\Data Analytics\Employee.txt'
WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n')

Select * from EMPLOYEE
Select * from Dept_Location
Select * from EMP_DEPARTMENT

-- Retrieve all records from Employee table for the Dept_id = 1003
Select * from EMPLOYEE
Where Dept_Id = 1003

-- Retrieve all records from Employee table for Emp_Zip = 28998
Select * from EMPLOYEE
Where Emp_Zip = 28998

-- Retrieve all records from Employee with Emp_ID between 101 and 106
Select * from EMPLOYEE
Where Emp_ID between 101 and 106

-- Retrieve all Employees whose Emp_Sal > 9000
Select * from EMPLOYEE 
Where Emp_Sal > 9000

-- Retrieve all Employees working in Dept_id 1001, 1004, 1008
Select * from EMPLOYEE
Where Dept_Id in (1001,1004,1008)

-- Select all the records from Employee whose F_Names between the letter starts with D & S Order by Emp Fname
Select * from EMPLOYEE
Where Emp_FName between 'D' and 'S'

-- Select all the records from Employee whose F_Names between the letter starts with J & S Order by Dept_ID
Select * from EMPLOYEE
Where Emp_FName between 'J' and 'S' 
Order By Dept_Id ASC

-- Select all the employees from Employee table Order by Emp_Fname for the Employee IDs between 103 and 110
Select * from EMPLOYEE
Where Emp_ID between 103 and 110
Order By Emp_FName ASC 

-- Retrieve data from Employee table group by Emp_Zip
Select * from EMPLOYEE
Select Emp_Zip from EMPLOYEE group by Emp_Zip

-- Retrieve all the records from Emp_DEpartment table for Dept_City = Charlotte
Select * from EMP_DEPARTMENT where Dept_City = 'Charlotte'

-- Retrieve all the records from Emp_Department table for Drpt_State = NC
Select * from EMP_DEPARTMENT where Dept_State = 'NC'

-- Retrieve all teh records from Emp_Department table for Dept_Name in Mechanical, Treasury, Sales
Select * from EMP_DEPARTMENT where Dept_Name in ('Mechanical', 'Treasury', 'Sales')

-- Retrieve all the records from department where dept name is mechanical or chemical
Select * from EMP_DEPARTMENT where Dept_Name in ('Mechanical', 'Chemical')

-- Retrieve Dept_Id, Dept_Name from Department whose Dept_City is Charlotte
Select Dept_ID, Dept_Name from EMP_DEPARTMENT where Dept_City = 'Charlotte'

-- Retrieve Dept_Id, Emp_FName from Employee group by Dept_Id, Emp_Fname
Select Dept_ID, Emp_Fname from EMPLOYEE
Group by Dept_Id, Emp_FName

-- Retrieve count of emp_id, Emp_Zip from Employee group by emp_Zip
Select Emp_Zip, Count(Emp_id) as Empl_ID
from EMPLOYEE
group by Emp_Zip

-- Retrieve all the data from Dept_Location for Dept_City =  Troy
Select * from Dept_Location where Department_City = 'Troy'

-- Retrieve all the data from Dept_Location for Zip_Code = 88160
Select * from Dept_Location where Zip_Code = 88160

-- Retrieve all the data from Dept_Location where Dept_City in Charlotte, Detroit, Troy
Select * from Dept_Location where Department_City in ('Charlotte', 'Detroit', 'Troy')

-- Select Emp_ID, Emp_Fname, Emp_Lname, Emp_Sal from employee for dept_id 1009
Select Emp_ID, Emp_Fname, Emp_Lname, Emp_Sal
From EMPLOYEE where Dept_Id = 1009

-- Select all the records from Employee where Emp_Sal < 5000 and Dept_ID in 1002,1004,1005,1008
Select * from EMPLOYEE
Where Emp_Sal < 5000 and Dept_Id in (1002, 1004, 1005, 1008)

-- Select Dept_Name, Dept_City for Employee 106
Select Dept_Name, Dept_City from EMP_DEPARTMENT
Where Dept_Id in (Select Dept_Id from EMPLOYEE where Emp_ID = 106)

-- Select all employees who are working in Dept_City = Charlotte
Select Emp_ID from EMPLOYEE
Where Dept_Id in (Select Dept_ID from EMP_DEPARTMENT where Dept_City = 'Charlotte')

-- Select dept_Name for the Emp_Lname with Dutt
Select Dept_Name from EMP_DEPARTMENT
Where Dept_ID in (Select Dept_ID from EMPLOYEE where Emp_Lname = 'Dutt')

-- Select Emp_Fname, Emp_Sale for all employees whose dept_Name = Compliance
Select Emp_Fname, Emp_Sal from EMPLOYEE
Where Dept_Id in (Select Dept_Id from EMP_DEPARTMENT where Dept_Name = 'Compliance')




--Sub Queries/Embedded SQL/Nested SQL Commands

Select * from EMPLOYEE
Select * from EMP_DEPARTMENT
Select * from Dept_Location


-- Find out department name where John Smith is working 
Select Dept_Id from EMPLOYEE 
Where Emp_ID = 101

Select Dept_Name from EMP_DEPARTMENT
Where Dept_Id in (Select Dept_Id from EMPLOYEE Where Emp_ID = 101)

-- Find out the Dept_Name, Dept_City for the employee ID 105
Select Dept_Name, Dept_City from EMP_DEPARTMENT
Where Dept_Id in (Select Dept_Id from EMPLOYEE Where Emp_ID = 105)

--Find out all the employee IDs, Emp FName, Emp_LName who are working for the dept_Name Sales
Select Emp_ID, Emp_FName, Emp_LName from EMPLOYEE
Where Dept_Id in (Select Dept_Id from EMP_DEPARTMENT Where Dept_Name = 'Sales')

-- CREATE Commands
	--CREATE TABLE
	--CREATE VIEW
	--CREATE INDEX
	--CREATE UNIQUE INDEX
	--CREATE DATABASE
	--CREATE PROCEDURE