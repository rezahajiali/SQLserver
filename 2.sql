use NikamoozDB;
Go 

SELECT 
	CustomerID,City,Region
FROM dbo.Customers
WHERE Region = N'مرکز' AND City LIKE N'%ن%';
Go

SELECT 
	CustomerID , [State]
FROM dbo.Customers
WHERE [State] = N'تهران' OR [State] = N'اصفهان';
Go


SELECT 
  OrderID,EmployeeID,CustomerID
FROM Orders
WHERE EmployeeID = 3 AND NOT CustomerId BETWEEN 1 AND 80; 
GO



SELECT 
 EmployeeID,LastName
FROM Employees 
WHERE LastName LIKE N'[^ت]%';
GO



SELECT 
  EmployeeID,LastName
FROM Employees
WHERE LastName NOT LIKE N'ت%';
GO


SELECT 
	EmployeeID,OrderId,OrderDate
FROM Orders
WHERE EmployeeID = 3 AND (OrderDate >= '2015-02-01' AND OrderDate < '2015-03-01');
GO


SELECT 
	CustomerID,CompanyName
FROM Customers 
WHERE CompanyName LIKE N'شرکت IR- [A-C][A D Z]';
GO














CREATE TABLE CheckTable 
 (
 ID INT IDENTITY,
 Code CHAR(3) CONSTRAINT const1 CHECK ( Code LIKE  ('[a-z][a-z][0-9]'))  
 );




 INSERT INTO CheckTable
     VALUES (N'cd1'),(N'cd2'),(N'cd3'); 
    
  
  
  SELECT * FROM CheckTable;  
  GO  


  INSERT INTO CheckTable    
  VALUES (N'as'); 


 
 
 SELECT 
	CustomerID,City
 FROM Customers
 WHERE City Like N'%ا%ا%'
 GO





