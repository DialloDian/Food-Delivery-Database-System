-- Insert a new customer and make them order a new item.

IF EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'OrderManagement') 
			AND type in (N'P', N'PC'))
DROP PROCEDURE OrderManagement
GO

CREATE PROC OrderManagement
@FirstName VARCHAR(30)
,@LastName VARCHAR(30) 
,@ItemName VARCHAR(30) 
,@OrderQuantity INT 
,@OrderDate DATE

AS
BEGIN

DECLARE @CustomerID INT
DECLARE @ItemID INT
DECLARE @OrderID INT

--------------------------------------------Start Customer
IF NOT EXISTS(SELECT * FROM Customer WHERE FirstName = @FirstName 
											AND LastName = @LastName)
	BEGIN 
		INSERT INTO Customer(FirstName, LastName)
		VALUES (@FirstName, @LastName)
	END 
SET @CustomerID = (SELECT CustomerID FROM Customer
						WHERE FirstName = @FirstName AND LastName = @LastName)
PRINT '@CustomerID'
PRINT @CustomerID
--------------------------------------------Start Item
IF NOT EXISTS(SELECT * FROM Item WHERE ItemName = @ItemName)
	BEGIN 
		INSERT INTO Item(ItemName)
		VALUES (@ItemName)
	END 
SET @ItemID = (SELECT ItemID FROM Item 
					WHERE ItemName = @ItemName)
PRINT '@ItemID'
PRINT @ItemID
--------------------------------------------Start Order
IF NOT EXISTS(SELECT * FROM Orders WHERE OrderQuantity = @OrderQuantity
													AND OrderDate = @OrderDate)
	BEGIN  
		INSERT INTO Orders(OrderQuantity, OrderDate)
		VALUES (@OrderQuantity, @OrderDate)
	END 
ELSE 
	BEGIN
		SET @OrderID = (SELECT OrderID FROM Orders 
						WHERE OrderQuantity = @OrderQuantity AND OrderDate = @OrderDate)
		BEGIN
		INSERT INTO Orders(OrderID, CustomerID, ItemID)
		VALUES (@OrderID, @CustomerID, @ItemID)
	END
END


END

SELECT c.FirstName
		,c.LastName
		,i.ItemName
		,o.OrderQuantity
		,o.OrderDate

FROM Orders o
	INNER JOIN Customer c ON o.CustomerID = c.CustomerID
	INNER JOIN Item i ON o.ItemID = i.ItemID
WHERE OrderID = @OrderID
	--AND CustomerID = @CustomerID
	--AND ItemID = @ItemID






SELECT * FROM Orders

--EXEC OrderManagement @CustomerID