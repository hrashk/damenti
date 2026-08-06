-- task 1
select *, sum(amount) over (partition by client_id order by operation_dt) as running_total
from transactions;

-- task 2
select *, 1.0 * revenue / sum(revenue) over () as share
from category_sales;

-- task 3
select *, 1.0 * revenue / sum(revenue) over (partition by category) as share
from product_sales;

-- task 4
select *, sum(revenue) over (order by dt rows between 2 preceeding and current row) as three_sum
from daily_sales;

-- task 5
select *, sum(amount) over (partition by account_id order by operation_dt) as balance
from operations;

-- task 6
select *, sum(amount) over (partition by client_id) as total_amount
from orders;

-- task 7
select *, sum(amount) over (partition by date_trunc('month', order_dt) order by order_dt) as running_amount
from orders;

-- task 8
select *, sum(points) over (partition by user_id order by earned_at) as running_points
from points;

-- task 9
select *, sum(qty_delta) over (partition by sku_id order by movement_dt) as balance
from stock_movements;

-- task 10
select order_dt, sum(amount) as daily_revenue, sum(sum(amount)) over (order by order_dt) as running_revenue
from orders
group by order_dt
;
