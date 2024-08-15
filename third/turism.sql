CREATE
DATABASE TourismDB;
USE
TourismDB;

-- Таблица клиентов
CREATE TABLE Clients
(
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name      VARCHAR(255),
    email     VARCHAR(255),
    phone     VARCHAR(20)
);

-- Таблица туров
CREATE TABLE Tours
(
    tour_id     INT PRIMARY KEY AUTO_INCREMENT,
    tour_name   VARCHAR(255),
    destination VARCHAR(255),
    duration    INT,
    price       DECIMAL(10, 2)
);

-- Таблица типов услуг
CREATE TABLE ServiceTypes
(
    service_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name       VARCHAR(255)
);

-- Таблица услуг
CREATE TABLE Services
(
    service_id      INT PRIMARY KEY AUTO_INCREMENT,
    service_name    VARCHAR(255),
    service_type_id INT,
    FOREIGN KEY (service_type_id) REFERENCES ServiceTypes (service_type_id)
);

-- Таблица заказов
CREATE TABLE Orders
(
    order_id    INT PRIMARY KEY AUTO_INCREMENT,
    client_id   INT,
    tour_id     INT,
    order_date  DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (client_id) REFERENCES Clients (client_id),
    FOREIGN KEY (tour_id) REFERENCES Tours (tour_id)
);