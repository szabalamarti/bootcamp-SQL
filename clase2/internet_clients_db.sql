DROP DATABASE IF EXISTS internet_clients_db;
CREATE DATABASE internet_clients_db;
USE internet_clients_db;

-- Create table internet_plans
DROP TABLE IF EXISTS internet_plans;
CREATE TABLE internet_plans (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    speed INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Create table clients
DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
    dni VARCHAR(8) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    internet_plan_id INT NOT NULL,
    FOREIGN KEY (internet_plan_id) REFERENCES internet_plans (id)
);

-- POPULATE TABLES

-- Populate table internet_plans

INSERT INTO internet_plans (id, name, speed, price) VALUES
(1, 'Plan 1', 10, 100.00),
(2, 'Plan 2', 20, 200.00),
(3, 'Plan 3', 30, 300.00),
(4, 'Plan 4', 40, 400.00),
(5, 'Plan 5', 50, 500.00),
(6, 'Plan 6', 60, 600.00),
(7, 'Plan 7', 70, 700.00),
(8, 'Plan 8', 80, 800.00),
(9, 'Plan 9', 90, 900.00),
(10, 'Plan 10', 100, 1000.00);

-- Populate table clients

INSERT INTO clients (dni, name, last_name, birthdate, internet_plan_id) VALUES
('12345678', 'John', 'Doe', '1990-01-01', 1),
('23456789', 'Jane', 'Doe', '1990-01-01', 2),
('34567890', 'John', 'Smith', '1990-01-01', 3),
('45678901', 'Jane', 'Smith', '1990-01-01', 4),
('56789012', 'John', 'Doe', '1990-01-01', 5),
('67890123', 'Jane', 'Doe', '1990-01-01', 6),
('78901234', 'John', 'Smith', '1990-01-01', 7),
('89012345', 'Jane', 'Smith', '1990-01-01', 8),
('90123456', 'John', 'Doe', '1990-01-01', 9),
('01234567', 'Jane', 'Doe', '1990-01-01', 10);

