-- task 1
select
    *,
    case
        when amount < 1000 then 'low'
        when amount < 10000 then 'medium'
        else 'high'
    end as segment
from
    orders;

-- task 2
select
    *,
    case
        when age < 18 then 'minor'
        when age < 60 then 'adult'
        else 'senior'
    end as segment
from
    clients;

-- task 3
select
    *,
    case
        when status in ('done', 'ok') then 'success'
        when status in ('error', 'fail') then 'failed'
        else 'unknown'
    end as business_status
from
    payments;

-- task 4
select
    *,
    case
        when is_vip = 'true' then 'high'
        when hours_left < 5 then 'medium'
        else 'low'
    end as priority
from
    tickets;

-- task 5
select
    *,
    case channel_code
        when 'w' then 'web'
        when 'm' then 'mobile'
        else 'partner'
    end as channel_name
from
    sales;

-- task 6
select *,
       case
           when date '2026-04-30' - activation_date <= 7 then 'week'
           when date '2026-04-30' - activation_date <= 30 then 'month'
           when date '2026-04-30' - activation_date <= 365 then 'year'
           else 'old'
       end as activation_segment
from clients;

-- task 7
select *,
       case when days_overdue >= 30 or debt_amount >= 5000 then 'high'
            when days_overdue > 0 then 'medium'
            else 'low' end as risk_group
from debts;

-- task 8
select *,
       case when orders_cnt = 0 then 'no_orders'
            when orders_cnt between 1 and 3 then 'new'
            else 'regular' end as client_type
from client_orders;

-- task 9
select *,
       case when stock_cnt = 0 then 'out_of_stock'
            when stock_cnt < 10 then 'low_stock'
            else 'enough' end as stock_status
from stock;

-- task 10
select sum(case when status = 'success' then amount end) as success_total,
    sum(case when status = 'fail' then amount end) as fail_total
from payments ;
