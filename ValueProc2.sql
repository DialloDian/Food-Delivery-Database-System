-- INSERT  a new courier and their verhicle type
SELECT * FROM VehicleType
SELECT * FROM Courier
SELECT * FROM Vehicle
PRINT 'Begin to creat variables'
DECLARE @FirstName VARCHAR(30) = 'Polo'
DECLARE @LastName VARCHAR(30) =  'G'
--DECLARE @VehicleID INT
DECLARE @VehicleDescription VARCHAR(30) = 'Red Dodge Hellcat'
--DECLARE @VehicleTypeID INT
DECLARE @VehicleType VARCHAR(30)= 'Car'
PRINT 'End to create variable'

EXEC VehicleManagement @FirstName, @LastName, @VehicleDescription, @VehicleType
