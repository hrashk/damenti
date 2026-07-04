-- task 1
select e.event_id, e.event_type , l."name" as location_name, l."type" as location_type
from events e inner join locations l  on e.location_id = l.location_id
;

-- task 2
select distinct e.event_id , e.event_type 
from events e inner join event_participants ep on e.event_id = ep.event_id 
inner join "characters" c  on ep.character_id = c.character_id 
where c."name" = 'Donkey'
;

-- task 3
select q.quest_id, q.quest_name , q.success , count(qe.event_id ) as events_in_quest
from quests q left join quest_events qe on q.quest_id = qe.quest_id
group by q.quest_id, q.quest_name , q.success 
;

-- task 4
select distinct e.event_id , e.event_type 
from events e join event_participants ep on e.event_id = ep.event_id
where ep.role_in_event = 'victim'
;

-- task 5
select e.event_id, l.name as location_name , c."name" as character_name, ep.role_in_event 
from events e inner join event_participants ep on e.event_id = ep.event_id 
inner join "characters" c  on ep.character_id = c.character_id 
inner join locations l on e.location_id = l.location_id 
;

-- task 6
select l.name
from events e inner join event_participants ep on e.event_id = ep.event_id 
inner join "characters" c  on ep.character_id = c.character_id 
inner join locations l on e.location_id = l.location_id 
where c."name" = 'Shrek'
;


-- task 7
select  e.event_id, e.event_type , c."name" as character_name, ep.role_in_event 
from events e inner join event_participants ep on e.event_id = ep.event_id 
inner join "characters" c  on ep.character_id = c.character_id 
where c.alignment = 'evil'
order by e.event_id , character_name 
;


-- task 8
select distinct q.quest_id , q.quest_name 
from quests q join quest_events qe on q.quest_id = qe.quest_id 
join events e on qe.event_id = e.event_id
where e.risk_level >= 8
;

-- task 9
select e.event_id , count(distinct ep.character_id ) as uniq_participants
from events e join event_participants ep on e.event_id = ep.event_id
group by e.event_id
;

-- task 10
select c.*
from "characters" c left join event_participants ep on c.character_id = ep.character_id
where ep.character_id is null
;

