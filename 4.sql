USE NikamoozDB;
GO

SELECT 
	EmployeeID,
	COUNT(OrderID),
	YEAR(OrderDate),
	SUM(Freight)
FROM Orders
GROUP BY EmployeeID,YEAR(OrderDate);
GO


SELECT 
	CustomerID,
	YEAR(OrderDate),
	COUNT(OrderID) AS NUMBER
FROM Orders
	WHERE CustomerID = 71
GROUP BY CustomerID,YEAR(OrderDate);
GO



use NikamoozDB;
GO

-- 1 
CREATE TABLE Sort_Table  (    ID VARCHAR(100)  );
GO



INSERT INTO Sort_Table    VALUES     ('sa‐1'),    ('sa‐22'),    ('sa‐153'),    ('sa‐44'),    ('sa‐10'),    ('sa‐11');  
GO  

SELECT *
FROM Sort_Table
ORDER BY ID;
GO


-- 2 
SELECT 
	CustomerID
FROM Orders
GROUP BY CustomerID , OrderDate
HAVING COUNT(OrderID)>1

-- 3

SELECT 
	YEAR(OrderDate) as [year],
	COUNT(OrderID) as  num
FROM Orders
WHERE MONTH(OrderDate) > 6
GROUP BY YEAR(OrderDate);
GO






-- 4
CREATE TABLE MultiColumnsTable  (    ID INT,    Typ VARCHAR(1),    Val1 VARCHAR(1),    Val2 VARCHAR(1),    Val3 VARCHAR(1)  );
GO


INSERT INTO MultiColumnsTable    VALUES (1,'T','a','b',''),    (2,'P','a','a','f'),    (3,'T','d','b',''),    (4,'P','g','l',''),    (5,'T','a','g','a'),    (6,'T','z','g','a');  
GO

SELECT 
	Typ,
	CASE Val1
		WHEN 'a' THEN COUNT(Val1)
		ELSE 0
	END + 
	CASE Val2
		WHEN 'a' THEN COUNT(Val2)
		ELSE 0
	END +
	CASE Val3
		WHEN 'a' THEN COUNT(Val3)
		ELSE 0
	END AS NUM
FROM MultiColumnsTable
GROUP BY Typ,Val1,Val2,Val3

