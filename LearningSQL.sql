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
right JOIN [dbo].[Inpatient_provdr] ON [dbo].[Inpatient_Pat].DRG_Definition = [dbo].[Inpatient_provdr].DRG_Definition

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

select [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Provider_State,[dbo].[Inpatient_provdr].Provider_City
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Provider_City is null

select [dbo].[Inpatient_Pat].DRG_Definition from [dbo].[Inpatient_Pat]
select [dbo].[Outpatient_Pat].APC from [dbo].[Outpatient_Pat]

select [dbo].[Inpatient_Pat].DRG_Definition from [dbo].[Inpatient_Pat]
except
select [dbo].[Outpatient_Pat].APC from [dbo].[Outpatient_Pat]

SELECT CONCAT('danke sch', CHAR(148), 'n');
SELECT STUFF('hello world', 1, 5, 'goodbye cruel')
select (1+2)
SELECT GETDATE()

select [dbo].[Outpatient_Pat].APC,  count(*) as kawnt from [dbo].[Outpatient_Pat]
group by [dbo].[Outpatient_Pat].APC

select max([dbo].[Outpatient_Pat].APC) from [dbo].[Outpatient_Pat]

select [dbo].[Inpatient_provdr].Provider_Name from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_Name
order by [dbo].[Inpatient_provdr].Provider_Name

select [dbo].[Inpatient_provdr].Provider_Name from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_Name
order by [dbo].[Inpatient_provdr].Provider_Name

select [dbo].[Inpatient_provdr].Provider_Name, COUNT(*) as cunt from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_Name
order by [dbo].[Inpatient_provdr].Provider_Name

select [dbo].[Inpatient_provdr].Average_Total_Payments from [dbo].[Inpatient_provdr]

select max([dbo].[Inpatient_provdr].Average_Total_Payments) from [dbo].[Inpatient_provdr]
select min([dbo].[Inpatient_provdr].Average_Total_Payments) from [dbo].[Inpatient_provdr]
select avg([dbo].[Inpatient_provdr].Average_Total_Payments) from [dbo].[Inpatient_provdr]
select count([dbo].[Inpatient_provdr].Average_Total_Payments) from [dbo].[Inpatient_provdr]

select count([dbo].[Inpatient_provdr].Average_Total_Payments),
count(distinct [dbo].[Inpatient_provdr].Average_Total_Payments)
from [dbo].[Inpatient_provdr]

select [dbo].[Inpatient_provdr].Provider_Name, COUNT(*) as prubayder_neym
from [dbo].[Inpatient_provdr]
group by rollup([dbo].[Inpatient_provdr].Provider_Name)

select [dbo].[Inpatient_provdr].Provider_Name, COUNT(*) as prubayder_neym
from [dbo].[Inpatient_provdr]
group by rollup([dbo].[Inpatient_provdr].Provider_Name)
having COUNT(*) > 50

select [dbo].[Inpatient_provdr].DRG_Definition, [dbo].[Inpatient_provdr].Provider_State, COUNT(*) as state_count
from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].DRG_Definition,[dbo].[Inpatient_provdr].Provider_State
order by [dbo].[Inpatient_provdr].DRG_Definition

select [dbo].[Inpatient_provdr].DRG_Definition, [dbo].[Inpatient_provdr].Provider_State, COUNT(*) as state_count
from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].DRG_Definition,[dbo].[Inpatient_provdr].Provider_State
having COUNT(*) >= 50
order by [dbo].[Inpatient_provdr].DRG_Definition

select [dbo].[Inpatient_provdr].DRG_Definition, [dbo].[Inpatient_provdr].Provider_State, COUNT(*) as state_count
from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].DRG_Definition,[dbo].[Inpatient_provdr].Provider_State
having COUNT(*) >= 50
order by state_count

select [dbo].[Inpatient_provdr].DRG_Definition, [dbo].[Inpatient_provdr].Provider_State, COUNT(*) as state_count
from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].DRG_Definition,[dbo].[Inpatient_provdr].Provider_State
having COUNT(*) >= 100
order by state_count desc

select [dbo].[Inpatient_provdr].DRG_Definition, [dbo].[Inpatient_provdr].Provider_Name, [dbo].[Inpatient_provdr].Total_Discharges
from [dbo].[Inpatient_provdr]
where [dbo].[Inpatient_provdr].Total_Discharges = (select MAX([dbo].[Inpatient_provdr].Total_Discharges) from [dbo].[Inpatient_provdr])

select [dbo].[Inpatient_provdr].Total_Discharges from [dbo].[Inpatient_provdr]
order by [dbo].[Inpatient_provdr].Total_Discharges desc

select * from [dbo].[Review_patient_history_samp]

--Creating a query without the from clause
 SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
 UNION ALL
 SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
 UNION ALL
 SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit;

select [dbo].[Inpatient_provdr].Provider_City, [dbo].[Inpatient_provdr].Provider_Name, count([dbo].[Inpatient_provdr].Provider_City) as num from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_City, [dbo].[Inpatient_provdr].Provider_Name
order by num desc

select [dbo].[Inpatient_provdr].Provider_City, [dbo].[Inpatient_provdr].Provider_Name, count(*) as num from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_City, [dbo].[Inpatient_provdr].Provider_Name
order by num desc

select [dbo].[Inpatient_provdr].Provider_Name, COUNT(*) from [dbo].[Inpatient_provdr]
group by [dbo].[Inpatient_provdr].Provider_Name
having COUNT(*) > 1 and COUNT(*) < 6

select [dbo].[Outpatient_Pat].Average_Estimated_Submitted_Charges, count(*) s from [dbo].[Outpatient_Pat]
group by [dbo].[Outpatient_Pat].Average_Estimated_Submitted_Charges
having COUNT(*) > 1

select * from [dbo].[Inpatient_provdr]
select distinct [dbo].[Inpatient_provdr].DRG_Definition from [dbo].[Inpatient_provdr]
order by 1

select CURRENT_TIMESTAMP
select GETDATE()
select DATEDIFF(DAY,'1978-07-11',GETDATE())
select DAY('1978-07-11')

select * from [dbo].[IsportTims]

CREATE NONCLUSTERED INDEX IDX_LastName
ON [dbo].[IsportTims] (attack);
EXEC sp_helpindex '[dbo].[IsportTims]'
DROP INDEX [dbo].[IsportTims].IDX_LastName;

CREATE NONCLUSTERED INDEX hindex
ON [dbo].[Outpatient_Pat] (APC);
EXEC sp_helpindex '[dbo].[Outpatient_Pat]'
DROP INDEX [dbo].[IsportTims].hindex;

select(SUBSTRING('email',5,3))

SELECT TABLE_NAME AS ViewName
FROM INFORMATION_SCHEMA.VIEWS;

select * from [dbo].[us_retail_sales]
select [dbo].[us_retail_sales].kind_of_business, COUNT(*) bus from [dbo].[us_retail_sales]
group by [dbo].[us_retail_sales].kind_of_business

SELECT sales_month
,sales
FROM [dbo].[us_retail_sales]
WHERE kind_of_business = 'Automotive parts, acc., and tire stores'

select [dbo].[us_retail_sales].sales_month from [dbo].[us_retail_sales]
select DATEPART(YEAR,[dbo].[us_retail_sales].sales_month) from [dbo].[us_retail_sales]

SELECT DATEPART(YEAR,sales_month) as sales_year 
,sum(sales) as sales
FROM [dbo].[us_retail_sales]
group by sales_month
order by sales_year

SELECT DATEPART(YEAR,sales_month), COUNT(*) as sales_year
FROM [dbo].[us_retail_sales]
group by sales_month

select sales_month as sales_month, sales as sales
from [dbo].[us_retail_sales]
order by 2

select DATEPART(YEAR, sales_month) as sales_year, sales as sales
from [dbo].[us_retail_sales]
order by 1

select DATEPART(YEAR, sales_month) as sales_year, SUM(sales) as sales
from [dbo].[us_retail_sales]
group by sales_month
order by 1

select sales_month as sales_date, COUNT(*) as sales_year_count
from [dbo].[us_retail_sales]
group by sales_month
order by 1

select sales as sales, sales_month, COUNT(*) as sales_count
from [dbo].[us_retail_sales]
group by sales, sales_month
order by sales_month

select DATEPART(YEAR, sales_month) as year, COUNT(*) as year_count
from [dbo].[us_retail_sales]
group by sales_month
order by year

SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY sales_month

SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total' and DATEPART(YEAR,sales_month)=1992
GROUP BY sales_month

--using sub query
select sales_year
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY sales_month) new_column

select sales_year
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total' and DATEPART(YEAR,sales_month)=1992
GROUP BY sales_month) new_column

select sum_sales
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total' and DATEPART(YEAR,sales_month)=1992
GROUP BY sales_month) new_column

select sales_year,SUM(sum_sales) as total_sales_1992
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business = 'Retail and food services sales, total' and DATEPART(YEAR,sales_month)=1992
GROUP BY sales_month) new_column
group by sales_year

SELECT DATEPART(YEAR,sales_month) as sales_year, SUM(sales) as sum_sales
from [dbo].[us_retail_sales]
group by sales_month
order by sales_year

SELECT DATEPART(YEAR,sales_month)
from [dbo].[us_retail_sales]
where DATEPART(YEAR,sales_month) = 1992

SELECT DATEPART(YEAR,sales_month) as sales_year
,kind_of_business
,sales
from [dbo].[us_retail_sales]

--getting the total sales for each year
SELECT DATEPART(YEAR,sales_month) year, sum(sales) as total_sales
from [dbo].[us_retail_sales]
group by DATEPART(YEAR,sales_month)
order by DATEPART(YEAR,sales_month)

SELECT DATEPART(YEAR,sales_month) year, sales as sales
from [dbo].[us_retail_sales]
where DATEPART(YEAR,sales_month)=1992

SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores'

SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Women''s clothing stores'

--getting the year with the sales
select sales_year,sales
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores') as result
where sales_year = 1992

--getting the year with the sales, and getting the total
select sales_year,sum(sales) as sales_in_year_for_mens_clothing
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores') as result
where sales_year = 1992
group by sales_year

select sales_year,sum(sales) as sales_in_year_for_mens_clothing
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores') as result
--where sales_year = 1992
group by sales_year

--getting the total sales per year
select sales_year,sum(sales) as sales_per_year
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores') as result
group by sales_year

select sales_year,sum(sales) as sales_per_year
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Men''s clothing stores') as result
group by sales_year

SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Women''s clothing stores'

select sales_year,sum(sales) as sales_in_year_for_womens_clothing
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business = 'Women''s clothing stores') as result
where sales_year = 1992
group by sales_year

select sales_year,sum(sales) as sales_in_year_for_womens_clothing
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business in ('Women''s clothing stores','Men''s clothing stores')) as result
--where sales_year = 1992
group by sales_year

select sales_year,sum(sales) as sales_in_year_for_womens_clothing
from (
SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales, kind_of_business as kind_of_business
FROM [dbo].[us_retail_sales]
where kind_of_business in ('Men''s clothing stores')) as result
--where sales_year = 1992
group by sales_year

SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end)
FROM [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores')
GROUP BY 1
SELECT 
    DATEPART(YEAR,sales_month) as sales_year,
    kind_of_business
FROM [dbo].[us_retail_sales]
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores');

SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores' 
 then sales 
 end) as mens_sales
FROM [dbo].[us_retail_sales]
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
group by kind_of_business--querying of sales year for men's and women's clothing saleSELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month
--further sub query to output the women's sales in 1992select sales_year, womens_sales from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dwhere sales_year = 1992--querying about the total sales of women's clothes in 1992select sales_year, SUM(womens_sales) as womens_sales_1992 from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dwhere sales_year = 1992group by sales_year--querying about the total sales of men's clothes in 1992select sales_year, SUM(mens_sales) as mens_sales_1992 from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dwhere sales_year = 1992group by sales_year--query about mens cloth sales per yearselect sales_year, SUM(mens_sales) as mens_sales_per_year from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dgroup by sales_year--query about men and women's total sales per yearselect sales_year,SUM(mens_sales) as mens_sales_per_year, SUM(womens_sales) as womens_sales_per_year from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dgroup by sales_yearselect sales_year, SUM(womens_sales) as womens_sales_per_year from(SELECT DATEPART(YEAR,sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' 
 then sales 
 end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores'
 then sales 
 end) as mens_sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')
group by sales_month) as dgroup by sales_yearselect * from [dbo].[us_retail_sales]where kind_of_business in ('Women''s clothing stores','Men''s clothing stores')SELECT DATEPART(YEAR,sales_month) as sales_year, sales as sales
from [dbo].[us_retail_sales]
WHERE kind_of_business in ('Women''s clothing stores','Men''s clothing stores')

select * from [dbo].[us_retail_sales]

use data_vase