-- task 1
select client_id from web_clients
union
select client_id from app_clients;

-- task 2
select user_id, event_name from web_events
union all
select user_id, event_name from mobile_events;

-- task 3
select client_id, city from crm_clients
union
select client_id, city from billing_clients;

-- task 4
select cast(user_id as int) from old_users
union
select user_id from new_users;

-- task 5
select user_id from payments where date_part('month', payment_dt) = 1
union
select user_id from refunds where date_part('month', refund_dt) = 2;

-- task 6
select num from a union select num from b order by num;

-- task 7
select 'online' as source, sale_id, amount from online_sales
union all
select 'offline' as source, sale_id, amount from offline_sales;

-- task 8
select client_id from email_clients
intersect
select client_id from push_clients;

-- task 9
select client_id from all_clients
except
select client_id from blocked_clients;

-- task 10
with all_sales as (
    select sale_dt, amount from sales_2025
    union all
    select sale_dt, amount from sales_2026
)
select sale_dt, sum(amount) as total_amount
from all_sales
group by sale_dt
order by sale_dt;
