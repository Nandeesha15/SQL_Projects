CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT,
    sale_date DATE,
    region VARCHAR(20)
);

INSERT INTO sales_data (id, product_name, category, price, quantity, sale_date, region) VALUES
(1, 'Smartphone Pro', 'Electronics', 25000, 10, '2024-01-10', 'North'),
(2, 'Laptop X', 'Electronics', 55000, 5, '2024-01-15', 'South'),
(3, 'Tablet Mini', 'Electronics', 18000, 8, '2024-02-01', 'East'),
(4, 'Desk Chair', 'Furniture', 7000, 12, '2024-01-20', 'North'),
(5, 'Dining Table', 'Furniture', 15000, 3, '2024-03-05', 'West'),
(6, 'Bluetooth Speaker', 'Electronics', 3000, 20, '2024-02-15', 'East'),
(7, 'Office Desk', 'Furniture', 12000, 4, '2024-03-12', 'South'),
(8, 'Smartphone Pro', 'Electronics', 25000, 15, '2024-03-18', 'South'),
(9, 'Laptop X', 'Electronics', 55000, 7, '2024-03-25', 'North'),
(10, 'Desk Chair', 'Furniture', 7000, 9, '2024-03-30', 'West'),
(11, 'Smartwatch Z', 'Electronics', 8000, 10, '2024-01-05', 'East'),
(12, 'Bookshelf', 'Furniture', 9500, 6, '2024-03-28', 'North'),
(13, 'Tablet Mini', 'Electronics', 18000, 10, '2024-03-10', 'South'),
(14, 'Laptop X', 'Electronics', 55000, 3, '2024-02-22', 'West'),
(15, 'Office Desk', 'Furniture', 12000, 7, '2024-01-25', 'East');

select * from sales_data;

-- PRACTICE QUESTIONS ON ( GROUP BY & HAVING )

-- 1.Find the total quantity sold for each product.
select sum(quantity) AS total_quantity, category 
from sales_data 
group by category;

-- 2.List all unique product categories.
select category from sales_data group by category;

-- 3.Count the number of sales for each region.
select COUNT(*) as sales_at_region, region
from sales_data
group by region; 

-- 4.Find the average price of products sold in the 'Electronics' category.
select avg(price),category 
from sales_data 
group by category
having category = 'Electronics';

-- 5.Get the total revenue (price × quantity) per product.
select sum(price * quantity) as total_revenue,product_name
from sales_data
group by product_name;

-- 6.List all products that have sold more than 20 units in total (sum of quantity).
select sum(quantity) as total_sales,product_name
from sales_data
group by product_name
having sum(quantity) > 20;

-- 7. Show total revenue per category for sales in the 'North' region only.
select sum(price), category,region
from sales_data
where region = 'North'
group by category;

-- 8.List regions where the average product price is above ₹10,000.
select avg(price) as avg_price,region 
from sales_data
group by region 
having avg(price) > 10000.00;

-- 9.Find categories where more than 2 different products were sold.
select category, count(distinct(product_name)) as dis 
from sales_data 
group by category
having dis >2;

-- 10.Find the total quantity sold per product in the month of January 2024.
select product_name,sum(quantity) as total_sales
from sales_data
where sale_date between '2024-01-01' and '2024-01-31'
group by product_name ;

-- 11.List products with names starting with 'S' and total revenue per product.
select product_name ,sum(price * quantity) as total_revenue
from sales_data
where product_name regexp '^S'
group by product_name;

-- 12.Show all products sold between ‘2024-01-01’ and ‘2024-03-31’ with quantity greater than 50 total.
select product_name,sum(quantity) as total
from sales_data
where sale_date between '2024-01-01' and '2024-03-31'
group by product_name
having total > 50;

-- 13. Find the highest revenue product per region.
select sum(price * quantity) as revenue,product_name,region
from sales_data
group by region,product_name 
order by region,revenue desc;

-- 14. List categories with an average quantity sold greater than 8.
select avg(quantity) as average,category
from sales_data
group by category
having average > 8;

-- 15.Find the number of sales where the product name contains 'Pro'.
select product_name, count(*)
from sales_data 
where product_name regexp 'pro'
group by product_name; 

-- 16.Find all products whose total revenue is between ₹1,00,000 and ₹3,00,000.
select product_name,sum( price * quantity) as total_revenue 
from sales_data
group by product_name 
having total_revenue between 100000.00 and 300000.00;

-- 17. List all regions where more than 3 different products were sold.
select region,count(distinct product_name) as num
from sales_data 
group by region
having num >3;

-- 18.Find products that were sold in the first quarter of 2024 with total quantity > 30.
select product_name,sum(quantity) as total_quantity
from sales_data
where sale_date between '2024-01-01' and '2024-03-31'
group by product_name 
having total_quantity > 30;

-- 19.Find all products where the name contains 'Pro' and total revenue is more than ₹50,000.
select product_name,sum(price*quantity) as total_revenue 
from sales_data 
where product_name regexp 'pro'
group by product_name 
having total_revenue > 50000.00;

-- 20.List categories where the average quantity sold per sale is above 8.
select category, avg(quantity) 
from sales_data
group by category 
having avg(quantity) > 8;

-- 21.Find products whose names start with 'S' and total quantity sold is more than 20.
select product_name, sum(quantity) as total_quantity
from sales_data
where product_name regexp '^S'
group by product_name 
having total_quantity > 20;

-- 22.Show total revenue by region and category where revenue is at least ₹80,000.
select region,category, sum(price*quantity) as total_revenue 
from sales_data
group by region,category 
having total_revenue >= 80000.00;

-- 23. List regions where average product price is between ₹5000 and ₹20000.
select region,avg(price) as average 
from sales_data
group by region 
having average between 5000.00 and 20000.00;

-- 24.Get all categories that have sold products with names ending in 'X' and total quantity > 10.
select category,sum(quantity) as total_quantity
from sales_data
where product_name regexp 'x$'
group by category
having total_quantity >10;

-- 25.Find regions where total quantity sold is not between 30 and 100.
select region,sum(quantity) as total_quantity
from sales_data
group by region 
having total_quantity not between 30 and 100;

-- 26.List all categories where total revenue exceeds ₹1,50,000.
select category,sum(price*quantity) as total_revenue
from sales_data
group by category 
having total_revenue > 150000.00;

-- 27.Show all products with names that contain exactly 2 words (e.g., Smartphone Pro)
select product_name,count(*) as total_count
from sales_data 
where product_name regexp '^[A-Za-z]+ [A-Za-z]$' 
group by product_name;
















