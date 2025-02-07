SELECT TOP (1000) [CustomerID]
      ,[CustomerName]
      ,[City]
  FROM [SQL-Project].[dbo].[Customer]


  --Find the names of all customers who have placed at least one order.

  select a.CustomerName, a.CustomerID,  b.OrderID
  from [SQL-Project].[dbo].[Customer] a
  inner join [SQL-Project].[dbo].[Orders] b
  on a.CustomerID = b.CustomerID
  group by a.CustomerID,a.CustomerName,b.OrderID

-- OR Second Method using Exists Clause

select a.CustomerName, a.CustomerID
from  [SQL-Project].[dbo].[Customer] a
where exists(
select 1 from [SQL-Project].[dbo].[Orders] c
where a.CustomerID = c.CustomerID
)

--Find the names of all customers who have ordered the product 'Laptop'.

select a.CustomerName , b.OrderID 
from [SQL-Project].[dbo].[Customer] a
inner join [SQL-Project].[dbo].[Orders] b on a.CustomerID = b.CustomerID
inner join [SQL-Project].[dbo].[OrderItems] c on c.OrderID = b.OrderID
inner join [SQL-Project].[dbo].[Products] d on d.ProductID = c.ProductID
where ProductName = 'Laptop'

--Find the names of all customers in 'New York' who have placed at least one order.

select a.CustomerID , a.CustomerName 
from [SQL-Project].[dbo].[Customer] a
inner join [SQL-Project].[dbo].[Orders] b
on a.CustomerID = b.CustomerID
where City = 'New York'

--with Exists

select a.CustomerID , a.CustomerName 
from [SQL-Project].[dbo].[Customer] a
where a.City= 'New York' and exists
(
select 1 from 
[SQL-Project].[dbo].[Orders] b
where a.CustomerID = b.CustomerID
)
-- adding new columns email id into customer table

alter table [SQL-Project].[dbo].[Customer]
add Emailid Varchar(50)
-- Inserting value into emailid column
update [SQL-Project].[dbo].[Customer]
set Emailid = replace(CustomerName, ' ','') +'@gmail.com'

-- lower case the value of email id columns

update [SQL-Project].[dbo].[Customer]
set Emailid = lower(Emailid)

SELECT *
  FROM [SQL-Project].[dbo].[Customer]

-- Coalesce Clause to fill NULL Values

select* , coalesce(Emailid, 'No Contact Details') as ConactInfo from [SQL-Project].[dbo].[Customer] 

update [SQL-Project].[dbo].[Customer]
set Emailid = 'No Contact Details Available'
where Emailid  IS NULL

SELECT *
  FROM [SQL-Project].[dbo].[Customer]