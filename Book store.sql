--Table 1
Create table Books ( 
        Book_id Serial Primary key,
        Title Varchar(100),Author Varchar(100),genre varchar(30),
	    Published_Year int,Price Numeric(10,2),Stock int
);

--Table 2
Create table Customers(
	       Customer_id Serial Primary Key, name Varchar(100),
	       Email varchar(100),phone int,city varchar (30),country varchar(30)
);

--Table 3
Create table Orders(
             Order_id Serial primary key,customer_id int references customers(customer_id),
	         Book_id int references Books(Book_id),
             Order_date date, Quantity int,Total_amount numeric(10,2)
);

Select * from Books;
Select * from Customers;
Select * from Orders;

--Import CSV file for Table 1
COPY Books(Book_id,title,author,genre,published_year,Price, stock)
from 'C:\Program Files\PostgreSQL\16\data\Files\Books.csv'
CSV header;

--Import CSV file for Table 2
COPY Customers(Customer_id,name,email,phone,city,country)
from 'C:\Program Files\PostgreSQL\16\data\Files\Customers.csv'
CSV header;

--Import CSV file for Table 3
COPY Orders(Order_id,Customer_id,Book_id,Order_date,quantity,total_amount)
from 'C:\Program Files\PostgreSQL\16\data\Files\Orders.csv'
CSV header;

Select * from Books;
Select * from Customers;
Select * from Orders;

--1. Retrieve all books in the "Fiction" genre:
Select * from Books
where genre='Fiction';

--2.Find the books published after the year 1950:
Select * from books
where published_year > 1950;

--3.List all the customers from the canada:
Select * from Customers
where country='Canada';

--4.Show orders placed in November 2023:
Select * from orders
where order_date between '2023-11-01' and '2023-11-30';

--5.Retrieve the total stocks of book available:
Select sum(stock) as total_stock from books;

--6.Find the detail of the most expensive book:
Select * from books
Order by price desc
Limit 1;

--7.Show all customers who ordered more than 1 quantity of book:
Select * from orders
where quantity>1;

--8.Retrieve all orders where the total amount exceeds $20:
Select * from orders 
where total_amount >20;

--9. List all the genres available in the books table:
Select distinct genre from books;

--10.Find the book with the lowest stock:
Select * from books
order by stock asc
limit 1;

--11. Calculate the toal revenue generated from all the orders
Select sum(total_amount) as total_revenue from orders;

------------ ****** ADVANCED QUESTIONS ************------------
--1.Retrieve the total number of books sold for each genre: 
Select b.genre,sum(o.quantity) as total_books_sold
from books b
join
orders o
on b.book_id=o.book_id
group by b.genre;

--2.Find the average price of books in the "Fantasy" genre:
Select avg(price) as Average_books from books
where genre='Fantasy';

--3.List the customers who have placed at least 2 orders:
Select o.customer_id,c.name,count(o.order_id) as total_orders
from orders o
Join
customers c
on o.customer_id=c.customer_id
group by c.name,o.customer_id
Having count(order_id)>=2;

--4.Find the most frequently ordered book:
Select o.book_id,b.title,count(o.order_id) as order_count 
from orders o
Join
books b
on o.book_id=b.book_id
group by o.book_id,b.title
order by order_count desc Limit 1;

--5.show the top 3 most expensive books of'Fantasy genre:
Select * from books
where genre= 'Fantasy'
order by price desc
Limit 3;

--6.Retrieve the total quantity of books sold by each author:
Select b.author,sum(o.quantity) as total_quantity_sold 
from books b
JOIN
orders o
on b.book_id=o.book_id
group by b.author;

--7.List the cities where customers spent over $30 are located:
Select distinct c.city,o.total_amount 
from customers c
join
orders o
on c.customer_id=o.customer_id
group by c.city,o.total_amount 
Having o.total_amount>30;

--8.Find the customers who spent most on the orders:
Select c.customer_id,c.name,sum(o.total_amount)as total_spent
from customers c
join orders o
on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent desc limit 1;

--9.Calculate the stock remaining after fulfilling all the orders:
Select b.book_id,b.title, b.stock,coalesce(sum(quantity),0) as order_quantity,
b.stock-coalesce(sum(quantity),0) as remaining_quantity
from books b
left join orders o
on b.book_id=o.book_id
group by b.book_id
order by b.book_id;