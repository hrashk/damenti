-- task 1
with rr as (
    select *, dense_rank() over (partition by dep_id order by salary desc) as rnk
    from employees
)
select *
from rr
where rnk = 2;

-- task 2
| name | score | rank | dense_rank |
|------|-------|------|------------|
| A    | 100   | 3    | 2          |
| B    | 90    | 1    | 1          |
| C    | 90    | 1    | 1          |

select *,
    rank() over (order by score) as rnk,
    dense_rank() over (order by score) as dense_rnk
from scores;

-- task 3
with rr as (
    select *, rank() over (order by revenue desc) as rnk
    from products
)
select *
from rr
where rnk <= 3;

-- task 4
select *, dense_rank() over (order by points desc) as place
from teams;

-- task 5
with rr as (
    select *, dense_rank() over (order by total_amount desc) as rnk
    from client_totals
)
select *
from rr where rnk = 3;

-- task 6
select *, dense_rank() over (partition by month_dt order by revenue desc) as rnk
from sales;

-- task 7
with rr as (
    select *, dense_rank() over (order by score desc) as rnk
    from results
)
select *
from rr
where rnk <= 2;

-- task 8
select category, sum(amount) as revenue, dense_rank() over (order by sum(amount) desc) as rnk
from orders
group by category;

-- task 9
with rr as (
    select *, rank() over (order by score desc) as rnk
    from scores
)
select *
from rr where rnk = 1;

-- task 10
with rr as (
    select *, dense_rank() over (order by value desc) as rnk
    from numbers
)
select distinct value from rr where rnk = 2;
