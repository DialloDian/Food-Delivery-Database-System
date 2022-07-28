--USE FinalProjectDB

INSERT INTO PickupAddressType(AddressType)
VALUES('Business Location1')
SELECT * FROM PickupAddressType

INSERT INTO Restaurant(RestaurantName, RestaurantDesc)
VALUES('Halal Guys', 'NYC best halal food')
SELECT * FROM Restaurant

INSERT INTO PickupAddress(PickupAddressTypeID, RestaurantID, Adress, City, State, Zip)
VALUES(1, 1, '307 E 14 Street', 'New York', 'NY', '10003-4202')
SELECT * FROM PickupAddress

INSERT INTO RestaurantContact(RestaurantID, Phone, Email)
VALUES(1, 3478132222, 'halal@gmail.com')
SELECT * FROM RestaurantContact

INSERT INTO MenuCategory(RestaurantID, MenuCategoryName)
VALUES(1, 'Main Menu')
SELECT * FROM MenuCategory

INSERT INTO Menu(MenuName, MenuDescription, Size, Price, MenuStatus, MenuCategoryID)
VALUES('Sandwiches', 'Chicken/Beef/Gyro', 'Regualar', 9.99, 'Available', 1)
	  ,('Platters', 'Chicken/Beef w Rice', 'Regualar', 10.99, 'Available', 1)
	  ,('Beverages', 'Water Botle', 'Regualar', 2.38, 'Available', 1)
SELECT * FROM Menu

INSERT INTO Availability(AvailabilityDescription)
VALUES('Available'), ('Not Available')
SELECT * FROM Availability

INSERT INTO ItemPhoto(ItemName, ItemPhoto)
VALUES('Chicken Over Rice', ' '),
	('Lamb/beef Over Rice', ' '),
	('Combo (Lamb & beef Over Rice', ' '),
	('Beef Gyro', ' '),
	('Chicken Gyro', ' '),
	('Chicken & Beef Gyro', ' '),
	('Falafel', ' '),
	('Chicken & Falafel', ' '),
	('Beef Gyro & Falafel', ' '),
	('Poland Spring', ' '),
	('Aquafina', ' '),
	('Essentia', ' '),
	('SmartWater', ' '),
	('Fiji', ' ')
SELECT * FROM ItemPhoto

INSERT INTO Item(AvailabilityID, RestaurantID, ItemName, ItemPrice, ItemQuantity, MenuID, ItemPhotoID)  
VALUES(1, 1, 'Chicken Over Rice', 10.99, 100, 2, 1),
	  (1, 1, 'Lamb/beef Over Rice', 10.99, 100, 2, 2),
	  (1, 1, 'Combo (Lamb & beef Over Rice)', 10.99, 100, 2, 3),
	  (1, 1, 'Beef Gyro', 9.99, 200, 1, 4),
	  (1, 1, 'Chicken Gyro', 9.99, 200, 1, 5),
	  (1, 1, 'Chicken & Beef Gyro', 9.99, 200, 1, 6),
	  (1, 1, 'Falafel', 9.99, 80, 1, 7),
	  (1, 1, 'Chicken & Falafel', 9.99, 75, 1, 8),
	  (1, 1, 'Beef Gyro & Falafel', 9.99, 50, 1, 9),
	  (1, 1, 'Poland Spring', 1.00, 300, 3, 10),
	  (2, 1, 'Aquafina', 1.38, 50, 3, 11),
	  (1, 1, 'Essentia', 1.48, 150, 3, 12),
	  (1, 1, 'SmartWater', 2.38, 100, 3, 13),
	  (1, 1, 'Fiji', 5.88, 80, 3, 14)

SELECT * FROM Item

INSERT INTO DeliveryStatus(StatusDescription)
VALUES('Preparing Food'), ('Picked up by Courier'), ('Delivered')
SELECT * FROM DeliveryStatus

INSERT INTO Discount(DiscountName, DiscountPercent)
VALUES('HALAL5', 5), ('HALAL10', 10), ('HALAL15', 15)
SELECT * FROM Discount

INSERT INTO PaymentType(PaymentType)
VALUES('Debit'), ('Credit'), ('Cash'), ('Gift Card')
SELECT * FROM PaymentType

INSERT INTO Payment(PaymentTypeID, Payment)
VALUES(1, Null), (2, Null), (3, Null), (4, Null)
SELECT * FROM Payment

INSERT INTO VehicleType(VehicleType)
VALUES('Car'), ('Bicycle'), ('Walker')
SELECT * FROM VehicleType

INSERT INTO Courier(FirstName, LastName)
VALUES('Dian', 'Diallo'), ('John', 'Doe'),('Elientte', 'Friga'),
	  ('Sophia', 'Smith'), ('Aiden', 'Williams') 
SELECT * FROM Courier

INSERT INTO Vehicle(CourierID, VehicleTypeID, VehicleDescription)
VALUES(1, 1, 'Matte Black BMW'), (2, 2, 'Blue & white electric bike'),
	  (3, 1, 'White Tesla X'), (4, 1, 'Grey Mercedez Benz'), (5, 3, 'N/A')
SELECT * FROM Vehicle

INSERT INTO CourierContactType(TypeOfContanct)
VALUES('Home'),('Cell Phone'), ('Land Line')
SELECT * FROM CourierContactType

INSERT INTO CourierContact(Phone, Email, CourierID,CourierContactTypeID)
VALUES('3476986787', 'mddian123@gmail.com', 1, 2),
	  ('3476987888', 'johndoes@gmail.com', 2, 3),
	  ('6466987777', 'elienttef@gmail.com', 3, 1),
	  ('9175987864', 'sm@gmail.com', 4, 2),
	  ('9175986865', 'aidenw@gmail.com', 5, 2)
SELECT * FROM CourierContact

INSERT INTO CustomerContactType(TypeOfContanct)
VALUES('Home'),('Cell Phone'), ('Land Line')
SELECT * FROM CustomerContactType

INSERT INTO Customer(FirstName, LastName)
VALUES('Elon', 'Musk'), ('LeBron', 'James'),	
	  ('Adam', 'Saleh'), ('Kevin', 'Durant'), 
	  ('Kyrie', 'Irvin'), ('Emma', 'Miller'), 	
	  ('Adam', 'Sal'), ('Olivia', 'Moore'), 
	  ('Ethan', 'Brown'), ('Ethan', 'Taylor')
SELECT * FROM Customer

INSERT INTO CustomerContact(CustomerID, CustomerPhoneNumber, CustomerEmail, CustomerContactTypeID)
VALUES(1, '3478986787', 'elonm@gmail.com', 1),
	  (2, '3475987877', 'jamesl@gmail.com', 2),
	  (3, '6463987766', 'saleha@gmail.com', 3),
	  (4, '9174987865', 'kd@gmail.com', 1),
	  (5, '9175956832', 'irvingk@gmail.com', 2),
	  (6, '3478986757', 'emmam@gmail.com', 3),
	  (7, '3475947877', 'sala@gmail.com', 1),
	  (8, '6463087766', 'oliviam@gmail.com', 2),
	  (9, '9174887865', 'eb@gmail.com', 3),
	  (10, '9174956832', 'ethant@gmail.com', 2)
SELECT * FROM CustomerContact

INSERT INTO AddressType(AddressType)
VALUES('Home'), ('Work'), ('Location')
SELECT * FROM AddressType


INSERT INTO DeliveryAddress(CustomerID, AddressTypeID, Adress, City, State, Zip)
VALUES(1, 1, '3076 E 2 Street', 'New York', 'NY', '10001'),
	  (2, 2, '507 E 8 Street', 'New York', 'NY', '10002'),
	  (3, 3, '365 E 14 Street', 'New York', 'NY', '10003'),
	  (4, 1, '456 E 15 Street', 'New York', 'NY', '10007'),
	  (5, 2, '555 E 18 Street', 'New York', 'NY', '10009'),
	  (6, 3, '444 E 23 Street', 'New York', 'NY', '10010'),
	  (7, 2, '4588 E 42 Street', 'New York', 'NY', '10011'),
	  (8, 1, '345 E 55 Street', 'New York', 'NY', '10014'),
	  (9, 2, '234 E 57 Street', 'New York', 'NY', '10023'),
	  (10, 3, '10 E 75 Street', 'New York', 'NY', '100025')
SELECT * FROM DeliveryAddress


INSERT INTO Orders(CustomerID, DeliveryStatusID, OrderDate, OrderQuantity, ItemID, Amount, DeliveryAddressID, DiscountID, PaymentID)
VALUES(1, 1, '2021-11-20', 2, 1, 21.98, 1, 1, 1),
	  (1, 1, '2021-11-20', 2, 14, 11.76, 1, 1, 1),
	  (2, 2, '2021-11-20', 5, 6, 54.95, 2, 2, 1),
	  (2, 2, '2021-11-20', 5, 14, 29.45, 2, 1, 1),
	  (3, 1, '2021-11-20', 3, 6, 32.92, 3, 2, 1),
	  (3, 1, '2021-11-20', 3, 13, 7.14, 3, 1, 1),
	  (4, 2, '2021-11-21', 1, 5, 10.99, 4, 1, 1),
	  (4, 2, '2021-11-21', 1, 14, 5.88, 4, 1, 1),
	  (5, 1, '2021-11-22', 1, 9, 9.99, 5, 1, 1),
	  (5, 1, '2021-11-22', 1, 14, 5.88, 5, 1, 1),
	  (6, 2, '2021-11-23', 5, 2, 54.95, 6, 1, 1),
	  (6, 2, '2021-11-23', 5, 12, 7.40, 6, 1, 1),
	  (7, 1, '2021-11-24', 1, 3, 10.99, 7, 1, 1),
	  (7, 1, '2021-11-24', 1, 7, 9.99, 7, 1, 1),
	  (7, 1, '2021-11-24', 2, 10, 2.00, 7, 1, 1),
	  (8, 1, '2021-11-25', 2, 8, 19.98, 8, 1, 1),
	  (8, 1, '2021-11-25', 2, 10, 2.00, 8, 1, 1),
	  (9, 1, '2021-11-26', 1, 9, 9.99, 9, 1, 1),
	  (9, 1, '2021-11-26', 1, 12, 2.38, 9, 1, 1),
	  (10, 2, '2021-11-27', 5, 7, 49.95, 10, 2, 1),
	  (10, 2, '2021-11-27', 5, 10, 10.00, 10, 1, 1),
	  (10, 2, '2021-11-27', 2, 8, 19.98, 10, 1, 1),
	  (10, 2, '2021-11-27', 1, 2, 10.99, 10, 1, 1)
SELECT * FROM Orders


INSERT INTO OrderDetail(ItemID, OrderID, OrderDate, Quantity, Amount)
VALUES(1, 1, '2021-11-20', 2, 21.98), (14, 2, '2021-11-20', 2, 11.76),
	  (6, 3, '2021-11-20', 5, 54.95), (14, 4, '2021-11-20', 5, 29.45),
	  (6, 5, '2021-11-20', 3, 32.92), (13, 6, '2021-11-20', 3, 7.14),
	  (5, 7, '2021-11-21', 1, 10.99), (14, 8, '2021-11-21', 1, 5.88),
	  (9, 9, '2021-11-22', 1, 9.99), (14, 10, '2021-11-22', 1, 5.88),
	  (2, 11, '2021-11-23', 5, 54.95), (12, 12, '2021-11-23', 5, 7.40),
	  (3, 13, '2021-11-24', 1, 10.99), (7, 14, '2021-11-24', 1, 9.99),
	  (10, 15, '2021-11-24', 2, 2.00), (8, 16, '2021-11-25', 2, 19.98),
	  (10, 17, '2021-11-25', 2, 2.00), (9, 18, '2021-11-26',1, 9.99),
	  (12, 19, '2021-11-26', 1, 2.38), (7, 20, '2021-11-27', 5, 49.95),
	  (10, 21, '2021-11-27', 5, 10.00), (8, 22, '2021-11-27', 2, 19.98),
	  (2, 23, '2021-11-27', 1, 10.99)
SELECT * FROM OrderDetail


INSERT INTO Delivery(CourierID, CustomerID, ItemID, OrderID, DeliveryAddressID)
VALUES(1, 1, 1, 1, 1), (1, 1, 14, 2, 1),
	  (2, 2, 6, 3, 2), (2, 2, 14, 4, 2),
	  (3, 3, 6, 5, 3), (3, 3, 7, 13, 3), 
	  (4, 4, 5, 7, 4), (4, 4, 14, 7, 4),
	  (5, 5, 9, 9, 5), (5, 5, 14, 10, 5),
	  (1, 6, 2, 11, 6), (1, 6, 12, 12, 6), 
	  (2, 7, 3, 13, 7), (2, 7, 7, 14, 7),
	  (2, 7, 10, 15, 7), (3, 8, 8, 16, 8),
	  (3, 8, 10, 17, 8), (4, 9, 9, 18, 9),
	  (5, 9, 12, 19, 9), (1, 10, 7, 20, 10),
	  (1, 10, 10, 21, 10), (1, 10, 8, 22, 10),
	  (1, 10, 2, 23, 10)
SELECT * FROM Delivery

INSERT INTO RatingType(TypeofRating, RatingDescription)
VALUES('Five Stars', '1/5')
SELECT * FROM RatingType

INSERT INTO RestaurantRating(RatingTypeID, CustomerID, RestaurantID, Score, Comments)
VALUES(1, 1, 1, 5, 'Amazed, will need this in Mars'),
	  (1, 2, 1, 5, 'Best food ever!'),
	  (1, 3, 1, 5, 'Love it!'),
	  (1, 4, 1, 5, 'Highly Recomend it')
SELECT * FROM RestaurantRating

INSERT INTO CouriertRating(RatingTypeID, CourierID, CustomerID, Score, Comments)
VALUES(1, 1, 1, 5, 'Food arived fast & hot'),
	  (1, 2, 2, 4, 'Food arived fast'),
	  (1, 3, 3, 5, 'Followed instructions'),
	  (1, 4, 4, 4, 'Food is hot'),
	  (1, 5, 5, 5, 'Food is well taking care'),
	  (1, 5, 9, 3, 'Okay communication'),
	  (1, 4, 6, 4, 'Food is hot'),
	  (1, 1, 6, 5, 'Fast and well taking care of'),
	  (1, 3, 8, 4, 'Super quick'),
	  (1, 2, 7, 4, 'Super quick'),
	  (1, 1, 10, 5, 'Good communication')
SELECT * FROM  CouriertRating

INSERT INTO TypeOfComment(CommentType)
VALUES('Instruction'), ('Request'),('Feedback')
SELECT * FROM TypeOfComment

INSERT INTO Comment(OrderID, TypeOfCommentID, CustomerID, Comments)
VALUES(1, 1, 1, 'Leave at door'), (2, 2, 2, 'Bring Hote Sauce'),
		(3, 3, 3, 'Chef was great'), (4, 1, 4, 'Meet door')
SELECT * FROM Comment

INSERT INTO TypeOfSupplier(SupplierType)
VALUES('Rice'), ('Chiken & Lamb'), 
		('Drinks'), ('Utensils')
SELECT * FROM TypeOfSupplier

INSERT INTO SupplierContactType(ContactType)
VALUES('Work Phone'), ('Cell Phone'),
		('Home Phone')
SELECT * FROM SupplierContactType

INSERT INTO Supplier(SupplierName, TypeOfSupplierID, ItemID, ItemQuantity)
VALUES('Grandma Rice', 1, 1, 100), ('Halal Chiken & Lamb', 2, 3, 100),
		('Hydra', 3, 14, 80), ('Disposable', 4, 10, 300)
SELECT * FROM Supplier

INSERT INTO SupplierContact(SupplierContact, TypeID, SupplierID )
VALUES('3478986787', 1, 1),
	  ('3475987877', 2, 2),
	  ('6463987766', 3, 3),
	  ('9174987865', 1, 4)
SELECT * FROM SupplierContact

INSERT INTO TypesOfInvoice(InvoiceType)
VALUES('Debit'),('Credit')
SELECT * FROM TypesOfInvoice


INSERT INTO Invoice(SupplierContactID, TypesOfInvoiceID, SupplierID, Amount)
VALUES(1, 1, 1, 850),(2, 1, 2, 575),
		(3, 2, 3, 460),(4, 1, 4, 233)
SELECT * FROM Invoice