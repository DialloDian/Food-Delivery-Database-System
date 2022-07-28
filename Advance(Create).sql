--------------PickupAddressType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[PickupAddressType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE PickupAddressType
	(
		PickupAddressTypeID INT PRIMARY KEY IDENTITY(1,1)	
		,AddressType VARCHAR(30) NOT NULL
		,Created DATETIME DEFAULT GETDATE()
		,Updated DATETIME DEFAULT GETDATE()
)
	PRINT 'PickupAddressType Table does not exist. Created PickupAddressType table'
END
ELSE
BEGIN
	PRINT 'PickupAddressType Table Exists'
END
--------------PickupAddressType------------------
--------------Restaurant------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Restaurant]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE Restaurant
(
	RestaurantID INT PRIMARY KEY IDENTITY(1,1)
	,RestaurantName VARCHAR(30) NOT NULL
	,RestaurantDesc VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)
	PRINT 'Restaurant Table does not exist. Created Restaurant table'
END
ELSE
BEGIN
	PRINT 'Restaurant Table Exists'
END
--------------Restaurant------------------
--------------PickupAddress------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[PickupAddress]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE PickupAddress
(
	PickupAddressID INT PRIMARY KEY IDENTITY(1,1)
	,PickupAddressTypeID INT FOREIGN KEY REFERENCES PickupAddressType(PickupAddressTypeID)
	,RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID)
	,Adress VARCHAR (30) NOT NULL
	,City VARCHAR(30) NOT NULL
	,State VARCHAR(2) NOT NULL
	,Zip VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'PickupAddress Table does not exist. Created PickupAddress table'
END
ELSE
BEGIN
	PRINT 'PickupAddress Table Exists'
END
--------------PickupAddress------------------
--------------RestaurantContact------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[RestaurantContact]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE RestaurantContact
(	
	RestaurantContactID INT PRIMARY KEY IDENTITY(1,1)
	,RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID)
	,Phone VARCHAR(30) NOT NULL
	,Email VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)
	PRINT 'RestaurantContact Table does not exist. Created RestaurantContact table'
END
ELSE
BEGIN
	PRINT 'RestaurantContact Table Exists'
END
--------------RestaurantContact------------------
--------------MenuCategory------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[MenuCategory]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE MenuCategory
(	
	MenuCategoryID INT PRIMARY KEY IDENTITY(1,1)
	,RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID)
	,MenuCategoryName VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'MenuCategory Table does not exist. Created MenuCategory table'
END
ELSE
BEGIN
	PRINT 'MenuCategory Table Exists'
END
--------------MenuCategory------------------
--------------Menu------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Menu]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE Menu
(	
	MenuID INT PRIMARY KEY IDENTITY(1,1)
	,MenuName VARCHAR(30) NOT NULL
	,MenuDescription VARCHAR(30) NOT NULL
	,Size VARCHAR(30) 
	,Price SMALLMONEY 
	,MenuStatus VARCHAR(30) 
	,MenuCategoryID INT FOREIGN KEY REFERENCES MenuCategory(MenuCategoryID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)


	PRINT 'Menu Table does not exist. Created Menu table'
END
ELSE
BEGIN
	PRINT 'Menu Table Exists'
END
--------------Menu------------------
--------------Availability------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Availability]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

	CREATE TABLE Availability
(	
	AvailabilityID INT PRIMARY KEY IDENTITY(1,1)
	,AvailabilityDescription VARCHAR(30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)


	PRINT 'Availability Table does not exist. Created Availability table'
END
ELSE
BEGIN
	PRINT 'Availability Table Exists'
END
--------------Availability------------------
--------------ItemPhoto------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[ItemPhoto]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE ItemPhoto
(	
	ItemPhotoID INT PRIMARY KEY IDENTITY(1,1)
	,ItemName VARCHAR(30) 
	,ItemPhoto VARCHAR(30)  
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'ItemPhoto Table does not exist. Created ItemPhoto table'
END
ELSE
BEGIN
	PRINT 'ItemPhoto Table Exists'
END
--------------ItemPhoto------------------
--------------Item------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Item]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Item
(	ItemID INT PRIMARY KEY IDENTITY(1,1)
	,AvailabilityID INT FOREIGN KEY REFERENCES Availability(AvailabilityID)
	,RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID)
	,ItemName VARCHAR(30) NOT NULL
	,ItemPrice  SMALLMONEY NOT NULL
	,ItemQuantity INT NOT NULL
	,MenuID INT FOREIGN KEY REFERENCES Menu(MenuID)
	,ItemPhotoID INT FOREIGN KEY REFERENCES ItemPhoto(ItemPhotoID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Item Table does not exist. Created Item table'
END
ELSE
BEGIN
	PRINT 'Item Table Exists'
END
--------------Item------------------
--------------DeliveryStatus------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[DeliveryStatus]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE DeliveryStatus
(	DeliveryStatusID INT PRIMARY KEY IDENTITY(1,1)
	,StatusDescription VARCHAR (30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'DeliveryStatus Table does not exist. Created DeliveryStatus table'
END
ELSE
BEGIN
	PRINT 'DeliveryStatus Table Exists'
END
--------------DeliveryStatus------------------
--------------Discount------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Discount]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Discount
(
	DiscountID INT PRIMARY KEY IDENTITY(1,1)
	,DiscountName VARCHAR(30) 
	,DiscountPercent INT 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Discount Table does not exist. Created Discount table'
END
ELSE
BEGIN
	PRINT 'Discount Table Exists'
END
--------------Discount------------------
--------------PaymentType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[PaymentType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE PaymentType
(
	PaymentTypeID INT PRIMARY KEY IDENTITY(1,1)
	,PaymentType VARCHAR(30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'PaymentType Table does not exist. Created PaymentType table'
END
ELSE
BEGIN
	PRINT 'PaymentType Table Exists'
END
--------------PaymentType------------------
--------------Payment------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Payment]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Payment
(
	PaymentID INT PRIMARY KEY IDENTITY(1,1)
	,PaymentTypeID INT FOREIGN KEY REFERENCES PaymentType(PaymentTypeID)
	,Payment DECIMAL 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Payment Table does not exist. Created Payment table'
END
ELSE
BEGIN
	PRINT 'Payment Table Exists'
END
--------------Payment------------------
--------------VehicleType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[VehicleType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE VehicleType
(	
	VehicleTypeID INT PRIMARY KEY IDENTITY(1,1)
	,VehicleType VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'VehicleType Table does not exist. Created VehicleType table'
END
ELSE
BEGIN
	PRINT 'VehicleType Table Exists'
END
--------------VehicleType------------------
--------------Courier------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Courier]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Courier 
(	
	CourierID INT PRIMARY KEY IDENTITY(1,1)
	,FirstName VARCHAR(30) NOT NULL
	,LastName VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Courier Table does not exist. Created Courier table'
END
ELSE
BEGIN
	PRINT 'Courier Table Exists'
END
--------------Courier------------------
--------------Vehicle------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Vehicle]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Vehicle
(	
	VehicleID INT PRIMARY KEY IDENTITY(1,1)
	,CourierID INT FOREIGN KEY REFERENCES Courier(CourierID)
	,VehicleTypeID INT FOREIGN KEY REFERENCES VehicleType(VehicleTypeID)
	,VehicleDescription VARCHAR(30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)
	PRINT 'Vehicle Table does not exist. Created Vehicle table'
END
ELSE
BEGIN
	PRINT 'Vehicle Table Exists'
END
--------------Vehicle------------------
--------------CourierContactType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CourierContactType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CourierContactType
(
	CourierContactTypeID INT PRIMARY KEY IDENTITY(1,1)
	,TypeOfContanct  VARCHAR(30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'CourierContactType Table does not exist. Created CourierContactType table'
END
ELSE
BEGIN
	PRINT 'CourierContactType Table Exists'
END
--------------CourierContactType------------------
--------------CourierContact------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CourierContact]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CourierContact
(	
	CourierContactID INT PRIMARY KEY IDENTITY(1,1)
	,Phone CHAR(10) NOT NULL
	,Email VARCHAR(30) 
	,CourierID INT FOREIGN KEY REFERENCES Courier(CourierID)
	,CourierContactTypeID INT FOREIGN KEY REFERENCES CourierContactType(CourierContactTypeID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
) 

	PRINT 'CourierContact Table does not exist. Created CourierContact table'
END
ELSE
BEGIN
	PRINT 'CourierContact Table Exists'
END
--------------CourierContact------------------
--------------CustomerContactType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CustomerContactType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CustomerContactType
(
	CustomerContactTypeID INT PRIMARY KEY IDENTITY(1,1)
	,TypeOfContanct  VARCHAR(30) 
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'CustomerContactType Table does not exist. Created CustomerContactType table'
END
ELSE
BEGIN
	PRINT 'CustomerContactType Table Exists'
END
--------------CustomerContactType------------------
--------------Customer------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Customer]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Customer 
(
	CustomerID INT PRIMARY KEY IDENTITY(1,1)
	,FirstName VARCHAR(30) NOT NULL
	,LastName VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)
	PRINT 'Customer Table does not exist. Created Customer table'
END
ELSE
BEGIN
	PRINT 'Customer Table Exists'
END
--------------Customer------------------
--------------CustomerContact------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CustomerContact]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CustomerContact
(
	CustomerContactID INT PRIMARY KEY IDENTITY(1,1)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,CustomerPhoneNumber CHAR(10) NOT NULL
	,CustomerEmail VARCHAR(30) NOT NULL
	,CustomerContactTypeID INT FOREIGN KEY REFERENCES CustomerContactType(CustomerContactTypeID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
	
)
	PRINT 'CustomerContact Table does not exist. Created CustomerContact table'
END
ELSE
BEGIN
	PRINT 'CustomerContact Table Exists'
END
--------------CustomerContact------------------
--------------AddressType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[AddressType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE AddressType
(	AddressTypeID INT PRIMARY KEY IDENTITY(1,1)	
	,AddressType VARCHAR(30) NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'AddressType Table does not exist. Created AddressType table'
END
ELSE
BEGIN
	PRINT 'AddressType Table Exists'
END
--------------AddressType------------------
--------------DeliveryAddress------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[DeliveryAddress]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE DeliveryAddress
(
	DeliveryAddressID INT PRIMARY KEY IDENTITY(1,1)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,AddressTypeID INT FOREIGN KEY REFERENCES AddressType(AddressTypeID)
	,Adress VARCHAR (30) NOT NULL
	,City VARCHAR(30) NOT NULL
	,State VARCHAR(2) NOT NULL
	,Zip INT NOT NULL
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'DeliveryAddress Table does not exist. Created DeliveryAddress table'
END
ELSE
BEGIN
	PRINT 'DeliveryAddress Table Exists'
END
--------------DeliveryAddress------------------
--------------Orders------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Orders]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Orders
(
	OrderID INT PRIMARY KEY IDENTITY(1,1)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,DeliveryStatusID INT FOREIGN KEY REFERENCES DeliveryStatus(DeliveryStatusID)
	,OrderDate DATE NOT NULL
	,OrderQuantity INT NOT NULL
	,ItemID INT FOREIGN KEY REFERENCES Item(ItemID)
	,Amount SMALLMONEY
	,DeliveryAddressID INT FOREIGN KEY REFERENCES DeliveryAddress(DeliveryAddressID)
	,DiscountID INT FOREIGN KEY REFERENCES Discount(DiscountID)
	,PaymentID INT FOREIGN KEY REFERENCES Payment(PaymentID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Orders Table does not exist. Created Orders table'
END
ELSE
BEGIN
	PRINT 'Orders Table Exists'
END
--------------Orders------------------
--------------OrderDetail------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[OrderDetail]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE OrderDetail
(	
	OrderDetailID INT PRIMARY KEY IDENTITY(1,1)
	,ItemID INT FOREIGN KEY REFERENCES Item(ItemID)
	,OrderID INT FOREIGN KEY REFERENCES Orders(OrderID)
	,OrderDate DATETIME DEFAULT GETDATE()
	,Quantity INT
	,Amount SMALLMONEY
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'OrderDetail Table does not exist. Created OrderDetail table'
END
ELSE
BEGIN
	PRINT 'OrderDetail Table Exists'
END
--------------OrderDetail------------------
--------------Delivery------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Delivery]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Delivery
(
	DeliveryID INT PRIMARY KEY IDENTITY(1,1)
	,CourierID INT FOREIGN KEY REFERENCES Courier(CourierID)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,ItemID INT FOREIGN KEY REFERENCES Item(ItemID)
	,OrderID INT FOREIGN KEY REFERENCES Orders(OrderID)
	,DeliveryAddressID INT FOREIGN KEY REFERENCES DeliveryAddress(DeliveryAddressID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'Delivery Table does not exist. Created Delivery table'
END
ELSE
BEGIN
	PRINT 'Delivery Table Exists'
END
--------------Delivery------------------
--------------RatingType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[RatingType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE RatingType
(
	RatingTypeID INT PRIMARY KEY IDENTITY(1,1)
	,TypeofRating VARCHAR(30)
	,RatingDescription VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()
)

	PRINT 'RatingType Table does not exist. Created RatingType table'
END
ELSE
BEGIN
	PRINT 'RatingType Table Exists'
END
--------------RatingType------------------
--------------RestaurantRating------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[RestaurantRating]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE RestaurantRating
(
	RestaurantRatingID INT PRIMARY KEY IDENTITY(1,1)
	,RatingTypeID INT FOREIGN KEY REFERENCES RatingType(RatingTypeID)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,RestaurantID INT FOREIGN KEY REFERENCES Restaurant(RestaurantID)
	,Score INT
	,Comments VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'RestaurantRating Table does not exist. Created RestaurantRating table'
END
ELSE
BEGIN
	PRINT 'RestaurantRating Table Exists'
END
--------------RestaurantRating------------------
--------------CouriertRating------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CouriertRating]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CouriertRating
(
	CouriertRatingID INT PRIMARY KEY IDENTITY(1,1)
	,RatingTypeID INT FOREIGN KEY REFERENCES RatingType(RatingTypeID)
	,CourierID INT FOREIGN KEY REFERENCES Courier(CourierID)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,Score INT
	,Comments VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'CouriertRating Table does not exist. Created CouriertRating table'
END
ELSE
BEGIN
	PRINT 'CouriertRating Table Exists'
END
--------------CouriertRating------------------
--------------TypeOfComment------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[TypeOfComment]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE TypeOfComment
(
	TypeOfCommentID INT PRIMARY KEY IDENTITY(1,1)
	,CommentType VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'TypeOfComment Table does not exist. Created TypeOfComment table'
END
ELSE
BEGIN
	PRINT 'TypeOfComment Table Exists'
END
--------------TypeOfComment------------------
--------------Comment------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Comment]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Comment
(
	CommetID INT PRIMARY KEY IDENTITY(1,1)
	,OrderID INT FOREIGN KEY REFERENCES Orders(OrderID)
	,TypeOfCommentID INT FOREIGN KEY REFERENCES TypeOfComment(TypeOfCommentID)
	,CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	,Comments VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'Comment Table does not exist. Created Comment table'
END
ELSE
BEGIN
	PRINT 'Comment Table Exists'
END
--------------Comment------------------
--------------TypeOfSupplier------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[TypeOfSupplier]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE TypeOfSupplier
(
	TypeOfSupplierID INT PRIMARY KEY IDENTITY(1,1)
	,SupplierType VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'TypeOfSupplier Table does not exist. Created TypeOfSupplier table'
END
ELSE
BEGIN
	PRINT 'TypeOfSupplier Table Exists'
END
--------------TypeOfSupplier------------------
--------------SupplierContactType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[SupplierContactType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE SupplierContactType
(
	TypeID INT PRIMARY KEY IDENTITY(1,1)
	,ContactType VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'SupplierContactType Table does not exist. Created SupplierContactType table'
END
ELSE
BEGIN
	PRINT 'SupplierContactType Table Exists'
END
--------------SupplierContactType------------------
--------------Supplier------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Supplier]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Supplier
(
	SupplierID INT PRIMARY KEY IDENTITY(1,1)
	,SupplierName VARCHAR(30)
	,TypeOfSupplierID INT FOREIGN KEY REFERENCES TypeOfSupplier(TypeOfSupplierID)
	,ItemID INT FOREIGN KEY REFERENCES Item(ItemID)
	,ItemQuantity INT
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'Supplier Table does not exist. Created Supplier table'
END
ELSE
BEGIN
	PRINT 'Supplier Table Exists'
END
--------------Supplier------------------
--------------SupplierContact------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[SupplierContact]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE SupplierContact
(
	SupplierContactID INT PRIMARY KEY IDENTITY(1,1)
	,SupplierContact VARCHAR(30)
	,TypeID INT FOREIGN KEY REFERENCES SupplierContactType(TypeID)
	,SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'SupplierContact Table does not exist. Created SupplierContact table'
END
ELSE
BEGIN
	PRINT 'SupplierContact Table Exists'
END
--------------SupplierContact------------------
--------------TypesOfInvoice------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[TypesOfInvoice]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE TypesOfInvoice
(
	TypesOfInvoiceID INT PRIMARY KEY IDENTITY(1,1)
	,InvoiceType VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'TypesOfInvoice Table does not exist. Created TypesOfInvoice table'
END
ELSE
BEGIN
	PRINT 'TypesOfInvoice Table Exists'
END
--------------TypesOfInvoice------------------
--------------Invoice------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Invoice]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Invoice
(
	InvoiceID INT PRIMARY KEY IDENTITY(1,1)
	,SupplierContactID INT FOREIGN KEY REFERENCES SupplierContact(SupplierContactID) 
	,TypesOfInvoiceID INT FOREIGN KEY REFERENCES TypesOfInvoice(TypesOfInvoiceID)
	,SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID)
	,Amount SMALLMONEY
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'Invoice Table does not exist. Created Invoice table'
END
ELSE
BEGIN
	PRINT 'Invoice Table Exists'
END
--------------Invoice------------------
--------------Charity------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[Charity]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE Charity
(
	CharityID INT PRIMARY KEY IDENTITY(1,1)
	,CharityName VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'Charity Table does not exist. Created Charity table'
END
ELSE
BEGIN
	PRINT 'Charity Table Exists'
END
--------------Charity------------------
--------------CharityContactType------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CharityContactType]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CharityContactType
(
	TypeID INT PRIMARY KEY IDENTITY(1,1)
	,ContactType VARCHAR(30)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'CharityContactType Table does not exist. Created CharityContactType table'
END
ELSE
BEGIN
	PRINT 'CharityContactType Table Exists'
END
--------------CharityContactType------------------
--------------CharityContact------------------
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects
				WHERE 
				id=OBJECT_ID(N'[dbo].[CharityContact]')
				AND		
				OBJECTPROPERTY(id,N'IsUserTable')=1
				) 
BEGIN

CREATE TABLE CharityContact
(
	CharityContactID INT PRIMARY KEY IDENTITY(1,1)
	,CharityContact VARCHAR(30)
	,TypeID INT FOREIGN KEY REFERENCES CharityContactType(TypeID)
	,CharityID INT FOREIGN KEY REFERENCES Charity(CharityID)
	,Created DATETIME DEFAULT GETDATE()
	,Updated DATETIME DEFAULT GETDATE()

)

	PRINT 'CharityContact Table does not exist. Created CharityContact table'
END
ELSE
BEGIN
	PRINT 'CharityContact Table Exists'
END
--------------CharityContact------------------