-- task 1
select *,
	'2001-01-01'::date + (start_day-1) as start_date,
	date '2001-01-01' + (end_day-1) as end_date
from events e
where end_day is not null
;

-- task 2
with sd as (
	select *,
		'2001-01-01'::date + (start_day-1) as start_date
	from events e
)
select event_id, event_type , start_date 
from sd
where date_trunc('month', start_date) = date '2001-01-01'
;

-- task 3
with sd as (
	select *,
		'2001-01-01'::date + (start_day-1) as start_date
	from events e
)
select event_id, event_type , start_date , extract(dow from start_date) as day_of_week
from sd
order by start_date, event_id
;

-- task 4
select *, end_day  - start_day + 1 as duration
from events
where end_day is not null
order by duration desc, event_id
limit 3
;

-- task 5
select *
from events
where risk_level >= 7 and start_day > 5
;

-- task 6
with sd as (
	select *,
		'2001-01-01'::date + (start_day-1) as start_date,
		extract(dow from '2001-01-01'::date + (start_day-1)) as dow
	from events e
)
select event_id, event_type, start_date, dow
from sd
where dow in (0, 6)
order by start_date, event_id
;

-- task 7
select '2001-01-01'::date + (start_day-1) as start_date,
	count(*) as events_cnt,
	sum(risk_level) as risk_sum
from events
group by start_date 
;

-- task 8
select event_id, end_day - start_day + 1 as duration
from events
where end_day  is not null and end_day - start_day + 1 >= 2
;

-- task 9
select date '2001-01-01' + (start_day-1) as start_date,
	count(*) as events_cnt
from events
group by start_date 
order by events_cnt desc, start_date
limit 5
;

-- task 10
select event_id , event_type ,
	date '2001-01-01' + (start_day-1) + interval '12 hours' as start_dt_noon
from events
;