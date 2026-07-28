-- task 1
select event_id, risk_level,
	case when risk_level >= 8 then 1 else 0 end as is_high_risk
from events
;

-- task 2
select l.location_id , sum(case when e.risk_level >= 8 then 1 else 0 end) as high_risk_cnt
from locations l join events e on l.location_id  = e.location_id 
group by l.location_id  
order by l.location_id 
;

-- task 3
select species,
	count(*) as cnt,
	sum(is_magical ) as magical_cnt,
	sum(case when strength_level >= 8 then 1 else 0 end) as dangerous_cnt
from "characters"
group by species
order by species
;

-- task 4
select issued_by,
	count(*) as cnt,
	sum(case when success = 1 then 1 else 0 end ) as success_cnt,
	sum(case when coalesce(success, 0) = 0 then 1 else 0 end) as fail_or_unknown
from quests
group by issued_by
order by issued_by
;

-- task 5
select quest_id , case when reward_gold is null then 0 else reward_gold end as reward,
	case
		when reward_gold >= 200 then 'high'
		when reward_gold >= 100 then 'mid'
		else 'low'
	end as bucket
from quests
order by quest_id
;

-- task 6
select *
from "characters" c 
where c.alignment = 'evil'
;

-- task 7
WITH cat AS (
    SELECT CASE
         WHEN alignment='evil' THEN 'threat'
         WHEN intelligence_level < 5 THEN 'special'
         ELSE 'standard'
       END AS segment
  FROM characters)
SELECT segment,
       COUNT(*) cnt
  FROM cat
  GROUP BY segment;

-- task 8
select event_type ,
	sum(case when risk_level >= 9 then 1 else 0 end) as critical_cnt
from events
group by event_type
order by event_type
;

-- task 9
select *, coalesce(end_day, start_day) - start_day + 1 as duration
from events
where coalesce(end_day, start_day) - start_day + 1 > 1
;

-- task 10
with stats as (
	select c.character_id , count(distinct ep.event_id ) as events_cnt
	from "characters" c left join event_participants ep on c.character_id = ep.character_id
	group by c.character_id 
)
select c.name, s.events_cnt , case when s.events_cnt >= 2 then 1 else 0 end as is_active
from "characters" c join stats s on c.character_id = s.character_id 
order by c.name
;
