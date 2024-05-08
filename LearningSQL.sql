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

use data_vase
select * from [dbo].[Family Income and Expenditure]