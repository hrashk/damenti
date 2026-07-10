-- task 1
select event_id ,location_id,  risk_level,
	rank() over(partition by location_id order by risk_level desc) as risk_rank
from events
order by location_id , risk_level desc
;

-- task 2
with r as (
	select *,
		row_number() over (partition by species order by strength_level desc, name) as rn
	from characters
)
select species, name, strength_level , rn
from r
where rn <= 2
order by species, strength_level desc, name
;

-- task 3
select name, alignment, strength_level,
	avg(strength_level) over (partition by alignment) as avg_strength
from characters
order by alignment, name
;

-- task 4
with s as (
	select *,
		avg(strength_level) over (partition by species) as avg_strength
	from characters
)
select name, species, strength_level
from s
where strength_level > avg_strength 
order by species, name
;

-- task 5
select quest_id , issued_by , reward_gold ,
	1.0 * reward_gold / sum(reward_gold) over (partition by issued_by ) as share_in_issuer
from quests
where reward_gold is not null
order by issued_by 
;

-- task 6
with prev as (
	select * ,
		 lag(reward_gold) over (partition by issued_by order by quest_id  ) as lag_reward
	from quests
	where reward_gold is not null
)
select quest_id , issued_by , reward_gold , reward_gold - coalesce(lag_reward, 0) as reward_diff
from prev
order by issued_by ,  quest_id 
;

-- task 7
with c as (
	select start_day, count(*) as cnt
	from events
	group by start_day
)
select *,
	sum(cnt) over (order by start_day) as cum_cnt
from c
order by start_day 
;

-- task 8
select event_type, 1.0 * count(*) over (partition by event_type) / count(*) over () as share
from events
order by event_type 
;

-- task 9
with r as (
	select *,
		row_number() over (partition by location_id order by risk_level desc) as rn
	from events
)
select location_id , event_id , risk_level , rn
from r
where rn = 1
order by location_id
;

-- task 10
select *,
	row_number() over (partition by issued_by order by quest_id)  as rn
from quests
order by issued_by , quest_id 
;
