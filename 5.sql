USE NikamoozDB;
GO



SELECT 
	Customers.CustomerID,
	Customers.ContactName,
	Employees.EmployeeID,
	Employees.FirstName + ' '+Employees.LastName 
FROM Customers
CROSS JOIN Employees


SELECT 
	C.City,
	COUNT(O.OrderID)
FROM Orders AS O
JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
GROUP BY C.City;
GO

SELECT 
	TOP 1
	C.City,
	COUNT(O.OrderID)
FROM Orders AS O
JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
GROUP BY C.City
ORDER BY COUNT(O.OrderID);
GO

SELECT 
	TOP (3)
	P.ProductName,
	SUM(O.Qty)
FROM dbo.OrderDetails AS O
JOIN dbo.Products AS P
ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY SUM(O.Qty) DESC;


SELECT 
C.CustomerID,
C.CompanyName,
O.OrderID,
OD.ProductID,
OD.Qty
FROM Customers AS C
JOIN Orders AS O
ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD
ON OD.OrderID = O.OrderID;






USE NikamoozDB;
GO

SELECT 
	CustomerID,EmployeeID
FROM Orders
WHERE YEAR(OrderDate) = 2015 AND MONTH(OrderDate) = 1
INTERSECT 
SELECT 
	CustomerID,EmployeeID
FROM Orders
WHERE YEAR(OrderDate) = 2015 AND MONTH(OrderDate) = 2;





SELECT 
	CustomerID,EmployeeID
FROM Orders
WHERE YEAR(OrderDate) = 2015 AND MONTH(OrderDate) = 1
INTERSECT 
SELECT 
	CustomerID,EmployeeID
FROM Orders
WHERE YEAR(OrderDate) = 2015 AND MONTH(OrderDate) = 2
EXCEPT
SELECT
	EmployeeID,CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2016 AND MONTH(OrderDate) = 2;





CREATE TABLE UT1  (    ID INT,    CODE INT); 
CREATE TABLE UT2  (    ID INT,    CODE INT  ); 
INSERT INTO UT1   VALUES (2,22),(1,11),(3,33),(100,1000); 
INSERT INTO UT2  VALUES (20,200),(10,100),(30,300);


SELECT
   ID, CODE 
FROM UT1  
UNION ALL 
SELECT 
  ID, CODE  
FROM UT2



