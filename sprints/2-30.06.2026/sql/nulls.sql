-- task 1
select *
from accounts
where close_dt is null;

-- task 2
select account_id, coalesce(balance, 0) as balance
from accounts;

-- task 3
select count(*) as total_accounts, count(phone) as phone_count
from accounts;

-- task 4
select client_id
from clients
except
select client_id
from orders;

-- task 5
select client_id from clients
except
select client_id from blacklist;

-- alternative
select client_id
from clients
where client_id not in (
  select client_id
  from blacklist
  where client_id is not null
);

-- task 6
select coalesce(city, 'unknown') as city, count(*) as cnt
from clients c 
group by coalesce(city, 'unknown');

-- task 7
select sale_id,
       price * qty - coalesce(discount, 0) as result
from sales;

-- task 8
select *
from tickets
where status = 'error' or status is null;

-- task 9
select *
from changes
where old_value is distinct from new_value;

-- task 10
select *, case when email is null then 0 else 1 end as has_email
from clients;
