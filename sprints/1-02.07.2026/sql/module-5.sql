-- task 1
with dur as (
	select e.*, end_day - start_day + 1 as duration
	from events e
	where e.end_day is not null
),
mdays as (
	select max(duration) as max_days
	from dur
)
select d.event_id , d.duration
from dur d join mdays m on d.duration = max_days
;

-- task 2
with locnt as (
	select location_id, count(*) as cnt
	from events
	group by location_id
),
maxnt as (
	select max(cnt) as max_cnt
	from locnt
)
select l.name, locnt.cnt
from locnt join maxnt on cnt = max_cnt
join locations l on locnt.location_id = l.location_id 
;

-- task 3
with ec as (
	select ep.character_id , count(*) as cnt
	from event_participants ep join events e on ep.event_id = e.event_id 
	where e.risk_level >= 8
	group by ep.character_id 
	having count(*) > 1
)
select c."name" , ec.cnt
from ec join "characters" c on ec.character_id = c.character_id 
;

-- task 4
with ar as (
	select avg(risk_level) as avg_risk
	from events
), aq as (
	select qe.quest_id , avg(e.risk_level ) as avg_risk
	from events e join quest_events qe on qe.event_id = e.event_id 
	group by qe.quest_id
)
select q.quest_id , q.quest_name , aq.avg_risk 
from ar join aq on aq.avg_risk > ar.avg_risk  
join quests q on aq.quest_id = q.quest_id 
;

-- task 5
with cc as (
	select ep.character_id , count(*) as cnt
	from event_participants ep 
	group by ep.character_id 
)
select c.character_id , c."name" , cc.cnt
from cc join "characters" c on cc.character_id = c.character_id 
order by cnt desc
limit 5
;

-- task 6
select e.event_id , e.event_type , l."name" as location_name, l.danger_level 
from events e join locations l on e.location_id = l.location_id
where l.danger_level >= 8
;

-- task 7
with mr as (
	select max(risk_level ) as max_risk
	from events
)
select e.event_id 
from events e join mr on e.risk_level = mr.max_risk 
;

-- task 8
select quest_id , quest_name 
from quests
where reward_gold >= 200
;

-- task 9
with t as (
	select count(*) as cnt
	from quests
	where success is not null
),
s as (
	select count(*) as cnt
	from quests
	where success = 1
)
select s.cnt::float / t.cnt
from t cross join s
;

-- task 10
with dur as (
	select e.*, end_day - start_day + 1 as duration
	from events e
	where e.end_day is not null
),
ad as (
	select avg(duration) as avg_dur
	from dur
),
lad as (
	select location_id, avg(duration) as avg_dur
	from dur
	group by location_id
)
select l."name" , lad.avg_dur 
from lad join ad on lad.avg_dur > ad.avg_dur 
join locations l on lad.location_id = l.location_id 
;
