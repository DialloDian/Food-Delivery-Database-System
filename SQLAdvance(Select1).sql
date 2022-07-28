-- By Costomer how much the total amount spent per item on the month of November was that is greater than $20?
--SELECT * FROM Customer
--SELECT * FROM Item
--SELECT * FROM Orders
--SELECT * FROM OrderDetail
IF EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'GetNovemberSales') 
			AND type in (N'P', N'PC'))
DROP PROCEDURE GetNovemberSales
GO

CREATE PROC GetNovemberSales 
@OrderQuantity INT = NULL
,@OrderDate DATE = NULL
,@Amount SMALLMONEY = NULL

AS
BEGIN
IF(@OrderQuantity IS NOT NULL)
BEGIN
	SELECT c.FirstName , c.LastName, i.ItemName
	,SUM (od.Quantity * i.ItemPrice) AS TotalPrice
	FROM Customer c INNER JOIN Orders o ON c.CustomerID  = o.CustomerID
					INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
					INNER JOIN Item i ON i.ItemID = od.ItemID
	WHERE @OrderQuantity = OrderQuantity
	GROUP BY c.FirstName, c.LastName, ItemName
	HAVING (SUM(od.Quantity * i.ItemPrice)) > 20
	ORDER BY TotalPrice
END
ELSE
BEGIN
	IF(@OrderDate IS NOT NULL)
	BEGIN
		SELECT c.FirstName, c.LastName, i.ItemName
		,SUM (od.Quantity * i.ItemPrice) AS TotalPrice
		FROM Customer c INNER JOIN Orders o ON c.CustomerID  = o.CustomerID
					INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
					INNER JOIN Item i ON i.ItemID = od.ItemID
		WHERE o.OrderDate = @OrderDate
		GROUP BY c.FirstName, c.LastName, ItemName
		HAVING (SUM(od.Quantity * i.ItemPrice)) > 20
		ORDER BY TotalPrice
	END
	ELSE
	BEGIN
	IF(@Amount IS NOT NULL)
	BEGIN
		SELECT c.FirstName, c.LastName, i.ItemName
		,SUM (od.Quantity * i.ItemPrice) AS TotalPrice
		FROM Customer c INNER JOIN Orders o ON c.CustomerID  = o.CustomerID
					INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
					INNER JOIN Item i ON i.ItemID = od.ItemID
		WHERE o.Amount = @Amount
		GROUP BY c.FirstName, c.LastName, ItemName
		HAVING (SUM(od.Quantity * i.ItemPrice)) > 20
		ORDER BY TotalPrice
	END
	ELSE
	BEGIN
		SELECT c.FirstName, c.LastName, i.ItemName
		,SUM (od.Quantity * i.ItemPrice) AS TotalPrice
		FROM Customer c INNER JOIN Orders o ON c.CustomerID  = o.CustomerID
					INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
					INNER JOIN Item i ON i.ItemID = od.ItemID
		WHERE o.OrderDate BETWEEN '2021-11-1' AND '2021-11-30'
		GROUP BY c.FirstName, c.LastName, ItemName
		HAVING (SUM(od.Quantity * i.ItemPrice)) > 20
		ORDER BY TotalPrice
		END

		END
	END 
END
--EXEC GetNovemberSales @OrderQuantity, @OrderDate, @Amount