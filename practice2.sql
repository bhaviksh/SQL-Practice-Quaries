--Droping The Table if exists
DROP TABLE IF EXISTS Customer;

--Creating a table name Customer 
CREATE TABLE Customer (
Customer_ID INT PRIMARY KEY,
C_Name VARCHAR(50),
City VARCHAR(100),
Age INT
)

--Droping The Table if exists
DROP TABLE IF EXISTS Orders;

--Creating a table name Order 
CREATE TABLE Orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Product VARCHAR(50),
Amount INT,
Order_Date DATE
)

--Inserting the values in Customer Table 
INSERT INTO Customer
VALUES(1, 'Alice', 'New York', 24),
      (2, 'Bob', 'Chicago', 31),
	  (3, 'Charlie', 'New York', 29),
	  (4, 'David', ' San Francisco', 22)
ON CONFLICT (Customer_ID) DO NOTHING 

SELECT * FROM Customer

--Inserting the values in Order Table 
INSERT INTO Orders
VALUES(101, 1, 'Laptop', 900, '2023-08-01' ),
      (102, 1, 'Mouse', 25, '2023-08-05'),
	  (103, 2, 'Keyboard', 45, '2023-08-06'),
	  (104, 3, 'Monitor', 200, '2023-09-01'),
	  (105, 4, 'Laptop', 950, '2023-09-10')
ON CONFLICT (Order_ID) DO NOTHING;

SELECT * FROM Orders

--Retrieve all customers who live in 'New York'.

SELECT * FROM Customer
WHERE City = 'New York'


--List all orders with amount greater than 100.

SELECT * FROM Orders 
WHERE Amount > 100


--Select the names of customers who placed an order. (Use JOIN)

SELECT DISTINCT C_Name 
FROM customer c
INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID

--Find the total order amount placed by each customer.
--Using INNER Join 
SELECT DISTINCT C_Name, c.Customer_ID, Amount
FROM Orders o
INNER JOIN Customer c ON o.Customer_ID = c.Customer_ID
ORDER BY Amount 

--How many orders were placed in the month of August 2023?
--Using COUNT 
SELECT COUNT(Order_Date) 
FROM Orders 
WHERE Order_Date BETWEEN '2023-08-01' AND '2023-08-31'


--Get the average order amount for each product.

SELECT Product, AVG(Amount) AS Product_AVG
FROM Orders 
GROUP BY Product 
ORDER By Product_AVG;


--List all customers along with their orders (if any). Show customers even if they have no orders
--We can use Left JOin in this 

SELECT c.Customer_ID, C_Name, o.Order_ID, o.Product, Amount, Order_Date 
FROM Customer c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID



--Which customer placed the highest single order? (Use JOIN + ORDER BY)
--We can use RIGHT Join as well as INNER JOin 
SELECT c.Customer_ID, C_Name, o.Order_ID, Amount, Order_Date
FROM Customer c
RIGHT JOIN Orders o ON c.Customer_ID = o.Customer_ID
ORDER BY Amount DESC
LIMIT 1


--Find the customers who have never placed an order.
--We can use IS NULL Operation
SELECT c.Customer_ID, C_Name, o.Order_ID, Product
FROM Customer c
INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE Order_ID IS NULL


--Get the details of orders that are above the average order amount.

SELECT * FROM Orders
WHERE Amount > (
      SELECT AVG(Amount)
	  FROM Orders
)


--Update the city of customer 'David' to 'Los Angeles'.

UPDATE Customer 
SET City = 'Los Angeles'
WHERE C_Name = 'David'

--Delete all orders below an amount of 50.
DELETE FROM Orders
WHERE Amount >= 50

SELECT * FROM Customer 
SELECT * FROM Orders

--List top 3 highest orders with customer names.

SELECT c.Customer_ID, C_Name, Order_ID, Amount 
FROM Orders o
INNER JOIN Customer c ON o.Customer_ID = c.Customer_ID
ORDER BY o.Amount DESC
LIMIT 3

--Show each customer and how many orders they've made.

SELECT c.Customer_ID, C_Name, COUNT(Order_ID) AS TotalOrders
FROM Customer c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, C_Name 


--Rename the result columns to CustomerName, TotalAmountSpent when listing total spent per customer.

SELECT C_Name AS CUstomerName, SUM(o.Amount) AS TotalAmountSpent
FROM Customer c
INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY C_Name












