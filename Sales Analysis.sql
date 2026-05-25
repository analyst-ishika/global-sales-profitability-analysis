SELECT * FROM project.sales;

-- GLOBAL SUPERSTORE SALES & PROFITABILITY ANALYTICAL SCRIPT

-- Question 1: What are the total net sales, total net profit, and average discount percentage across all non-returned orders?
select 
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
order by total_profit desc;


-- Question 2: How have net sales, net profit, and discount rates evolved year-over-year, and which year was the most profitable?
select 
    year,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 3: Which months historical performance drives the highest net volume and profitability for the store?
select 
    month_name,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 4: Which shipping mode generates the highest net sales and profitability?
select 
    ship_mode,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 5: Which customer segment contributes the most to overall net sales and net profit?
select 
    segment,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 6: What is the sales and profitability breakdown by Country/Region for non-returned orders?
select 
    `country/region`,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 7: Which individual cities generate the highest net profit margins and sales volumes?
select 
    city,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 8: Which geographic region is performing the best in terms of net profit generation?
select 
    region,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 9: What are the top core product categories ranked by total net profit?
select 
    category,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 10: Which product sub-categories are the primary drivers of revenue and margin, and which are lagging?
select 
    `sub-category`,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(avg(discount) * 100,2) as avg_discount
from sales
where returned = "No"
group by 1
order by total_profit desc;


-- Question 11: What is the total volume of transaction lines processed per core category across different months?
select 
    month_name,
    category,
    count(*) as transaction_count
from sales
group by 1,2;


-- Question 12: What is the baseline average promotional discount percentage applied to each core product category?
select 
    category,
    avg(discount) * 100 as base_avg_discount
from sales
group by 1;