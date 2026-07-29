-- task 1
with stats as (
	select c.character_id , count(ep.event_id ) as events_cnt
	from "characters" c left join event_participants ep on c.character_id = ep.character_id
	group by c.character_id 
)
select c."name" , s.events_cnt, c.is_magical ,
	CASE WHEN strength_level>=7 THEN 1 ELSE 0 END is_dangerous,
	case when c.alignment = 'evil' then 1 else 0 end as is_evil
from "characters" c join stats s on c.character_id = s.character_id 
order by c."name" 
;

-- task 2
WITH segs AS (
	select
		character_id,
	    CASE
		    WHEN alignment='evil' THEN 'threat'
			WHEN is_magical=1 THEN 'special'
			ELSE 'standard'
		END AS segment
	  FROM characters
),  stats as (
	select c.character_id , count(ep.event_id ) as events_cnt
	from "characters" c left join event_participants ep on c.character_id = ep.character_id
	group by c.character_id 
)
select segment, count(s.character_id) as chars_cnt , avg(events_cnt) as avg_evts
from stats s join segs g on s.character_id  = g.character_id 
group by segment
;

-- task 3
select issued_by,
	count(*) as quests_cnt,
	round(avg(coalesce(reward_gold, 0)), 3) as avg_reward,
	round(avg(success), 4) as success_rate
from quests
where success is not null
group by issued_by
order by issued_by 
;

-- task 4
with stats as (
	select q.quest_id , avg(e.risk_level) as avg_risk
	from quests q join quest_events qe on q.quest_id = qe.quest_id
		join events e on qe.event_id = e.event_id 
	group by q.quest_id
), rpr as (
	select q.quest_id , s.avg_risk , q.reward_gold / s.avg_risk as rpr
	from quests q join stats s on q.quest_id = s.quest_id 
	where q.reward_gold is not null
)
select *
from rpr
where rpr.rpr > (select avg(rpr) from rpr)
order by quest_id
;

-- task 5
with stats as (
	select l.location_id, sum(e.risk_level) as sum_risk
	from locations l join events e on l.location_id = e.location_id
	group by l.location_id
)
select l."name" , stats.sum_risk 
from stats join locations l on l.location_id = stats.location_id 
order by sum_risk desc
limit 5
;

-- task 6
with stats as (
	select ep.character_id , count(*) as events_cnt
	from event_participants ep 
	group by ep.character_id
)
select c."name" , s.events_cnt
from "characters" c join stats s on c.character_id = s.character_id 
order by events_cnt desc, name
limit 10
;

-- task 7
select l.name,
	1.0 * sum(case when e.risk_level >= 8 then 1 else 0 end) / nullif(count(e.event_id),0) as high_risk_share
from locations l left join events e on l.location_id = e.location_id
group by l.name
order by l.name
;

-- task 8
select 'character' as obj_type, character_id as obj_id, name as title, strength_level as score
from "characters" c 
union all
select 'location' as obj_type, location_id, name, danger_level 
from locations
union all
select 'event' as obj_type, event_id, event_type, risk_level  
from events
order by score desc, obj_type, obj_id
limit 15
;

-- task 9
select ep1.event_id, c1."name" a, c2."name" b, c1.alignment a_al, c2.alignment b_al
from event_participants ep1 join event_participants ep2 on ep1.event_id = ep2.event_id 
	join "characters" c1 on ep1.character_id = c1.character_id 
	join "characters" c2 on ep2.character_id = c2.character_id 
where c1.alignment <> c2.alignment and c1.character_id < c2.character_id 
	;

-- task 10
select *
from events
where event_id not in (
	select e.event_id 
	from events e join  event_participants ep on e.event_id = ep.event_id
		join "characters" c on ep.character_id = c.character_id 
	where c.strength_level > e.risk_level
)
;
