🚗 Premium Car Showroom Management System (SQL Server)
📌 Project Overview

This project is a SQL Server–based database system designed to manage operations of a premium car showroom.
It covers car inventory, brands, models, customers, sales, executives, service records, and insurance details.

The goal is to demonstrate real-world SQL concepts such as:

Database design & normalization

Joins and aggregations

Window functions

Control-of-flow (IF…ELSE, WHILE)

Triggers for business rules

This project is suitable for academic submission, interviews, and portfolio showcase.

🗂️ Database Schema

The database consists of the following tables:

Showroom – Showroom details (location, contact)

Brand – Premium car brands

CarModel – Models offered by each brand

CarInventory – Physical cars available/sold

Customer – Customer information

SalesExecutive – Sales staff details

Sales – Sales transactions

ServiceRecord – Car service history

Insurance – Insurance information for sold cars

All tables are properly linked using Primary Keys and Foreign Keys.

🛠️ Technologies Used

Database: Microsoft SQL Server

Language: T-SQL

Tools: SQL Server Management Studio (SSMS)

⚙️ Key Features Implemented

Normalized relational database design

Inventory tracking (Available / Sold)

Sales transaction management

Automatic stock update using triggers

Analytical queries using window functions

Revenue and performance reporting

📊 Sample SQL Concepts Covered
✔ Joins

Customer purchase history

Available cars by showroom

Sales with brand and model details

✔ Aggregations

Total sales by brand

Revenue by showroom

Top-performing sales executives

✔ Window Functions

Running total of sales

Ranking sales executives by revenue

✔ Triggers

Prevent selling a car already marked as Sold

Auto-update inventory after a sale

✔ Control Flow

IF…ELSE checks (high-value sales, car existence)

WHILE loops for bulk updates and iteration

📈 Example Query (Running Total of Sales)
SELECT
    SaleID,
    SalePrice,
    SaleDate,
    SUM(SalePrice) OVER (ORDER BY SaleDate) AS RunningTotal
FROM Sales
ORDER BY SaleDate;

▶ How to Run the Project

Open SQL Server Management Studio

Create a new database (e.g., PremiumCarShowroomDB)

Execute:

Table creation scripts

Sample data insert scripts

Queries, triggers, and procedures

Verify results using SELECT statements

🎯 Learning Outcome

After completing this project, you will have hands-on experience with:

Real-world database modeling

Writing optimized SQL queries

Implementing business logic at database level

Preparing SQL projects for interviews

👤 Author

Robin
Graduate in BCA | Aspiring Data Analyst / Data Scientist
SQL • Excel • Data Analysis
