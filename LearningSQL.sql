--Hierarchy of Clauses
--SELECT column1, column2, ...
--FROM table1
--JOIN table2 ON ...
--WHERE condition
--GROUP BY column
--HAVING condition
--ORDER BY column

--use data_vase
--create table person
--(person_id smallint,
--fname varchar(20),
--lname varchar(20),
--eye_color char(2) check (eye_color in ('BR','BL','GR')),
--birth_date date,
--street varchar(30),
--city varchar(20),
--state varchar(20),
--country varchar(20),
--postal_code varchar(20),
--constraint pk_person primary key (person_id)
--)
use data_vase
--insert into person
--(person_id,fname,lname,eye_color,birth_date)
--values(1,'William','Turner','GR','1972-05-27')
--select * from person
--where eye_color = 'GR' and fname = 'William'

select * from [dbo].[Family Income and Expenditure]
where Region = 'VI - Western Visayas' and Main_Source_of_Income = 'Enterpreneurial Activities' and Total_Household_Income > 3000000

select * from [dbo].[Family Income and Expenditure]
where Region = 'VI - Western Visayas'
order by Total_Household_Income desc

select Household_Head_Highest_Grade_Completed as EDUC from [dbo].[Family Income and Expenditure]

--* Selecting Region and counting each distinct element
SELECT DISTINCT Region, count (*) as bilang FROM [dbo].[Family Income and Expenditure]
group by Region
order by bilang desc

--* Selecting Main Source of Income and counting each distinct
select distinct Main_Source_of_Income, count (*) as Source_of_Income from [dbo].[Family Income and Expenditure]
group by Main_Source_of_Income

--* Selecting Household_Head_Marital_Status and counting each distinct
select distinct [Household_Head_Marital_Status], count (*) as Marriage_Status from [dbo].[Family Income and Expenditure]
group by [Household_Head_Marital_Status]

select distinct Main_Source_of_Income, count (*) as Source_of_Income from [dbo].[Family Income and Expenditure]
group by Main_Source_of_Income

--* Selecting Household_Head_Age
select distinct [Household_Head_Age], count(*) as HouseAge from [dbo].[Family Income and Expenditure]
group by [Household_Head_Age]
order by HouseAge desc

select distinct [Household_Head_Occupation], count(*) as Occupation from [dbo].[Family Income and Expenditure]
group by [Household_Head_Occupation]
order by Occupation desc

select distinct Type_of_Roof, count(*) as Roof_Type from [dbo].[Family Income and Expenditure]
group by Type_of_Roof
order by Roof_Type desc

(select [Household_Head_Job_or_Business_Indicator], [Household_Head_Occupation], [Household_Head_Class_of_Worker]
from [dbo].[Family Income and Expenditure]
where [Household_Head_Occupation] = 'NA')

--Derived (subquery-generated) tables
select concat (derived_table.Household_Head_Job_or_Business_Indicator,  ' AND ' , derived_table.Household_Head_Occupation) as NEW from	
(SELECT Household_Head_Job_or_Business_Indicator, Household_Head_Occupation, Household_Head_Class_of_Worker
    FROM [dbo].[Family Income and Expenditure]) AS derived_table

--Derived (subquery-generated) tables
select concat (derived_table.Region,  ' AND ' , derived_table.Household_Head_Occupation) as NEW from	
(SELECT Region, Household_Head_Occupation, Main_Source_of_Income
FROM [dbo].[Family Income and Expenditure]  where Region = 'VI - Western Visayas') AS derived_table

--Derived (subquery-generated) tables
select concat (derived_table.Region,  ' AND ' , derived_table.Household_Head_Occupation) as NEW from	
(SELECT Region, Household_Head_Occupation, Main_Source_of_Income
FROM [dbo].[Family Income and Expenditure]  where Region = 'VI - Western Visayas' and Household_Head_Occupation = 'General managers/managing proprietors in transportation, storage and communications') AS derived_table

select distinct Household_Head_Class_of_Worker, count (*) as count from [dbo].[Family Income and Expenditure]
group by Household_Head_Class_of_Worker
order by count

--creating a temporary table
create table #temp_table1
(col1 int, col2 int, col3 int)
select * from #temp_table1

--inserting columns to temporary table from existing table
insert into #temp_table1
select Total_Food_Expenditure, Total_Rice_Expenditure, Vegetables_Expenditure
from [dbo].[Family Income and Expenditure]
select * from #temp_table1

create table #temp_table2
(col3 text, col4 text, col5 text)
select * from #temp_table2

insert into #temp_table2
select Household_Head_Highest_Grade_Completed, [Household_Head_Job_or_Business_Indicator], [Household_Head_Occupation]
from [dbo].[Family Income and Expenditure] where [Household_Head_Job_or_Business_Indicator] = 'With Job/Business'
select * from #temp_table2

--creating a table view
create view table_view as
select Region, Household_Head_Class_of_Worker, Type_of_Household
from [dbo].[Family Income and Expenditure]
select * from table_view

--query from table view
select Region, Household_Head_Class_of_Worker, Type_of_Household
from table_view
where Type_of_Household = 'Single Family'

select * from [dbo].[Family Income and Expenditure]

select * from [dbo].[Inpatient_Pat]
select * from [dbo].[Inpatient_provdr]

--altering data type
ALTER TABLE [dbo].[Inpatient_provdr]
ALTER COLUMN DRG_Definition nvarchar(100) not null

select * from [dbo].[Inpatient_Pat]
select * from [dbo].[Inpatient_provdr]

--joining table
SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition

SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition

SELECT *
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_Pat].DRG_Definition

SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where [dbo].[Inpatient_Pat].Average_Medicare_Payments < 5000 and [dbo].[Inpatient_provdr].Provider_State = 'CA' and [dbo].[Inpatient_provdr].Provider_City = 'oakland'

SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where [dbo].[Inpatient_Pat].Average_Medicare_Payments < 5000 and [dbo].[Inpatient_provdr].Provider_State = 'CA' and [dbo].[Inpatient_provdr].Provider_City = 'oakland' and [dbo].[Inpatient_provdr].DRG_Definition = '192 - CHRONIC OBSTRUCTIVE PULMONARY DISEASE W/O CC/MCC'

SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where [dbo].[Inpatient_provdr].Total_Discharges > 2000

SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where ([dbo].[Inpatient_provdr].Average_Medicare_Payments < 2000 and [dbo].[Inpatient_Pat].Average_Medicare_Payments < 3000) and
([dbo].[Inpatient_provdr].Total_Discharges < 30000)

--using joins with group by clause, when there is a count in the query, we must always use group by clause at the end
SELECT [dbo].[Inpatient_Pat].DRG_Definition, count(*)
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where ([dbo].[Inpatient_provdr].Average_Medicare_Payments < 2000 and [dbo].[Inpatient_Pat].Average_Medicare_Payments < 3000) and
([dbo].[Inpatient_provdr].Total_Discharges < 30000)
group by [dbo].[Inpatient_Pat].DRG_Definition

--Selecting all columns from joined tables
SELECT *
FROM [dbo].[Inpatient_Pat]
INNER JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition

SELECT *
FROM [dbo].[Inpatient_Pat]
SELECT *
FROM [dbo].[Inpatient_provdr]

SELECT [dbo].[Inpatient_provdr].DRG_Definition, COUNT(*)
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where [dbo].[Inpatient_provdr].DRG_Definition = '207 - RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT 96+ HOURS'
group by [dbo].[Inpatient_provdr].DRG_Definition

SELECT [dbo].[Inpatient_provdr].Provider_City, COUNT(*)
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where ([dbo].[Inpatient_provdr].Provider_City = 'BOSTON' or [dbo].[Inpatient_provdr].Provider_City = 'NEW YORK')
group by [dbo].[Inpatient_provdr].Provider_City

SELECT [dbo].[Inpatient_provdr].Provider_City, COUNT(*)
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
group by [dbo].[Inpatient_provdr].Provider_City
having COUNT(*) > 80000

SELECT [dbo].[Inpatient_provdr].Provider_City, COUNT(*)
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
group by [dbo].[Inpatient_provdr].Provider_City
having COUNT(*) > 80000
order by [dbo].[Inpatient_provdr].Provider_City

SELECT [dbo].[Inpatient_provdr].Provider_City, COUNT(*)
FROM [dbo].[Inpatient_provdr]
INNER JOIN [dbo].[Inpatient_Pat] ON [dbo].[Inpatient_provdr].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition
where ([dbo].[Inpatient_provdr].Provider_City = 'BOSTON' or [dbo].[Inpatient_provdr].Provider_City = 'NEW YORK')
group by [dbo].[Inpatient_provdr].Provider_City
having COUNT(*) > 70000

--Altering column before comparing, must be of compatible data types
ALTER TABLE [dbo].[Outpatient_provdr]
ALTER COLUMN APC nvarchar(max);

select *
from [dbo].[Inpatient_provdr]
inner join [dbo].[Outpatient_provdr] on [dbo].[Inpatient_provdr].Provider_Id = [dbo].[Outpatient_provdr].Provider_Id
where [dbo].[Outpatient_provdr].APC = '0336 - Magnetic Resonance Imaging and Magnetic Resonance Angiography without Contrast'

select [dbo].[Outpatient_provdr].APC, COUNT(*)
from [dbo].[Inpatient_provdr]
inner join [dbo].[Outpatient_provdr] on [dbo].[Inpatient_provdr].Provider_Id = [dbo].[Outpatient_provdr].Provider_Id
where [dbo].[Outpatient_provdr].APC = '0336 - Magnetic Resonance Imaging and Magnetic Resonance Angiography without Contrast'
group by [dbo].[Outpatient_provdr].APC

select [dbo].[Inpatient_provdr].Average_Covered_Charges, [dbo].[Inpatient_provdr].Provider_City,[dbo].[Inpatient_provdr].Provider_State from [dbo].[Inpatient_provdr]
order by [dbo].[Inpatient_provdr].Average_Covered_Charges

select * from [dbo].[Inpatient_provdr]
select * from [dbo].[Outpatient_provdr]

select [dbo].[Inpatient_provdr].Average_Total_Payments from [dbo].[Inpatient_provdr]
select [dbo].[Outpatient_provdr].Average_Total_Payments from [dbo].[Outpatient_provdr]

--Using wildcards and regex

--Provider_Name beginning with letters 'eu'
select [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Provider_State,[dbo].[Inpatient_provdr].Provider_City
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Provider_Name like 'eu%'

--Provider_Name ending with letters 'x'
select [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Provider_State,[dbo].[Inpatient_provdr].Provider_City
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Provider_Name like '%x'

--Provider_Name with letters 'by' in the middle of the string
select [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Provider_State,[dbo].[Inpatient_provdr].Provider_City
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Provider_Name like '%by%'

--Provider_City with four characters ending with the letter 'z'
select [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Provider_State,[dbo].[Inpatient_provdr].Provider_City
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Provider_City like '___z'

use data_vase	