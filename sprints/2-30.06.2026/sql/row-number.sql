-- task 1
with rr as (
    select *, row_number() over (partition by entity_id order by event_dt desc) as rn
    from history
)
select *
from rr
where rn = 1;

-- task 2
with rr as (
    select *, row_number() over (partition by client_id order by order_dt) as rn
    from orders
)
select *
from rr
where rn <= 3;

-- task 3
with rr as (
    select *, row_number() over (partition by user_id, event_id order by loaded_dt desc) as rn
    from events
)
select *
from rr
where rn = 1;

-- task 4
with rr as (
    select *, row_number() over (partition by user_id order by amount desc, payment_id) as rn
    from payments
)
select *
from rr
where rn = 1;

-- task 5
with rr as (
    select *, row_number() over (partition by client_id order by order_dt, order_id) as rn
    from orders
)
select * from rr where rn = 1;

-- task 6
with rr as (
    select *, row_number() over (partition by ticket_id order by changed_at desc) as rn
    from ticket_status
)
select ticket_id, status
from rr
where rn = 1;

-- task 7
with rr as (
    select *, row_number() over (partition by email order by created_at desc) as rn
    from users
)
select *
from rr
where rn = 1;

--- task 8
with rr as (
    select *, row_number() over (partition by client_id order by order_dt, order_id) as rn
    from orders
)
select *
from rr
where rn = 2;

-- task 9
with rr as (
    select *, row_number() over (partition by client_id order by valid_from desc) as rn
    from address_history
    where valid_from <= date '2026-04-30'
)
select *
from rr
where rn = 1;

-- task 10
with rr as (
    select *, row_number() over (partition by client_id order by amount desc, transaction_id) as rn
    from transactions
)
select *
from rr
where rn = 1;
