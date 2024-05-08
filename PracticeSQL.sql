--**Query Principles by Order
--select
--from
--where
--group by
--having
--order by

--*Creating Tables in SSMS
--create table SportTeams
--(TeamID int,TeamName ntext,Attack int,Defense int)
--insert into SportTeams (TeamID,TeamName,Attack,Defense)
--values(23,'Wolf FC',2,3)

--To display a column name to a different name
--select teamid as id,teamname as name from SportTeams; 

--*Deleting contents from columns
--select * from SportTeams
--delete from SportTeams
--select * from SportTeams

--*delete table from SSMS
--drop table SportTeams

--*Sample Queries
--declare @karakter as varchar(3);
--set @karakter = 'hilaw';
--select @karakter
--select LEN(@karakter) as 'haba', DATALENGTH(@karakter) as 'dita'

--DECLARE @myvariable NVARCHAR(20) = N'hello'
--select LEN(@myvariable), DATALENGTH(@myvariable) as 'baba'

--select right(@myvariable,2), LEFT(@myvariable,2)
--select SUBSTRING(@myvariable,3,3)

--declare @myvar varchar(10) = 'HELLO'
--select substring(@myvar,3,2)
--select substring(@myvar,2,2)
--select left(@myvar,2)
--select substring(@myvar,2,3)

--declare @pers_name nvarchar(20);
--declare @medel_name nvarchar(20);
--declare @lust_name nvarchar(20);
--declare @fool_name nvarchar(20);

--set @pers_name = 'Sarat';
--set @medel_name = 'JuicyKa';
--set @lust_name = 'Farker';

--select iif(@medel_name IS NULL,'waray medel name')
--set @fool_name = @pers_name+IIF(@medel_name IS NULL,' ',@medel_name)+@lust_name
--select @fool_name as pullname

--DECLARE @mychar1 as NVARCHAR(10) = N'hello'
--DECLARE @mychar2 as NVARCHAR(10)
--SELECT LEFT(@mychar1 + @mychar2, 2)

--select 'String ito' + 45
--select 'String ito ' + CONVERT(varchar(10),15233)
--select 'String ito ' + cast(15233 as varchar(10))

--select 'Eto na lang natira sa sahod ko ' + FORMAT(0,'c')
--select 'Eto na lang natira sa sahod ko ' + FORMAT(0,'c','en-GB')
--select 'Eto na lang natira sa sahod ko ' + FORMAT(0,'c','fr-FR')
--select 'Eto na lang natira sa sahod ko ' + FORMAT(0,'c','ph-PH')
--SELECT FORMAT(2345.6,'C')

--*Selecting all last names' first letter, giving it a column header, counting the frequencies of each letter and ordering it, we can add the function 'asc' for ascending or 'desc' for descending order
--select LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
--from [70-461datau]
--group by LEFT(EmployeeLastName,1) order by PersLetter

--*Ordering by count, can also add the function asc or desc (ascending by default)
--select LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
--from [70-461datau]
--group by LEFT(EmployeeLastName,1) order by count(*)
use data_vase
--*Using the function 'top' to obtain the top rows desired
select top(10) LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
from [70-461datau]
group by LEFT(EmployeeLastName,1) order by count(*)

select * from [70-461datau]

SELECT DISTINCT Department FROM [70-461datau] ORDER BY Department desc

--*Using the function 'having' to retrieve top 10 columns which only have 50 or more frequencies, we can still use the functions asc or desc at the end of the query
--select top(10) LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
--from [70-461datau]
--group by LEFT(EmployeeLastName,1)
--having COUNT(*)>=50
--order by count(*)

--select * from [dbo].[70-461datau]
--select LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
--from [70-461datau]
--where DateOfBirth > '19860101'
--group by LEFT(EmployeeLastName,1)
--having COUNT(*)>=20
--order by count(*)

--*Using the function 'where' by date
--select LEFT(EmployeeLastName,1) as PersLetter, count(*) as bilang
--from [70-461datau]
--where DateOfBirth > '19860101'
--group by LEFT(EmployeeLastName,1)
--having COUNT(*)>=20
--order by count(*)

--*Using where function for date
--select EmployeeLastName, count(*) as bilang
--from [70-461datau]
--where DateOfBirth < '19860101'
--group by EmployeeLastName
--having COUNT(*)>=1
--order by count(*)

--*Using 'where' function with additional conditions
--select EmployeeLastName, count(*) as bilang
--from [70-461datau]
--where DateOfBirth < '19860101' and EmployeeLastName = 'Abbas' or EmployeeLastName = 'Choi'
--group by EmployeeLastName
--having COUNT(*)>=1
--order by count(*)

--*Reducing rows further from SportTeams
--SELECT top(2) Attack, COUNT(*) AS NumberOfRows
--FROM SportTeams
--group by Attack order by COUNT(*) desc;

--*Reducing the number of rows, so it only returns those rows where NumberOfRows is 4 or greater.
--SELECT Attack, COUNT(*) AS NumberOfRows
--FROM SportTeams
--GROUP BY Attack
--having COUNT(*) >= 4
--ORDER BY NumberOfRows
--DESC, Attack;

--Experimental Queries
--select EmployeeFirstName as PersNeym,EmployeeMiddleName as MedelNeym, EmployeeLastName as Apelyido,DateOfBirth as ArawNgKapanganakan from [70-461datau]
--where EmployeeMiddleName is not null and LEN(EmployeeMiddleName) > 2 and DateOfBirth > '19800101'
--order by DateOfBirth desc

--*Using count function will not work if we do not include group by function, here we output the month number
--select DATEPART(month,DateOfBirth) as MonthNumber, COUNT(*) as NumberOfEmployees
--from [dbo].[70-461datau]
--group by DATEPART(month,DateOfBirth)

--*Using count function will not work if we do not include group by function, here we output the month name
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth)

--*We arrange in descending order using order by function using the Number of Employees
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth)
--order by NumberOfEmployees desc

--*Here we only have the date number ordered by month number in ascending order
--select DATEPART(month,DateOfBirth) as MonthNumber, COUNT(*) as NumberOfEmployees
--from [dbo].[70-461datau]
--group by DATEPART(month,DateOfBirth)
--order by DATEPART(month,DateOfBirth) asc

--*Here we replaced the month number to its month name order by month by following the group by with a second condition DATEPART(MONTH,DateOfBirth)
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth), DATEPART(MONTH,DateOfBirth)
--order by DATEPART(month,DateOfBirth) asc

--*This will return more rows because we used year to order
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees, YEAR(DateOfBirth) as Year
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth), YEAR(DateOfBirth)
--order by YEAR(DateOfBirth) asc

--*Displaying to another column the count of employees with not null MiddleNames
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
--COUNT(EmployeeMiddleName) as MiddleNames
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth), DATEPART(MONTH,DateOfBirth)
--order by DATEPART(month,DateOfBirth) asc

--*Displaying the count of employees with no middle name listed from the table, and the earliest and latest date of birth as new columns
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
--COUNT(EmployeeMiddleName) as MiddleNames,
--COUNT(*) - COUNT(EmployeeMiddleName) as NoMiddleNameListed,
--MIN(DateOfBirth) as EarlieastDateOfBirth,
--MAX(DateOfBirth) as Latest_Date_Of_Birth
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth), DATEPART(MONTH,DateOfBirth)
--order by DATEPART(month,DateOfBirth)

--*With date format
--select DATENAME(month,DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
--COUNT(EmployeeMiddleName) as MiddleNames,
--COUNT(*) - COUNT(EmployeeMiddleName) as NoMiddleNameListed,
--format(MIN(DateOfBirth),'D') as EarlieastDateOfBirth,
--format(MAX(DateOfBirth),'dd-MM-yyyy') as Latest_Date_Of_Birth
--from [dbo].[70-461datau]
--group by DATENAME(month,DateOfBirth), DATEPART(MONTH,DateOfBirth)
--order by DATEPART(month,DateOfBirth)

--*Converting an integer to a date format, you must convert first the integer to a string
--SELECT CONVERT(date, CONVERT(varchar(10), DateOfTransaction), 112) AS ConvertedDate
--FROM [dbo].[tblTransaction150707_csv]

--*Querying about how many employees have the same first names
--select EmployeeFirstName as FirstName, COUNT(*) as Repeated_Names
--from [dbo].[70-461datau]
--group by EmployeeFirstName
--order by Repeated_Names desc

--*Querying about how many employees have the same last names
--select EmployeeLastName as Last_Name, COUNT(*) as Repeated_Last_Names
--from [dbo].[70-461datau]
--group by EmployeeLastName
--order by Repeated_Last_Names desc

--*Query on how many employees have the same middle name removing the nulls and the middle initials by creating a condition on having more the 2 characters
--select EmployeeMiddleName as MiddleName, COUNT(*) as Middle_Name
--from [dbo].[70-461datau]
--group by EmployeeMiddleName
--having LEN(EmployeeMiddleName) > 2
--order by Middle_Name desc

--*Query on how many employees have the same employee number
--select EmployeeNumber as EmpNum, count(*) as NumEmployees
--from [dbo].[tblTransaction150707_csv]
--group by EmployeeNumber
--order by NumEmployees desc

--*Joining two tables into one
--select * into goals_points from [dbo].[IsportTims]
--LEFT JOIN [dbo].[IsportGoals] ON [dbo].[IsportTims].teamID = [dbo].[IsportGoals].team;

--*Using a derived table to retrieve a new column, we must use an alias to output
--select Department
--from(select Department, count(*) as Defartment
--from [dbo].[70-461datau]
--group by Department) as MgaDepartamento

--*Counting the number of departments
--select count(Department) as IlangDepartments
--from(select Department, count(*) as Defartment
--from [dbo].[70-461datau]
--group by Department) as MgaDepartamento

use data_vase
--*Using the function distinct
select distinct (Department)
from [dbo].[70-461datau]

SELECT GETDATE()