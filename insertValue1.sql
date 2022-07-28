DECLARE @FirstName VARCHAR(30) = 'Artist'
DECLARE @LastName VARCHAR(30) = 'Dubose'
DECLARE @ItemName VARCHAR(30) = 'Fiji'
DECLARE @OrderQuantity INT = 3
DECLARE @OrderDate DATE = '2022-05-05'
--DECLARE @CustomerID INT
--DECLARE @ItemID INT

EXEC OrderManagement @FirstName, @LastName, @ItemName, @OrderQuantity, @OrderDate --@CustomerID, @ItemID, @OderID

SELECT * FROM Customer
SELECT * FROM Item
SELECT * FROM Orders



