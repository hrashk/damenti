-- task 1
select
    s.*,
    p.price
from
    sales s
    join products p on s.product_id = p.product_id
    and s.sale_dt between p.valid_from and p.valid_to;

-- task 2
select
    p.*,
    r.rate
from
    payments p
    join commission_rules r on p.amount >= r.amount_from
    and p.amount < r.amount_to;

-- task 3
select
    o.*,
    o.amount * r.rate as amount_in_rub
from
    operations o
    join rates r on o.currency = r.currency
    and o.operation_dt = r.rate_dt;

-- task 4
select
    o.*,
    s.segment
from
    orders o
    join client_segments s on o.client_id = s.client_id
    and o.order_dt >= s.valid_from
    and o.order_dt < s.valid_to;

-- task 5
select
    o.*
from
    orders o
    join promos p on o.promo_code = p.promo_code
    and o.order_dt >= p.date_from
    and o.order_dt < p.date_to;

-- task 6
select
    b.*
from
    bookings b
    join repairs r on b.room_id = r.room_id
    and b.start_ts < r.end_ts
    and b.end_ts > r.start_ts;

-- task 7
select
    su.user_id,
    crm.user_id,
    lower(su.email) as email
from
    site_users su
    join crm_users cu on lower(su.email) = lower(cu.email);

-- task 8
select
    o.*,
    d.discount_pct
from
    orders o
    join discunts d on o.amount >= d.min_amount
    and o.amount < d.max_amount;

-- task 9
select
    o.*,
    ed.department
from
    operations o
    join employee_dept ed on o.employee_id = ed.employee_id
    and o.operation_dt >= ed.valid_from
    and o.operation_dt < ed.valid_to;

-- task 10
select
    c.*,
    o.*
from
    clients c
    left join orders o on c.client_id = o.client_id
    and o.order_dt >= date '2026-04-01'
    and o.order_dt < date '2026-05-01';
