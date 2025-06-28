# SQL Practice Queries 🧠

This repository contains a collection of SQL practice problems designed to reinforce core database concepts using a sample **Customers** and **Orders** schema.

These exercises cover beginner to intermediate SQL skills with a strong focus on real-world business scenarios.

---

## 📘 Schema Overview

### 🧾 Customers
| Column        | Type     | Description           |
|---------------|----------|-----------------------|
| Customer_ID   | INT      | Primary key           |
| Name          | VARCHAR  | Customer's full name  |
| City          | VARCHAR  | City of residence     |
| Age           | INT      | Customer's age        |

### 📦 Orders
| Column        | Type     | Description                |
|---------------|----------|----------------------------|
| Order_ID      | INT      | Primary key                |
| Customer_ID   | INT      | Foreign key to Customers   |
| Product       | VARCHAR  | Product name               |
| Amount        | FLOAT    | Order amount in currency   |
| Order_Date    | DATE     | Date of the order          |

---

## ✅ Topics Covered

- `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- Filtering: `BETWEEN`, `LIKE`, `IN`, `IS NULL`
- `GROUP BY`, `HAVING`
- Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Subqueries and nested queries
- Aliasing columns with `AS`
- Sorting and limiting results

---

## 🧪 Example Practice Queries

- Select customer names who placed an order
- Get the average order amount per product
- List top 3 highest orders with customer names
- Show customers who made no orders
- Find orders placed in August 2023
- Show each customer and how many orders they’ve made
- Rename result columns (e.g., `CustomerName`, `TotalAmountSpent`)

---

## 💻 How to Use

You can run the queries using:
- **PostgreSQL**, **MySQL**, **SQLite**, or any SQL engine
- Tools like **DBeaver**, **MySQL Workbench**, or **pgAdmin**

---

## 📂 File Structure
├── README.md # Project documentation
├── practice_queries.sql # Contains all SQL practice questions and queries



---

## ✍️ Author

**Bhavik Sharma**  
[GitHub Profile](https://github.com/bhaviksh)

---

## 📎 License

This project is open for educational and personal use. No commercial license is attached.







