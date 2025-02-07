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