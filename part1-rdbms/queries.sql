### ✅ Q1: Customers from Mumbai with total order value

sql
-- Q1
SELECT c.customer_id, c.customer_name, SUM(o.total_amount) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;


---

### ✅ Q2: Top 3 products by quantity sold

sql
-- Q2
SELECT p.product_name, SUM(oi.quantity) AS total_qty
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 3;


---

### ✅ Q3: Sales reps and unique customers handled

sql
-- Q3
SELECT rep_id, COUNT(DISTINCT customer_id) AS unique_customers
FROM orders
GROUP BY rep_id;


---

### ✅ Q4: Orders with value > 10,000

sql
-- Q4
SELECT *
FROM orders
WHERE total_amount > 10000
ORDER BY total_amount DESC;


---

### ✅ Q5: Products never ordered

sql
-- Q5
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

