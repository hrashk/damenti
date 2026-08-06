-- task 1
select category, count(*) as order_count, sum(amount) as total_amount
from orders
group by category;

-- task 2
select user_id
from orders
group by user_id
having count(distinct date_trunc('month', order_dt)) >= 3;

-- task 3
select tariff, avg(amount) as avg_amount
from payments
group by tariff
having count(*) > 1;

-- task 4
select order_id, count(distinct sku_id) as unique_products
from order_items
group by order_id;

-- task 5
select client_id,
    sum(case when status = 'success' then 1 else 0 end) as success_cnt,
    sum(case when status = 'fail' then 1 else 0 end) as fail_cnt
from payments
group by client_id;

-- task 6
select client_id, max(order_dt) as last_order_date, min(order_dt) as first_order_date
from orders
group by client_id;

-- task 7
select date_trunc('month', order_dt) as order_month, sum(amount) as total_amount
from orders
group by date_trunc('month', order_dt);

-- task 8
select client_id
from orders
group by client_id
having sum(amount) > 1000;

-- task 9
select category, sum(amount) as total_amount,
    100.0 * sum(amount) / (select sum(amount) from orders) as percentage
from orders
group by category;

-- task 10
select case when amount > 1000 then 'high' else 'low' end as amount_category, count(*) as order_count
from orders
group by case when amount > 1000 then 'high' else 'low' end;
