# 🍕 Pizza Sales Analysis Project using MySQL

This project performs detailed data analysis on pizza sales using MySQL. It covers metrics like total revenue, most popular pizzas, size preferences, time-based order trends, and category contributions.

---



```sql
-- 📌 Create Database
CREATE DATABASE pizza_project;
USE pizza_project;

-- ✅ Total Number of Orders
SELECT COUNT(DISTINCT order_id) AS 'Total Orders' FROM orders;

-- 💰 Total Revenue from Pizza Sales
SELECT CAST(SUM(od.quantity * p.price) AS DECIMAL(10,2)) AS 'Total Revenue'
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id;

-- 🧀 Highest Priced Pizza
SELECT pizza_types.name AS 'Pizza Name', CAST(pizzas.price AS DECIMAL(10,2)) AS 'Price'
FROM pizzas
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- 📏 Most Common Pizza Size Ordered
SELECT pizzas.size, COUNT(DISTINCT order_id) AS 'No of Orders', SUM(quantity) AS 'Total Quantity Ordered' 
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY COUNT(DISTINCT order_id) DESC;

-- 🔝 Top 5 Most Ordered Pizza Types
SELECT pizza_types.name AS 'Pizza', SUM(quantity) AS 'Total Ordered'
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name 
ORDER BY SUM(quantity) DESC
LIMIT 5;

-- 🧾 Quantity by Pizza Category
SELECT pizza_types.category, SUM(quantity) AS 'Total Quantity Ordered'
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category 
ORDER BY SUM(quantity) DESC;

-- 🕐 Distribution of Orders by Hour
SELECT DATE_FORMAT(time, '%H') AS 'Hour of the Day', COUNT(DISTINCT order_id) AS 'No of Orders'
FROM orders
GROUP BY DATE_FORMAT(time, '%H')
ORDER BY COUNT(DISTINCT order_id) DESC;

-- 🍽️ Category-wise Pizza Distribution
SELECT category, COUNT(DISTINCT pizza_type_id) AS 'No of Pizzas'
FROM pizza_types
GROUP BY category
ORDER BY 'No of Pizzas' DESC;

-- 📅 Average Pizzas Ordered per Day
WITH cte AS (
  SELECT orders.date AS 'Date', SUM(order_details.quantity) AS 'Total'
  FROM order_details
  JOIN orders ON order_details.order_id = orders.order_id
  GROUP BY orders.date
)
SELECT AVG(Total) AS 'Avg Pizzas per Day' FROM cte;

-- 💸 Top 3 Revenue Generating Pizzas
SELECT pizza_types.name, SUM(order_details.quantity * pizzas.price) AS 'Revenue'
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY Revenue DESC
LIMIT 3;

-- 📊 Revenue Percentage by Category
SELECT pizza_types.category, 
CONCAT(ROUND(SUM(order_details.quantity * pizzas.price) * 100 / 
(SELECT SUM(order_details.quantity * pizzas.price)
 FROM order_details
 JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id), 2), '%') AS 'Revenue Contribution'
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category;

-- 📈 Cumulative Revenue Over Time
WITH daily_revenue AS (
  SELECT orders.date, SUM(order_details.quantity * pizzas.price) AS revenue
  FROM order_details
  JOIN orders ON order_details.order_id = orders.order_id
  JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
  GROUP BY orders.date
)
SELECT date, revenue, SUM(revenue) OVER (ORDER BY date) AS cumulative_revenue
FROM daily_revenue;

-- 🥇 Top 3 Pizzas by Category Based on Revenue
WITH cte AS (
  SELECT category, name, SUM(quantity * price) AS revenue
  FROM order_details
  JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
  JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
  GROUP BY category, name
),
ranked AS (
  SELECT *, RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
  FROM cte
)
SELECT * FROM ranked WHERE rnk <= 3;
