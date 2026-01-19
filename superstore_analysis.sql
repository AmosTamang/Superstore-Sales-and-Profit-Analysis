CREATE DATABASE retail;
USE retail;
create table sell(
ship_mode VARCHAR(50),
segment VARCHAR(50),
country VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
postal_code VARCHAR(20),
region VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
sales DECIMAL(10,4),
quantity TINYINT,
discount decimal(4,2),
profit decimal (10,4)
);
describe sell;
select count(*) from sell where profit < 0;
select * from sell limit 5;
/*
SQL Question 1: Overall Business Performance
*/
select ROUND(sum(sales),2) as total_sales, 
ROUND(sum(profit),2) as total_profits, 
ROUND ((sum(profit) / sum(sales)) * 100,2) as profit_margin
from sell;
/*
SQL Question 2: Sales and Profit by State
*/
select state, 
round(sum(sales),2) as total_sales, 
round(sum(profit),2) as total_profit
from sell
group by state
order by total_s desc;
/*
SQL Question 3: Sales and loss by State
*/
select state,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit
from sell
group by state
having sum(profit)< 0
order by total_s asc;
/*
SQL Question 4: City with highest orders
*/
select city, count(*) as Or_der
from sell
group by city
order by count(*) desc
limit 10;
/*
SQL Question 5: Discount Impact Analysis
*/
select discount,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(avg(profit),2) as profit_avg
from sell
group by discount
order by discount;









