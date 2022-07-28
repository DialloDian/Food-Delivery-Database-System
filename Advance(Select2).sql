--Top 3 most Bougth item with a profite over $50
--SELECT * FROM Item
--SELECT * FROM Orders
--SELECT * FROM OrderDetail
IF EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'GetTopThreeItems') 
			AND type in (N'P', N'PC'))
DROP PROCEDURE GetTopThreeItems
GO

CREATE PROC GetTopThreeItems
@OrderQuantity INT = NULL
,@OrderDate DATE = NULL
,@ItemPrice SMALLMONEY = NULL

AS
BEGIN
	IF(@OrderQuantity IS NOT NULL)
	BEGIN
		SELECT TOP 3 od.ItemID, i.ItemName
			,SUM(o.OrderQuantity) AS TotalQuantity
			,SUM(i.ItemPrice * o.OrderQuantity) TotalAmount
		FROM OrderDetail od JOIN Orders o ON od.OrderID = o.OrderID
					 JOIN Item i ON i.ItemID = od.ItemID
		WHERE OrderQuantity = @OrderQuantity
		GROUP BY od.ItemID, i.ItemName
		HAVING (SUM(i.ItemPrice * o.OrderQuantity)) > 50
		ORDER BY TotalQuantity DESC ;
	END
ELSE
BEGIN
	IF(@OrderDate IS NOT NULL)
	BEGIN
		SELECT TOP 3 od.ItemID, i.ItemName
			,SUM(o.OrderQuantity) AS TotalQuantity
			,SUM(i.ItemPrice * o.OrderQuantity) TotalAmount
		FROM OrderDetail od JOIN Orders o ON od.OrderID = o.OrderID
					 JOIN Item i ON i.ItemID = od.ItemID
		WHERE od.OrderDate = @OrderDate
		GROUP BY od.ItemID, i.ItemName
		HAVING (SUM(i.ItemPrice * o.OrderQuantity)) > 50
		ORDER BY TotalQuantity DESC ;
	END
ELSE
BEGIN
	IF(@ItemPrice IS NOT NULL)
	BEGIN
		SELECT TOP 3 od.ItemID, i.ItemName
			,SUM(o.OrderQuantity) AS TotalQuantity
			,SUM(i.ItemPrice * o.OrderQuantity) TotalAmount
		FROM OrderDetail od JOIN Orders o ON od.OrderID = o.OrderID
					 JOIN Item i ON i.ItemID = od.ItemID
		WHERE i.ItemPrice = @ItemPrice
		GROUP BY od.ItemID, i.ItemName
		HAVING (SUM(i.ItemPrice * o.OrderQuantity)) > 50
		ORDER BY TotalQuantity DESC ;
	END
ELSE
BEGIN
		SELECT TOP 3 od.ItemID, i.ItemName
			,SUM(o.OrderQuantity) AS TotalQuantity
			,SUM(i.ItemPrice * o.OrderQuantity) TotalAmount
		FROM OrderDetail od JOIN Orders o ON od.OrderID = o.OrderID
					 JOIN Item i ON i.ItemID = od.ItemID
		GROUP BY od.ItemID, i.ItemName
		HAVING (SUM(i.ItemPrice * o.OrderQuantity)) > 50
		ORDER BY TotalQuantity DESC ;
		END
	END
	END
END



--EXEC GetTopThreeItems @OrderQuantity, @OrderDate, @ItemPrice