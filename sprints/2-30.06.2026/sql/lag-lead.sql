-- task 1
select month_dt, revenue,
    revenue - lag(revenue, 1, 0) over (order by month_dt) as revenue_diff
from monthly_revenue;

-- task 2
select client_id, order_id, order_dt,
    lead(order_dt) over (partition by client_id order by order_dt) as next_order_dt
from orders;

-- task 3
select product_id, changed_at, price,
    lag(price) over (partition by product_id order by changed_at) as prev_price
from price_history;

-- task 4
select dt, metric,
    100.0 * (metric - lag(metric) over (order by dt)) /
    nullif(lag(metric) over (order by dt), 0) as metric_change_pct
from daily_metrics;

-- task 5
with prev as (
    select user_id, event_dt,
        lag(event_dt) over (partition by user_id order by event_dt)  as prev_event_dt
    from events
)
select *
from prev
where event_dt - prev_event_dt > 7;

-- task 6
with prev as (
    select ticket_id, changed_at, status,
        lag(status) over (partition by ticket_id order by changed_at) as prev_status
    from ticket_status
)
select *
from prev
where prev_status is null or status <> prev_status;

-- task 7
select client_id, visit_dt,
    lead(visit_dt) over (partition by client_id order by visit_dt) - visit_dt as days_until_next_visit
from visits;

-- task 8
select sku_id, stock_dt, stock_cnt, 
    stock_cnt - lag(stock_cnt) over (partition by sku_id order by stock_dt) as stock_change
from stock;

-- task 9
with prev as (
    select dt, amount, lag(amount) over (order by dt) as prev_amount
    from revenue
)
select *
from prev
where amount < prev_amount;

-- task 10
with nn as (
select event_dt, lead(event_dt) over (order by event_dt) as next_event_dt
from calendar_events
)
select *
from nn
where next_event_dt - event_dt <> 1;

