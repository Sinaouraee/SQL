CREATE DATABASE SimpleStore
GO
USE SimpleStore 
GO
CREATE TABLE Employees
(
EmployeeID INT,
FirstName NVARCHAR(20),
lastName NVARCHAR(20),
BirthDaate Date,
NCODE VARCHAR(20),

CONSTRAINT PK_Employees_EmployeeID
	PRIMARY KEY (EmployeeID)
)
GO
CREATE TABLE Customers
(
CustomerID INT,
FirstName NVARCHAR(20),
lastName NVARCHAR(20),
BirthDaate Date,
NCODE VARCHAR(20),

CONSTRAINT PK_Customers_CustomerID
	PRIMARY KEY (CustomerID)
)
GO
Create TABLE Orders
(
OrderID INT,
EmployeeID INT,
CustomerID INT,
OrderDate SMALLDATETIME,

CONSTRAINT PK_Orders_OrderID
	PRIMARY KEY (OrderID),

CONSTRAINT FK_Orders_EmployeeID FOREIGN KEY (EmployeeID)
	REFERENCES Employees(EmployeeID),
CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID)
	REFERENCES Customers(CustomerID)
)
GO
CREATE TABLE Products
(
ProductID INT,
ProductName  NVARCHAR(20),

CONSTRAINT PK_Products_ProductID PRIMARY KEY (ProductID)
)
GO

CREATE TABLE OrderDetails 
(
OrderID INT,
ProductID INT,
Quantity INT,

CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID,ProductID),
CONSTRAINT FK_OrderDetails_OrderID FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID),
CONSTRAINT FK_OrderDetails_ProductID FOREIGN KEY (ProductID)
	REFERENCES Products(ProductID)
)
GO
