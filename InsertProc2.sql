-- INSERT  a new courier and their verhicle type
IF EXISTS (SELECT * FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'VehicleManagement') 
			AND type in (N'P', N'PC'))
DROP PROCEDURE VehicleManagement
GO

CREATE PROC VehicleManagement
@FirstName VARCHAR(30)
,@LastName VARCHAR(30)
--,@VehicleID INT
,@VehicleDescription VARCHAR(30)
--,@VehicleTypeID INT
,@VehicleType VARCHAR(30)
--@FirstName, @LastName, @ItemName, @VehicleDescription, @VehicleType

AS
BEGIN

DECLARE @VehicleID INT
DECLARE @VehicleTypeID INT
DECLARE @CourierID INT 
--------------------------------------------Start VehicleType
IF NOT EXISTS(SELECT * FROM VehicleType WHERE VehicleType = @VehicleType)
	BEGIN 
		INSERT INTO Customer(FirstName, LastName)
		VALUES (@FirstName, @LastName)
	END 
SET @VehicleTypeID = (SELECT VehicleTypeID FROM VehicleType WHERE VehicleType = @VehicleType)
PRINT '@VehicleTypeID'
PRINT @VehicleTypeID
--------------------------------------------Start Courier
IF NOT EXISTS(SELECT * FROM Courier WHERE FirstName = @FirstName 
											AND LastName = @LastName)
	BEGIN 
		INSERT INTO Customer(FirstName, LastName)
		VALUES (@FirstName, @LastName)
	END 
SET @CourierID = (SELECT CourierID FROM Courier WHERE FirstName = @FirstName AND LastName = @LastName)
PRINT '@CourierID'
PRINT @CourierID
--------------------------------------------Start Vehicle
IF NOT EXISTS(SELECT * FROM Vehicle WHERE VehicleDescription = @VehicleDescription)
	BEGIN 
		INSERT INTO Vehicle(CourierID, VehicleTypeID, VehicleDescription)
		VALUES (@CourierID, @VehicleTypeID, @VehicleDescription)
	END 
SET @VehicleID = (SELECT VehicleID FROM Vehicle WHERE VehicleDescription = @VehicleDescription)
PRINT '@VehicleID'
PRINT @VehicleID
END

SELECT c.FirstName
		,c.LastName
		,v.VehicleDescription
		,vt.VehicleType

FROM Vehicle v
	INNER JOIN Courier c ON v.VehicleID = c.CourierID
	INNER JOIN VehicleType vt ON v.VehicleTypeID = vt.VehicleTypeID
WHERE VehicleID = VehicleID
	--AND CourierID = @CourierID
	--AND VehicleTypeID = @VehicleTypeID

