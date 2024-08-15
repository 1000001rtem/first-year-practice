CREATE
DATABASE WebAppDB;
USE
WebAppDB;

CREATE TABLE Users
(
    user_id  INT PRIMARY KEY IDENTITY,
    username NVARCHAR(50),
    password NVARCHAR(50),
    email    NVARCHAR(100)
);

CREATE TABLE Products
(
    product_id   INT PRIMARY KEY IDENTITY,
    product_name NVARCHAR(100),
    price        DECIMAL(10, 2)
);

CREATE TABLE Orders
(
    order_id   INT PRIMARY KEY IDENTITY,
    user_id    INT FOREIGN KEY REFERENCES Users(user_id),
    product_id INT FOREIGN KEY REFERENCES Products(product_id),
    order_date DATETIME
);
