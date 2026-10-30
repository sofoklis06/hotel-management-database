# Hotel Management Database System

## Project Overview

This project focuses on the design and implementation of a relational database for a Hotel Management System using **MySQL**.

The database is designed to manage hotel operations, including guest information, room types, room reservations, staff members, additional services, and payments.

The project demonstrates practical SQL skills, relational database design, data manipulation, and data retrieval.

## Database Structure

The database consists of the following tables:

- **Guest** – Stores customer information.
- **Room** – Contains hotel room details.
- **Room_Type** – Defines room categories and prices.
- **Booking** – Manages room reservations and check-in/check-out dates.
- **Staff** – Stores employee information and roles.
- **Service** – Contains additional hotel services and their prices.
- **Booking_Service** – Connects bookings with additional services.
- **Payment** – Records customer payments.
- **Sex** – Stores guest gender categories.

## Technologies & Skills

- MySQL
- SQL
- Relational Database Design
- Entity Relationship Diagrams (ERD)
- Primary Keys & Foreign Keys
- Database Constraints
- Data Definition Language (DDL)
- Data Manipulation Language (DML)
- SQL Joins
- Aggregate Functions (SUM, COUNT, AVG)
- GROUP BY & HAVING
- Subqueries
- ORDER BY & LIMIT
- Date Functions

## Project Features

- Creation of a relational database with multiple interconnected tables.
- Definition of primary and foreign key constraints.
- Management of hotel guests, rooms, reservations, staff, services, and payments.
- Insertion of sample records for testing purposes.
- Execution of SQL queries to retrieve useful business information.
- Calculation of total revenue and customer spending.
- Identification of the most frequently used hotel services.
- Analysis of room availability and booking statistics.
- Generation of customer and staff performance reports.

## Project Structure

hotel-management-database/
│
├── README.md
├── install.sql
├── load.sql
├── queries.sql
└── ER.pdf
```

## How to Run

1. Install **MySQL Server** and open **MySQL Workbench** or another MySQL client.
2. Open and execute `install.sql` to create the database and its tables.
3. Execute `load.sql` to insert the sample data into the database.
4. Execute `queries.sql` to explore the database and run the analytical SQL queries.

Note: The installation script drops and recreates the hotel_big_db database. Make sure to back up any existing data before executing it, as all previous data in this database will be deleted..


## Purpose

This project was developed as part of an academic database course to apply SQL concepts and gain practical experience in relational database design and data management.
