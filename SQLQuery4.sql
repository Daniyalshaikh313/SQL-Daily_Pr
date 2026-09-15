use SalesDB

select 
orderid,
creationTime,
'2025-08-20' hardcoded,
GETDATE() Today
from Sales.Orders

-- Extract the part of the date 
--part extraction : 2025, 08, 20
-- Format : 08/20/25 , 20 aug 2025 
-- Calculation : add , different finding of two date 

-- part extraction 
select 
creationTime,
year(creationTime) year,
Day(creationTime) day,
MONTH(creationTime) month 
from sales.Orders

-- date part 
-- extraction of datepart function to week and quarter in the given table date (all date is int important point) 
select 
creationTime,
year(creationTime) year,
Day(creationTime) day,
MONTH(creationTime) month,
datepart(WEEK, creationTime)
from sales.Orders

-- Datename (store value in string and datepart store the value in int) 
-- month name ? aug 
select 
creationTime,
year(creationTime) year,
Day(creationTime) day,
MONTH(creationTime) month,
datepart(WEEK, creationTime),
datename(weekday,creationTime)
from sales.Orders

-- datetrunc 
-- extraction of date any specific part 
select 
datetrunc(MINUTE,creationTime),
datetrunc(day,creationTime),
datetrunc(year,creationTime)
from sales.Orders

-- find out the how many month are in this order table 
select 
DATETRUNC(month,creationTime) creation,
count(*)
from sales.Orders
group by DATETRUNC(month,creationtime)

--eomonth() last  day of month
select
eomonth(creationTime)
from sales.Orders

-- how many order were place each year?
select 
year(creationtime) year,
count(*)
from sales.Orders
group by year(creationtime)

-- show all orders that were placed during the month of feb
select *,
datename(month,creationtime) month
from sales.Orders
where month(creationtime) =2

select * from sales.Orders
where month(orderdate) = 2

-- formating and casting 
-- format( value , format, [culture])

SELECT
OrderiD,
CreationTime,
FORMAT (CreationTime,'MM-dd-yyyy') USA_Format,
FORMAT (CreationTime,'dd-MM-yyyy') EURO_Format
from sales.Orders

-- show creation using the following format :
-- Day Wed Jan Q1 2025 12:34:56 PM 
select 
'Day ' + FORMAT(creationtime,'ddd') +' ' +  FORMAT(creationtime,'MMM') + ' ' + 'Q'+DATEname(quarter, creationtime) + ' ' + format(creationtime,'yyyy hh:mm:ss')
from sales.Orders


-- 
select 
format(orderdate , 'MMM yy'),
count(*)
from sales.Orders
group by format(orderdate,'MMM yy')

-- Time Gap analysis 
-- find the number of days between each order and the previous order 
select 
orderid,
orderdate currentdate,
lag(orderdate) over(order by orderdate) previousordersdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate) 
from sales.Orders








































