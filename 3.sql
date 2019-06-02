use NikamoozDB;
Go 

SELECT 
	CustomerID, City
FROM Customers
WHERE CITY LIKE N'%ا%ا%';
GO


SELECT 
	CustomerID,City
FROM Customers
WHERE PATINDEX(N'%ن%',City) = 1;
GO
 

SELECT 
	CustomerID,City
FROM Customers
WHERE City LIKE N'%ن%'
GO


SELECT 
	CustomerID,CITY 
FROM Customers
WHERE 
	CASE 
		WHEN City LIKE N'%ن%' THEN 1
		ELSE 0 END = 1;
GO







