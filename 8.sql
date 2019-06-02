USE NikamoozDB;
GO

SELECT
	O.CustomerID,
	COUNT(OD.OrderID)
FROM Orders AS O
JOIN OrderDetails AS OD
ON O.OrderID = OD.OrderID
GROUP BY O.CustomerID,O.OrderID
HAVING COUNT(OD.OrderID) > 5




SELECT 
	O.CustomerID,
	COUNT(O.OrderID)
FROM Orders AS O
WHERE O.OrderID IN
(SELECT 
	OD.OrderID
FROM OrderDetails AS OD
GROUP BY OD.OrderID
HAVING COUNT(OD.OrderID)>5)




SELECT Tmp.*
FROM (SELECT O.CustomerID AS CUSTOMERID,
		COUNT(OD.OrderID) AS CountOrder
	FROM dbo.Orders AS O
	JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
	GROUP BY O.CustomerID,O.OrderID
	HAVING COUNT(OD.OrderID) > 5
) AS Tmp

WITH Order_Year
AS 
(
	SELECT  
		O.OrderDate,
		O.CustomerID
	FROM Orders AS O
	WHERE 1 = 1 
)
SELECT 
	YEAR(OY.OrderDate),
	COUNT(DISTINCT OY.CustomerID)
FROM Order_Year AS OY
GROUP BY YEAR(OY.OrderDate);
GO


WITH Order_Year_Report
AS 
(
	SELECT  
		O.OrderDate,
		O.CustomerID
	FROM Orders AS O
)
SELECT 
	YEAR(OY.OrderDate),
	COUNT(DISTINCT OY.CustomerID),
	COUNT(DISTINCT OY2.CustomerID),
	COUNT(DISTINCT OY2.CustomerID) - COUNT(DISTINCT OY.CustomerID)  
FROM Order_Year_Report AS OY
LEFT JOIN Order_Year_Report AS OY2
ON YEAR(OY.OrderDate) = (YEAR(OY2.OrderDate)+1)
GROUP BY YEAR(OY.OrderDate),YEAR(OY2.OrderDate);
GO






