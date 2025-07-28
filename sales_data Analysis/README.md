## 📘 Reference Table: `sales_data`

```sql
CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT,
    sale_date DATE,
    region VARCHAR(20)
);
```

---

## 📥 Sample Data:

```sql
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
```

---

## 📊 SQL Practice Questions — `GROUP BY`, `HAVING`, `LIKE`, `BETWEEN`, `REGEXP`

```sql
-- 1. Total quantity sold per category
SELECT SUM(quantity) AS total_quantity, category 
FROM sales_data 
GROUP BY category;

-- 2. List all unique product categories
SELECT category FROM sales_data GROUP BY category;

-- 3. Count number of sales per region
SELECT COUNT(*) AS sales_at_region, region
FROM sales_data
GROUP BY region;

-- 4. Average price of Electronics products
SELECT AVG(price), category 
FROM sales_data 
GROUP BY category
HAVING category = 'Electronics';

-- 5. Total revenue per product
SELECT SUM(price * quantity) AS total_revenue, product_name
FROM sales_data
GROUP BY product_name;

-- 6. Products with more than 20 units sold
SELECT SUM(quantity) AS total_sales, product_name
FROM sales_data
GROUP BY product_name
HAVING SUM(quantity) > 20;

-- 7. Revenue per category in 'North' region
SELECT SUM(price), category, region
FROM sales_data
WHERE region = 'North'
GROUP BY category;

-- 8. Regions where avg price > 10000
SELECT AVG(price) AS avg_price, region 
FROM sales_data
GROUP BY region 
HAVING AVG(price) > 10000.00;

-- 9. Categories with >2 distinct products
SELECT category, COUNT(DISTINCT(product_name)) AS dis 
FROM sales_data 
GROUP BY category
HAVING dis > 2;

-- 10. Product-wise sales in Jan 2024
SELECT product_name, SUM(quantity) AS total_sales
FROM sales_data
WHERE sale_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY product_name;

-- 11. Products starting with 'S' and revenue
SELECT product_name, SUM(price * quantity) AS total_revenue
FROM sales_data
WHERE product_name REGEXP '^S'
GROUP BY product_name;

-- 12. Products sold in Q1 2024 with total quantity > 50
SELECT product_name, SUM(quantity) AS total
FROM sales_data
WHERE sale_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY product_name
HAVING total > 50;

-- 13. Revenue by product per region (sorted)
SELECT SUM(price * quantity) AS revenue, product_name, region
FROM sales_data
GROUP BY region, product_name 
ORDER BY region, revenue DESC;

-- 14. Categories with avg quantity > 8
SELECT AVG(quantity) AS average, category
FROM sales_data
GROUP BY category
HAVING average > 8;

-- 15. Count of sales where product name contains 'Pro'
SELECT product_name, COUNT(*)
FROM sales_data 
WHERE product_name REGEXP 'pro'
GROUP BY product_name;

-- 16. Products with revenue between ₹1L–₹3L
SELECT product_name, SUM(price * quantity) AS total_revenue 
FROM sales_data
GROUP BY product_name 
HAVING total_revenue BETWEEN 100000.00 AND 300000.00;

-- 17. Regions with >3 distinct products
SELECT region, COUNT(DISTINCT product_name) AS num
FROM sales_data 
GROUP BY region
HAVING num > 3;

-- 18. Products sold in Q1 2024 with quantity > 30
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales_data
WHERE sale_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY product_name 
HAVING total_quantity > 30;

-- 19. Products with 'Pro' and revenue > ₹50K
SELECT product_name, SUM(price * quantity) AS total_revenue 
FROM sales_data 
WHERE product_name REGEXP 'pro'
GROUP BY product_name 
HAVING total_revenue > 50000.00;

-- 20. Categories with avg quantity > 8
SELECT category, AVG(quantity) 
FROM sales_data
GROUP BY category 
HAVING AVG(quantity) > 8;

-- 21. Products starting with 'S' and quantity > 20
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales_data
WHERE product_name REGEXP '^S'
GROUP BY product_name 
HAVING total_quantity > 20;

-- 22. Revenue by region and category ≥ ₹80K
SELECT region, category, SUM(price * quantity) AS total_revenue 
FROM sales_data
GROUP BY region, category 
HAVING total_revenue >= 80000.00;

-- 23. Regions where avg price is between ₹5000–₹20000
SELECT region, AVG(price) AS average 
FROM sales_data
GROUP BY region 
HAVING average BETWEEN 5000.00 AND 20000.00;

-- 24. Categories with products ending in 'X' and total quantity > 10
SELECT category, SUM(quantity) AS total_quantity
FROM sales_data
WHERE product_name REGEXP 'x$'
GROUP BY category
HAVING total_quantity > 10;

-- 25. Regions where total quantity NOT between 30 and 100
SELECT region, SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY region 
HAVING total_quantity NOT BETWEEN 30 AND 100;

-- 26. Categories where revenue exceeds ₹1.5L
SELECT category, SUM(price * quantity) AS total_revenue
FROM sales_data
GROUP BY category 
HAVING total_revenue > 150000.00;

-- 27. Products with exactly 2-word names (e.g., 'Tablet Mini')
SELECT product_name, COUNT(*) AS total_count
FROM sales_data 
WHERE product_name REGEXP '^[A-Za-z]+ [A-Za-z]+$' 
GROUP BY product_name;
```
