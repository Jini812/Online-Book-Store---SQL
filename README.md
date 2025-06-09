# Online Book Store Using PostgreSQL

## Project Objective

This project analyzes book sales, customer behavior, and revenue trends using PostgreSQL.

## Database Schema
- **Books**: Stores book details.
- **Customers**: Stores customer information.
- **Orders**: Tracks purchases.

## Data Sources
* Books.csv – Contains book inventory details.
* Customers.csv – Stores customer demographics.
* Orders.csv – Contains transaction records.

## SQL Queries Included
-	1. Retrieve all books in the "Fiction" genre
-	2.Find the books published after the year 1950
-	3.List all the customers from the canada
-	4.Show orders placed in November 2023
-	5.Retrieve the total stocks of book available
-	6.Find the detail of the most expensive book
-	7.Show all customers who ordered more than 1 quantity of book
-	8.Retrieve all orders where the total amount exceeds $20
-	9. List all the genres available in the books table
-	10.Find the book with the lowest stock
-	11. Calculate the toal revenue generated from all the orders
-	Select sum(total_amount) as total_revenue from orders

-	------------ ****** ADVANCED QUESTIONS ************------------
-	1.Retrieve the total number of books sold for each genre
-	2.Find the average price of books in the "Fantasy" genre
-	3.List the customers who have placed at least 2 orders
-	4.Find the most frequently ordered book
-	5.show the top 3 most expensive books of Fantasy genre
-	6.Retrieve the total quantity of books sold by each author
-	7.List the cities where customers spent over $30 are located
-	8.Find the customers who spent most on the orders
-	9.Calculate the stock remaining after fulfilling all the orders


