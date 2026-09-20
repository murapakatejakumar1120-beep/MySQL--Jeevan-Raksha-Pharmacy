# 💊 Jeevan Raksha Pharmacy

## 📌 Project Overview

Jeevan Raksha Pharmacy is a MySQL-based Pharmacy Management System developed as a DBMS mini project.

The main purpose of this project is to store, organize, and manage pharmacy-related information efficiently. The system manages customers, suppliers, medicines, orders, and order items using a relational database.

The database consists of five main tables:

- Customers
- Suppliers
- Medicines
- Orders
- Order Items

Primary keys and foreign keys are used to establish relationships between the tables and maintain data consistency.

---

## ✨ Key Features

- Customer information management
- Supplier information management
- Medicine inventory management
- Stock quantity tracking
- Medicine expiry date tracking
- Customer order management
- Payment mode management
- Low-stock medicine identification
- High-value order identification
- Revenue calculation by payment mode
- Best-selling medicine identification
- Customer spending analysis
- SQL JOIN operations
- Aggregate functions such as COUNT() and SUM()

---

## 🏗️ Database Architecture

The project follows a relational database architecture.

### Tables

- **Customers** – Stores customer details.
- **Suppliers** – Stores supplier details.
- **Medicines** – Stores medicine and inventory details.
- **Orders** – Stores customer transaction details.
- **Order Items** – Stores individual medicines included in each order.

### Relationships

- One customer can place multiple orders.
- One supplier can supply multiple medicines.
- One order can contain multiple order items.
- One medicine can appear in multiple order items.

---

## 🗄️ Database Design

### Customers

| Column | Description |
|---|---|
| customer_id | Primary Key |
| name | Customer name |
| phone | Customer phone number |
| city | Customer city |

### Suppliers

| Column | Description |
|---|---|
| supplier_id | Primary Key |
| supplier_name | Supplier name |
| contact_person | Contact person |
| phone | Supplier phone number |

### Medicines

| Column | Description |
|---|---|
| medicine_id | Primary Key |
| name | Medicine name |
| category | Medicine category |
| price | Medicine price |
| stock_quantity | Available stock |
| expiry_date | Medicine expiry date |
| supplier_id | Foreign Key |

### Orders

| Column | Description |
|---|---|
| order_id | Primary Key |
| customer_id | Foreign Key |
| order_date | Date of order |
| total_amount | Total order amount |
| payment_mode | UPI, Cash, or Card |

### Order Items

| Column | Description |
|---|---|
| item_id | Primary Key |
| order_id | Foreign Key |
| medicine_id | Foreign Key |
| quantity | Quantity purchased |
| subtotal | Item subtotal |

---

## 🛠️ Tech Stack

- **MySQL** – Database Management System
- **SQL** – Database creation and querying
- **MySQL Workbench** – Database development and testing
- **GitHub** – Source code and documentation

---

## ⚙️ Requirements

- MySQL Server
- MySQL Workbench
- Git (optional)

---

## 🚀 Setup and Run

### 1. Clone the Repository

git clone https://github.com/murapakatejakumar1120-beep/MySQL--Jeevan-Raksha-Pharmacy.git

### 2. Open MySQL Workbench

Connect to your MySQL server.

### 3. Open the SQL File

Open:

jeevan_raksha_pharmacy.sql


### 4. Run the SQL Script

Execute the complete SQL script.

The script will:

1. Create the database.
2. Create all five tables.
3. Insert sample data.
4. Execute the required SQL queries.

### 5. Select the Database

use jeevan_raksha_pharmacy;

### 6. Verify the Tables

show tables;


Expected tables:

customers
suppliers
medicines
orders
order_items


---

## 🔐 Environment Variables

This project does not require environment variables.

No API keys, tokens, or external services are required.

The project runs locally using MySQL.

Environment Variables: Not Required

---

## 🔌 API / Database Notes

This is a database-only MySQL project.

API: Not Applicable

There is currently no REST API or external web service.

All database operations are performed using SQL queries in MySQL.

---

## 📊 SQL Concepts Used

The project demonstrates:

CREATE DATABASE
CREATE TABLE
INSERT
SELECT
WHERE
IN
JOIN
GROUP BY
HAVING
ORDER BY
LIMIT
COUNT()
SUM()
PRIMARY KEY
FOREIGN KEY

---

## 📁 Project Structure


Jeevan-Raksha-Pharmacy/
│
├── README.md
│
├── jeevan_raksha_pharmacy.sql
│
├── Outputs/
│   └── query_outputs.txt
│
└── ER_Diagram/
    └── er_diagram.png

---

## 👥 Team Member Contributions

### Teja Kumar Murapaka

* Database design
* Table creation
* Primary key and foreign key implementation
* Sample data insertion
* SQL query development
* Query testing
* Documentation
* Project presentation

---

## 📈 Project Results

The system can retrieve useful information such as:

* Number of UPI orders
* Medicines supplied by a particular supplier
* Orders above a specified amount
* Revenue by payment mode
* Best-selling medicine
* Customers spending more than ₹1000
* Medicines with low stock
* Customer order details

---

## 🔮 Future Enhancements

* Automatic stock updates
* Medicine expiry alerts
* Low-stock notifications
* Online medicine ordering
* Customer purchase history
* Login and authentication
* Web or mobile application
* REST API integration
* Dashboard and data visualization

---

## 🎯 Conclusion

Jeevan Raksha Pharmacy demonstrates the practical implementation of a relational database using MySQL.

The project organizes pharmacy information into related tables and uses SQL queries to efficiently retrieve and analyze data.

Through this project, we learned database design, table creation, primary keys, foreign keys, relationships, JOIN operations, aggregate functions, filtering, grouping, and sorting.

---

## 👨‍💻 Author

**Teja Kumar Murapaka**

**Project:** Jeevan Raksha Pharmacy
**Technology:** MySQL / SQL
**Project Type:** DBMS Mini Project

---

## 📜 License

This project was developed for academic and educational purposes.

```
```
