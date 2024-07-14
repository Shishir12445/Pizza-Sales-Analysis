CREATE DATABASE PIZZA;
USE PIZZA;
select * from  pizza_sales;

-- Total Sales and Revenue:
SELECT 
    ROUND(SUM(total_price)) AS TotalSales, 
    order_date AS ORDER_DATE, 
    pizza_category, 
    pizza_size  
FROM 
    pizza_sales
GROUP BY 
    order_date, 
    pizza_category, 
    pizza_size;

-- Sales by Pizza Category:
SELECT pizza_category, SUM(quantity) AS TotalQuantity, ROUND(SUM(total_price)) AS TotalSales,  pizza_size, order_date AS ORDER_DATE
FROM pizza_sales

GROUP BY pizza_category,    order_date, 
    pizza_category, 
    pizza_size ;



-- Top-selling Pizzas
SELECT pizza_name, pizza_category, SUM(quantity) AS TotalQuantity, ROUND(SUM(total_price)) AS TotalSales,  pizza_size, order_date AS ORDER_DATE
FROM pizza_sales 
GROUP BY pizza_name, pizza_category,    order_date, 
    pizza_category, 
    pizza_size 
ORDER BY TotalSales DESC
LIMIT 10;

-- Customer Segmentation and Purchasing Behavior

SELECT 
    ROUND(SUM(total_price)) AS TotalSales, 
    order_date AS ORDER_DATE, 
    pizza_category, 
    pizza_size  ,
    COUNT(order_id) AS TotalOrders
FROM 
    pizza_sales
GROUP BY 
    order_date, 
    pizza_category, 
    pizza_size;