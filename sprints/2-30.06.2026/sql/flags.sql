-- task 1
select user_id
from views
group by user_id 
having sum(case when video_id = 101 then 1 else 0 end) > 0
   and sum(case when video_id = 202 then 1 else 0 end) = 0;

-- task 2
select user_id
from events
group by user_id
having sum(case when event_type = 'purchase' then 1 else 0 end) > 0
   and sum(case when event_type = 'refund' then 1 else 0 end) = 0;

-- task 3
select *, case when paid_dt is null or paid_dt > due_dt then 1 else 0 end as is_overdue
from payments;

-- task 4
select student_id
from marks
group by student_id
having sum(case when mark = 5 then 1 else 0 end) > 0
   and sum(case when mark = 2 then 1 else 0 end) = 0;

-- task 5
select client_id,
	max(case when operation_type = 'credit' then 1 else 0 end) as has_credit,
	max(case when operation_type = 'debit' then 1 else 0 end) as has_debit
from operations
group by client_id;

-- task 6
select user_id
from events
group by user_id
having max(case when event_type = 'visit' then 1 else 0 end) = 1
   and max(case when event_type = 'pay' then 1 else 0 end) = 1;

-- task 7
select client_id
from activity
group by client_id
having max(case when channel = 'web' then 1 else 0 end) = 1
   and max(case when channel = 'mobile' then 1 else 0 end) = 1;

-- task 8
select client_id , case when sum(amount) >= 1000 then 1 else 0 end as reached
from orders
group by client_id;

-- task 9
select user_id
from events
group by user_id
having sum(case when event_type = 'registration' then 1 else 0 end) > 0
   and sum(case when event_type = 'first_order' then 1 else 0 end) = 0;

-- task 10
with rr as (
	select *, row_number() over (partition by client_id order by order_dt, order_id) as rn
	from orders
)
select client_id, order_id, order_dt, case when rn = 1 then 1 else 0 end as is_first
from rr;

