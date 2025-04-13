# BookStore
A database that contains info for a BookStore

# 📚 Bookstore Database Project

This project is a beginner-level relational database design and implementation using **MySQL**. It focuses on building a structured and normalized database for a fictional bookstore.

## 📌 Objective

To create a relational database that stores important information about bookstore operations such as:
- Books and their authors
- Customers and their addresses
- Orders and shipping
- Publishers, languages, and more

This system is designed to efficiently store and retrieve data for managing a bookstore.

---

## 🛠 Technologies Used

- **Database**: MySQL
- **SQL Features Used**: `CREATE DATABASE`, `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `AUTO_INCREMENT`, `VARCHAR`, `DATE`, `DECIMAL`

---

## 📂 Project Structure

The SQL file contains the following steps:
1. Creating the `bookstore_db` database.
2. Creating 15 normalized tables to handle various entities and their relationships.

---

## 🗂️ Tables Created

Here are the 15 tables used in this database:

| Table Name         | Description |
|--------------------|-------------|
| `book`             | Stores basic book details |
| `book_author`      | Manages the many-to-many relationship between books and authors |
| `author`           | Stores author information |
| `book_language`    | Stores available book languages |
| `publisher`        | Stores publisher details |
| `customer`         | Stores customer information |
| `customer_address` | Links customers to their addresses |
| `address_status`   | Stores the status of an address (e.g., current, old) |
| `address`          | Stores all unique address records |
| `country`          | Stores a list of countries for addresses |
| `cust_order`       | Stores customer orders |
| `order_line`       | Stores books included in each order |
| `shipping_method`  | Stores different shipping methods |
| `order_history`    | Tracks the history/status changes of each order |
| `order_status`     | Stores possible order statuses (e.g., shipped, delivered) |

---

## 🚀 How to Use

1. Open a MySQL environment like MySQL Workbench or phpMyAdmin.
2. Copy and paste the SQL code into the query window.
3. Run the script to create the database and tables.
4. You can then insert, update, or query data as needed.

---

## 🧠 What I Learned

- How to design a relational database from scratch.
- The importance of normalization and foreign keys.
- How to define relationships between tables.
- How to use SQL to build database structure.

---

## 📬 Contact

This project was created as part of a learning exercise in database design.  
If you have feedback or suggestions, feel free to connect!

---

