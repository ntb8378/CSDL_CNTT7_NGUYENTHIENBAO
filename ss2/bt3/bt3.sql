create database shop_db;

use shop_db;

CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    TotalAmount DECIMAL(18, 2) NOT NULL,
    CustomerID INT,
    CONSTRAINT FK_Orders_Customers
    FOREIGN KEY (CustomerID) 
    REFERENCES CUSTOMERS(CustomerID)
);

INSERT INTO CUSTOMERS VALUES (1, 'Nguyễn Thiên Bảo');
INSERT INTO ORDERS (OrderID, TotalAmount, CustomerID) 
VALUES (101, 250000.00, 1);
