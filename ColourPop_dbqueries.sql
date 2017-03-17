USE Colourpop

--team Colourpop, Olivia Belitsky, Mintis Hankerson, Shazeem Siddiqi--

--to display all records from Customer table--

SELECT*
FROM dbo.Customer

--to display all records from Order table--
SELECT*
FROM dbo.[Order]

--to display all records from Payment table--

SELECT*
FROM dbo.Payment

--to display all records from Product table--

SELECT*
FROM dbo.Product

--to display all records from Shipping Address table--

SELECT*
FROM dbo.ShippingAddress


--to display total revenue in database--

SELECT sum(TotalAmount) as Total_Revenue
FROM dbo.[Order]

--to dipslay the products and total price of each order---

SELECT O.OrderID,  P.ProductName, O.TotalAmount
FROM dbo.[Order] as O Inner Join dbo.Product as P
on O.ProductID=P.ProductID

--to display the Names and addresses of each customer.  This is a left outer join because not all customers in the database gave their address--

SELECT C.FirstName, C.LastName, S.AddressLine1
FROM dbo.Customer as C LEFT JOIN dbo.ShippingAddress as S
ON C.ShippingAddressID=S.ShippingAddressID



--to display the product ID, product name, and unit price for each product where the unit price is higher than the average unit price--

SELECT ProductID, ProductName, UnitPrice
FROM dbo.Product
WHERE UnitPrice>
(SELECT AVG(UnitPrice) FROM dbo.Product)
ORDER BY UnitPrice
