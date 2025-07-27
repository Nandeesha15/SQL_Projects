# 🍕 Pizza Shop Sales Analysis using MySQL

This project presents a comprehensive analysis of a pizza shop’s sales and order trends using SQL. The analysis is performed entirely on MySQL and includes insights such as total revenue, most popular pizza types, size preferences, and revenue contributions.

## 📂 Database: `pizza_project`

### 📁 Tables Used:
- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

---

## 📌 Key Insights & Queries

### ✅ Total Number of Orders
```sql
SELECT COUNT(DISTINCT order_id) AS 'Total Orders' FROM orders;

