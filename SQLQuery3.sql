use mydatabase
--string function 
select 
CONCAT(first_name ,' ', country) as name_country 
from customers

select 
UPPER(first_name) as name
from customers

select 
Lower(first_name) as name
from customers

select 
left(upper(Trim(first_name)),2) as name
from customers

-- identify the space with using where cluase 
select 
first_name
from customers
where first_name != TRIM(First_name)

select 
first_name,
len(first_name) as len_name,
len(trim(first_name)) as len_trim_name,
len(first_name)-len(trim(first_name)) flag
from customers

--replace 
-- old value to new value (used for remove as well) -- file format aslo change using this function .text to .csv
select '1234-234',
replace('1234-234','-','/')

-- calculation (len)
-- how many character count using this len function 
select len('2223')

-- left and right 
select left('1ed3',4)
select right('123',3)

--Substring(value,staart, length) 
-- Retrive a list of customer first name after removing the first character 
select 
first_name,
SUBSTRING(trim(first_name),2,len(first_name)) as sub_name
from customers

-- absloute function 
select 
-10,
abs(-10),
abs(10)

use salesDB
select * from sales.Orders

select 
orderID,
ProductID
from Sales.Orders

























































