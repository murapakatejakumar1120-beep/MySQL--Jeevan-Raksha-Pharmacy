-- ============================================
-- JEEVAN RAKSHA PHARMACY
-- MYSQL DATABASE PROJECT
-- ============================================

-- 1. CREATE DATABASE

create database if not exists jeevan_raksha_pharmacy;

use jeevan_raksha_pharmacy;


-- 2. CREATE CUSTOMERS TABLE

create table customers (
    customer_id int auto_increment primary key,
    name varchar(100),
    phone varchar(15),
    city varchar(50)
);


-- 3. CREATE SUPPLIERS TABLE

create table suppliers (
    supplier_id int auto_increment primary key,
    supplier_name varchar(100),
    contact_person varchar(100),
    phone varchar(15)
);


-- 4. CREATE MEDICINES TABLE

create table medicines (
    medicine_id int auto_increment primary key,
    name varchar(100),
    category varchar(50),
    price decimal(10,2),
    stock_quantity int,
    expiry_date date,
    supplier_id int,
    foreign key (supplier_id) references suppliers(supplier_id)
);


-- 5. CREATE ORDERS TABLE

create table orders (
    order_id int auto_increment primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    payment_mode enum('UPI', 'Cash', 'Card'),
    foreign key (customer_id) references customers(customer_id)
);


-- 6. CREATE ORDER ITEMS TABLE

create table order_items (
    item_id int auto_increment primary key,
    order_id int,
    medicine_id int,
    quantity int,
    subtotal decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (medicine_id) references medicines(medicine_id)
);


-- 7. INSERT CUSTOMERS

insert into customers (name, phone, city) values
('Rahul Sharma', '9876543210', 'Mumbai'),
('Priya Verma', '9123456789', 'Delhi'),
('Amit Patel', '9988776655', 'Ahmedabad'),
('Sneha Reddy', '9090909090', 'Hyderabad'),
('Vikram Singh', '7766554433', 'Mumbai');


-- 8. INSERT SUPPLIERS

insert into suppliers (supplier_name, contact_person, phone) values
('Apollo Distributors', 'Rajesh Kumar', '9000000001'),
('MedPlus Supply Chain', 'Suresh Reddy', '9000000002'),
('Himalaya Wellness', 'Anil Sharma', '9000000003');


-- 9. INSERT MEDICINES

insert into medicines
(name, category, price, stock_quantity, expiry_date, supplier_id)
values
('Dolo 650', 'Tablet', 30.00, 500, '2025-12-31', 1),
('Azithral 500', 'Tablet', 120.00, 50, '2024-05-20', 1),
('Benadryl', 'Syrup', 110.00, 20, '2024-11-15', 2),
('Combiflam', 'Tablet', 45.00, 200, '2026-01-01', 3),
('Insulin Pen', 'Injection', 800.00, 5, '2024-03-10', 2);


-- 10. INSERT ORDERS

insert into orders
(customer_id, order_date, total_amount, payment_mode)
values
(1, '2023-10-01', 150.00, 'UPI'),
(2, '2023-10-02', 240.00, 'Card'),
(3, '2023-10-05', 45.00, 'Cash'),
(1, '2023-10-10', 800.00, 'UPI'),
(4, '2023-10-12', 1200.00, 'Card');


-- 11. INSERT ORDER ITEMS

insert into order_items
(order_id, medicine_id, quantity, subtotal)
values
(1, 1, 5, 150.00),
(2, 2, 2, 240.00),
(3, 4, 1, 45.00),
(4, 5, 1, 800.00),
(5, 5, 1, 800.00),
(5, 2, 2, 240.00),
(5, 1, 5, 150.00);


-- ============================================
-- QUERIES
-- ============================================


-- QUERY 1: DISPLAY CUSTOMER NAME AND CITY

select name, city
from customers;


-- OUTPUT

/*
+---------------+-----------+
| name          | city      |
+---------------+-----------+
| Rahul Sharma  | Mumbai    |
| Priya Verma   | Delhi     |
| Amit Patel    | Ahmedabad |
| Sneha Reddy   | Hyderabad |
| Vikram Singh  | Mumbai    |
+---------------+-----------+
*/


-- QUERY 2: FIND SYRUP AND INJECTION MEDICINES

select name
from medicines
where category in ('Syrup', 'Injection');


-- OUTPUT

/*
+-------------+
| name        |
+-------------+
| Benadryl    |
| Insulin Pen |
+-------------+
*/


-- QUERY 3: FIND ORDERS ABOVE 500

select *
from orders
where total_amount > 500;


-- OUTPUT

/*
+----------+-------------+------------+--------------+--------------+
| order_id | customer_id | order_date | total_amount | payment_mode |
+----------+-------------+------------+--------------+--------------+
| 4        | 1           | 2023-10-10 | 800.00       | UPI          |
| 5        | 4           | 2023-10-12 | 1200.00      | Card         |
+----------+-------------+------------+--------------+--------------+
*/


-- QUERY 4: FIND PHONE NUMBERS OF MUMBAI CUSTOMERS

select phone
from customers
where city = 'Mumbai';


-- OUTPUT

/*
+------------+
| phone      |
+------------+
| 9876543210 |
| 7766554433 |
+------------+
*/


-- QUERY 5: COUNT UPI ORDERS

select count(*) as upi_orders
from orders
where payment_mode = 'UPI';


-- OUTPUT

/*
+------------+
| upi_orders |
+------------+
| 2          |
+------------+
*/


-- QUERY 6: COUNT MEDICINES SUPPLIED BY APOLLO DISTRIBUTORS

select count(*) as medicine_count
from medicines m
join suppliers s
on m.supplier_id = s.supplier_id
where s.supplier_name = 'Apollo Distributors';


-- OUTPUT

/*
+---------------+
| medicine_count|
+---------------+
| 2             |
+---------------+
*/


-- QUERY 7: DISPLAY CUSTOMER ORDER DETAILS

select c.name as customer_name,
       o.order_date as order_date,
       o.total_amount as total_amount
from customers c
join orders o
on c.customer_id = o.customer_id;


-- OUTPUT

/*
+---------------+------------+--------------+
| customer_name | order_date | total_amount |
+---------------+------------+--------------+
| Rahul Sharma  | 2023-10-01 | 150.00       |
| Priya Verma   | 2023-10-02 | 240.00       |
| Amit Patel    | 2023-10-05 | 45.00        |
| Rahul Sharma  | 2023-10-10 | 800.00       |
| Sneha Reddy   | 2023-10-12 | 1200.00      |
+---------------+------------+--------------+
*/


-- QUERY 8: CALCULATE REVENUE BY PAYMENT MODE

select payment_mode,
       sum(total_amount) as total_revenue
from orders
group by payment_mode;


-- OUTPUT

/*
+--------------+--------------+
| payment_mode | total_revenue |
+--------------+--------------+
| UPI          | 950.00       |
| Card         | 1440.00      |
| Cash         | 45.00        |
+--------------+--------------+
*/


-- QUERY 9: FIND BEST-SELLING MEDICINE

select m.name as medicine_name,
       sum(oi.quantity) as total_quantity_sold
from medicines m
join order_items oi
on m.medicine_id = oi.medicine_id
group by m.medicine_id, m.name
order by total_quantity_sold desc
limit 1;


-- OUTPUT

/*
+---------------+---------------------+
| medicine_name | total_quantity_sold |
+---------------+---------------------+
| Dolo 650      | 10                  |
+---------------+---------------------+
*/


-- QUERY 10: FIND CUSTOMERS SPENDING MORE THAN 1000

select c.name as customer_name,
       sum(o.total_amount) as total_spent
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.name
having sum(o.total_amount) > 1000;


-- OUTPUT

/*
+---------------+------------+
| customer_name | total_spent |
+---------------+------------+
| Sneha Reddy   | 1200.00    |
+---------------+------------+
*/


-- QUERY 11: FIND MEDICINES WITH LOW STOCK

select m.name as medicine_name,
       m.stock_quantity as stock_quantity,
       s.supplier_name as supplier_name
from medicines m
join suppliers s
on m.supplier_id = s.supplier_id
where m.stock_quantity < 50;


-- OUTPUT

/*
+---------------+----------------+----------------------+
| medicine_name | stock_quantity | supplier_name        |
+---------------+----------------+----------------------+
| Benadryl      | 20             | MedPlus Supply Chain |
| Insulin Pen   | 5              | MedPlus Supply Chain |
+---------------+----------------+----------------------+
*/
