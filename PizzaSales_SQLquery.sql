
--Total Revenue
select sum(total_price) as Total_Revenue from Pizza_Sales
 
 --Average Order Value
select sum(total_price)/count(distinct order_id) as Avg_Order_Value from Pizza_Sales

--Total Pizzas Sold
select sum(quantity) as Total_Pizza_Sold from Pizza_Sales

--Total Orders
select count(distinct order_id) as Total_Orders from Pizza_Sales

--Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2))/count(distinct order_id) as decimal(10,2)) as Avg_Pizzas_per_Order from Pizza_Sales

--Daily Trend for Total Orders
select datename(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from Pizza_Sales
Group by datename(DW, order_date)

--Monthly Trend for Total Orders
select datename(Month, order_date) as Month_Name, count(distinct order_id) as Total_orders
from Pizza_Sales
group by datename(Month, order_date)
order by Total_orders desc

--% of Sales by pizza category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100/(select sum(total_price) from Pizza_Sales)as decimal(10,2)) as Percentage_Sales
from Pizza_Sales
group by pizza_category

--% of Sales by pizza size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100/(select sum(total_price) from Pizza_Sales) as decimal (10,2)) as Percentage_Sales
from Pizza_Sales
group by pizza_size
order by Percentage_Sales desc

--Total pizzas sold by pizza category
select pizza_category, sum(quantity) as Total_Quantity_sold
from Pizza_Sales
group by pizza_category
order by Total_Quantity_sold desc

--Top 5 pizzas by revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue from Pizza_Sales
group by pizza_name
order by Total_Revenue desc

--Bottom 5 pizzas by revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue from Pizza_Sales
group by pizza_name
order by Total_Revenue 

--Top 5 pizzas by quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity from Pizza_Sales
group by pizza_name
order by Total_Quantity desc

--Bottom 5 pizzas by quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity from Pizza_Sales
group by pizza_name
order by Total_Quantity

--Top 5 pizzas by total orders
select top 5 pizza_name, count(distinct order_id) as Total_Qrders from Pizza_Sales
group by pizza_name
order by Total_Qrders desc

--Bottom 5 pizzas by total orders
select top 5 pizza_name, count(distinct order_id) as Total_Qrders from Pizza_Sales
group by pizza_name
order by Total_Qrders 
