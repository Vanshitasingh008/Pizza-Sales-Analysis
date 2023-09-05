select* from pizza_sales;

#Q1 Total Revenue
select sum(total_price) as total_revenue
from pizza_sales;

#Q2 Average Order value
select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from pizza_sales;

#Q3 Total Pizzas Sold
select sum(quantity) as Total_Pizzas_sold
from pizza_sales;

#Q4 Total Orders
SELECT  COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

#Q5  Average Pizzas Per Order
select sum(quantity)/COUNT(DISTINCT order_id) as Avg_Pizzas_Per_Order from pizza_sales;

#Q Daily Trend For Total Orders 
select order_date ,dayname(order_date) as order_day, count(distinct order_id)
from pizza_sales
group by order_date;

#Q Monthly Trend For Orders
select order_date ,extract(month from order_date) as order_day, count(distinct order_id)
from pizza_sales
group by order_date;

#Q % Of Sales By Pizza category
SELECT pizza_category,
SUM(total_price) AS total_sales,
ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS percentage_of_sales
FROM pizza_sales
GROUP BY pizza_category;

#Q % Of Sales By Pizza Size
select Pizza_size, sum(total_price) as Total_Sales,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as Percent_Of_Sales
from Pizza_sales
group by pizza_size;

#Q Total Pizzas Sold By Pizza Category 
select pizza_category, sum(quantity) as Total_quantity_sold
from pizza_sales
group by pizza_category;

#Q Top 5 Pizzas By Revenue
select Pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc
limit 5;

#Q Bottom 5 Pizzas By Revenue
select Pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales 
limit 5;

#Q Top 5 Pizzas By Quantity 
select Pizza_name, sum(Quantity) as total_Quantity_Sold
from pizza_sales
group by pizza_name
order by total_Quantity_sold desc
limit 5;

#Q bottom 5 Pizzas By Quantity
select Pizza_name, sum(Quantity) as total_Quantity_Sold
from pizza_sales
group by pizza_name
order by total_Quantity_sold 
limit 5;

#Q Top 5 Pizzas By Total Orders
select Pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by total_Orders desc
limit 5;

#Q Bottom 5 Pizzas By Total Orders 
select Pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by total_Orders
limit 5;







