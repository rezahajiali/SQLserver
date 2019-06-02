USE NikamoozDB
GO

SELECT 
	EmployeeID,
	COUNT(OrderID) AS NUM,
	(SELECT MAX(OrderDate) FROM Orders) AS MAXDATE,
	(SELECT MIN(OrderDate) FROM Orders) AS MINDATE
FROM dbo.Orders
GROUP BY EmployeeID


SELECT 
	OrderID
FROM dbo.Orders
WHERE EmployeeID = (SELECT EmployeeID FROM Employees WHERE LastName LIKE N'Å%')


SELECT 
	CustomerID
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders WHERE OrderDate = '2015/02/02') 


SELECT 
	CustomerID,CompanyName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders WHERE OrderID%2 = 0);