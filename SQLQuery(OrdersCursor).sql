CREATE PROC ConvertData
AS
BEGIN

	
	DECLARE @FirstName VARCHAR(30)
			,@LastName VARCHAR(30) 
			,@ItemName VARCHAR(30) 
			,@OrderQuantity INT 
			,@OrderDate DATE

	DECLARE @IntCount INT = 0
	DECLARE @CustomerID INT
	DECLARE @ItemID INT
	DECLARE @OrderID INT

	DECLARE @ErrorCode INT = 0


DECLARE OrdersCursor CURSOR FOR 
SELECT CustomerID
		,OrderDate
		,OrderQuantity
		,ItemID
		,Amount
	FROM Orders

	OPEN OrdersCursor
	
	FETCH NEXT FROM OrdersCursor
	INTO @FirstName 
		,@LastName 
		,@ItemName
		,@OrderQuantity 
		,@OrderDate

	
	WHILE @@FETCH_STATUS = 0  
		BEGIN 
			PRINT @IntCount
			SET @IntCount = @IntCount + 1
			PRINT @FirstName 
			PRINT @LastName 
			PRINT @ItemName
			PRINT @OrderQuantity 
			PRINT @OrderDate
			


			FETCH NEXT FROM OrdersCursor 
			INTO @FirstName 
			,@LastName 
			,@ItemName
			,@OrderQuantity 
			,@OrderDate
		END

	CLOSE OrdersCursor
	DEALLOCATE OrdersCursor
END

