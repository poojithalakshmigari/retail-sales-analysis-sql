-- Create Table
CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_name VARCHAR(100),
    region VARCHAR(50),
    sales_amount DECIMAL(10,2)
);

-- Total Revenue
SELECT SUM(sales_amount) AS total_revenue
FROM sales;

-- Monthly Revenue
SELECT MONTH(order_date) AS month,
       SUM(sales_amount) AS monthly_revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- Top 5 Products by Sales
SELECT product_name,
       SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- Region-wise Sales
SELECT region,
       SUM(sales_amount) AS regional_sales
FROM sales
GROUP BY region;

-- Customer Order Count
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_id
ORDER BY total_orders DESC;
