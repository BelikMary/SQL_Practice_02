-- 2. Общее количество единиц товара, проданных компанией
select count(*) as all_amount
from sales

-- 3.
-- Общая сумма продаж в долларах для каждого штата С НЕИЗВЕСТНЫМИ ШАТАТМИ
select c.state, sum(s.sales_amount) as summary_sales
from sales s 
join customers c on s.customer_id = c.customer_id
group by state
order by summary_sales desc;


-- Общая сумма продаж в долларах для каждого штата БЕЗ НЕИЗВЕСТНЫХ ШТАТОВ
select c.state, sum(s.sales_amount) as summary_sales
from sales s 
join customers c on s.customer_id = c.customer_id
where c.state is not null
group by state
order by summary_sales desc;


-- 4. Пять лучших дилерских центров по количеству проданных единиц (не учитывать интернет продажи)
select s.dealership_id, sum(s.sales_amount) as sum_amount_dealerships
from sales s
where s.channel ='dealership'
group by s.dealership_id 
order by sum_amount_dealerships desc
fetch first 5 rows only;


-- 5.
-- Средняя сумма продаж для каждого канала по product_id
select product_id, avg(sales_amount) as avg_sales_amount
from sales s 
group by product_id 
order by product_id;


-- Средняя сумма продаж для каждого канала по channel
select channel, avg(sales_amount) as avg_sales_amount
from sales s 
group by channel;


-- Средняя сумма продаж для каждого канала по dealership_id
select s.dealership_id, avg(s.sales_amount) as avg_sales_amount
from sales s
where s.channel ='dealership'
group by s.dealership_id 
order by avg_sales_amount desc;


-- Средняя сумма продаж для каждого канала по channel и product_id
select channel, product_id, avg(sales_amount) as avg_sales_amount
from sales s 
where channel ='dealership' 
group by channel, product_id 
order by channel, product_id;

