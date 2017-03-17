CREATE DATABASE ColourPop;
GO

USE ColourPop;
GO

-- Create the customer and order tables
  CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  PaymentID bigint NOT NULL,
  ShippingAddressID bigint NOT NULL);

  Alter Table Customer 
  Alter Column ShippingAddressID 
  bigint NULL;


CREATE TABLE Payment(
  PaymentID bigint NOT NULL PRIMARY KEY,
  CardType varchar(50) NOT NULL,
  CardNumber bigint NOT NULL,
  ExpirationMonth int NOT NULL,
  ExpirationYear int NOT NULL);

  CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  ProductType varchar(50) NOT NULL,
  Color varchar(50) NOT NULL,
  Collection varchar(50) NOT NULL,
  UnitPrice bigint NOT NULL);

CREATE TABLE ShippingAddress(
  ShippingAddressID bigint NOT NULL PRIMARY KEY,
  AddressLine1 varchar(50) NOT NULL,
  AddressLine2 varchar(50) NOT NULL,
  City varchar(50) NOT NULL, 
  State varchar(50) NOT NULL, 
  PostalCode int NOT NULL,
  Country varchar(50) NOT NULL);

  Alter Table ShippingAddress
  Alter Column AddressLine1
  varchar(50) NULL;


CREATE TABLE [Order](
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  ProductID bigint NOT NULL,
  ShippingAddressID bigint NOT NULL,
  PaymentID bigint NOT NULL,
  TrackingNumber bigint NOT NULL,
  TotalAmount int NOT NULL,
  OrderDate DATE NOT NULL); 
  
  Alter Table [Order]
  Alter Column TrackingNumber
  bigint NULL;   

  Update Product
SET ProductName='Amorosa', ProductType='Lipgloss', Color='Pink', Collection='Brights', UnitPrice='10' 
Where ProductID=10;
-- Create the relationship: the first FK in CourseEnrollment
ALTER TABLE Customer ADD CONSTRAINT FK_PaymentID_Payment 
FOREIGN KEY (PaymentId) REFERENCES Payment(PaymentID);
GO

Alter Table Customer ADD CONSTRAINT FK_ShippingAddressID_ShippingAddress
Foreign Key (ShippingAddressID) References ShippingAddress(ShippingAddressID);
GO

Alter Table [Order] ADD Constraint FK_CustomerID_Customer
Foreign Key (CustomerID) References Customer(CustomerID);
GO

Alter Table [Order] ADD Constraint FK_ProductID_Product
Foreign Key (ProductID) References Product(ProductID);
GO 


INSERT INTO ShippingAddress(ShippingAddressID, AddressLine1, AddressLine2, City, State, PostalCode, Country) VALUES
('1', '113 Millburn Street', '-', 'Lake Hopatcong', 'NJ', '17849', 'USA'),
('2', '32 Main Street', '-', 'Oakland', 'CA', '94577', 'USA'),
('3', '403 Great Plain Ave', '-', 'Newton', 'MA', '12456', 'USA'),
('4', 'Second Ave', '-', 'Worcester', 'MA', '11601', 'USA'),
('5', 'Apartment 4B', 'Westminster Street', 'Cleveland', 'OH', '44101', 'USA'),
('6', 'Hunter Drive', '-', 'Albany', 'NY', '12084', 'USA'),
('7', 'Goose Street', '-', 'Atlanta', 'GA', '30301', 'USA'),
('8', 'Park Street', '-', 'Savannah', 'GA', '31302', 'USA'),
('9', 'Forest Ave', '-', 'White Plains', 'NY', '10601', 'USA'),
('10', 'Fox Street', '-', 'Boulder', 'CO', '80301', 'USA'),
('11', '45 Stella Lane', '-', 'Cleveland', 'OH', '44101', 'USA'),
('12', '703 Fellswood Ave', '-', 'Phoenix', 'AZ', '85001', 'USA');
GO

Update ShippingAddress
SET AddressLine1='NULL'
Where ShippingAddressID=12;


Update Product
SET ProductName='Amorosa', ProductType='Lipgloss', Color='Pink', Collection='Brights', UnitPrice='10' 
Where ProductID=10;


INSERT INTO Product(ProductID,ProductName, ProductType, Color, Collection, UnitPrice) VALUES 
('1', 'Ruby','Lipgloss', 'Red', 'Karreuche', '12'),
('2', 'Passion','Matte', 'Orange', 'Karreuche', '11'),
('3', 'Vixen','Lipgloss', 'Burgundy', 'Karreuche', '15'),
('4', 'Sheer', 'Lip Crayon', 'Tan', 'Nude', '10'),
('5', 'Clear', 'Lipgloss', 'Clear', 'Nude', '12'),
('6', 'Daisy', 'Lip Crayon', 'Orange', 'Brights', '10'),
('7', 'Caramel', 'Matte', 'Brown', 'Nudes', '11'),
('8', 'Berry', 'Matte', 'Purple', 'Brights', '12'),
('9', 'Celine', 'Lip Crayon', 'Red', 'Karreuche', '12'),
('10', 'Amorosa', 'Lip Gloss', 'Pink', 'Brights', '10'),
('11', 'Sunset Blvd', 'Shadow', 'Bronze', 'Karreuche', '5'),
('12', 'Jiffy', 'Lipgloss', 'Mauve', 'Steele', '6');
GO


INSERT INTO Payment(PaymentID, CardType, CardNumber, ExpirationMonth, ExpirationYear) VALUES
('1', 'Visa', '138274638596047389', '04', '17'),
('2', 'Mastercard', '9876043617384926', '01', '23'),
('3', 'Mastercard', '1029384756102938', '04', '18'),
('4', 'Discover', '0000888866669993', '05', '19'),
('5', 'Visa', '1357997531357986', '06', '20'),
('6', 'Discover', '2467531864998007', '08', '20'),
('7', 'AMEX', '1111133224455334', '09', '25'),
('8', 'Visa', '6677558843213456', '10', '17'),
('9', 'Mastercard', '5342167895423196', '11', '20'),
('10', 'Visa', '1112225557774440', '06', '23')
('11', 'AMEX', '2342124567542854', '07', '20'),
('12', 'Visa', '1234876234197835', '10', '19');
GO 

INSERT INTO Customer (CustomerID, FirstName, LastName, PaymentID, ShippingAddressID) VALUES
(1, 'Mintis', 'Hankerson', '1', '1'), 
(2, 'Olivia', 'Belitsky', '2', '2'),
(3, 'Melissa', 'Tong', '3', '3'),
(4, 'Walker', 'Odell','4', '4'),
(5, 'Clara', 'Linanda','5', '5'),
(6, 'Shazeem', 'Siddiqi', '6', '6'),
(7, 'Tanya', 'Sertthin', '7', '7'),
(8, 'Bradley', 'Qian', '8', '8'),
(9, 'Paul', 'Han', '9', '9'),
(10, 'Cynthia', 'Yong', '10', '10'),
(11, 'Trevor', 'Smith', 'Null', 'Null'),
(12, 'Gyda', 'Sum', 'Null', 'Null');
Go 


INSERT INTO [Order](OrderID, CustomerID, ProductID, ShippingAddressID, PaymentID, TrackingNumber, TotalAmount, OrderDate) VALUES
('1', '1', '1', '1', '1', '7564839201', '34', '03/24/16'),
('2', '2', '2', '2', '2', '4857391029', '53', '01/1/17'),
('3', '3', '3', '3', '3', '0009878958', '13', '12/13/16'),
('4', '4', '4', '4', '4', '1237468950', '14', '12/23/16'),
('5', '5', '5', '5', '5', '9687950487', '27', '12/3/16'),
('6', '6', '6', '6', '6', '8574635243', '68', '11/13/16'),
('7', '7', '7', '7', '7', '1223311098', '89', '09/26/16'),
('8', '8', '8', '8', '8', '8886667546', '99', '08/05/16'),
('9', '9', '9', '9', '9', '00339287289', '47', '09/07/16'),
('10', '10', '10', '10', '10', '28394857600', '50', '02/13/17'),
('11', '11', '11', '11', '11', '48392019584', '5', '01/13/17'),
('12', '12', '12', '12', '12', '999777069584', '6', '06/13/16');
Go



 

-- Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 



