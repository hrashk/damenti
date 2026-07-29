-- task 1
select 'character' as obj_type, character_id as obj_id, name, strength_level as risk_score
from characters

union all

select 'event', event_id, event_type, risk_level 
from events
;

-- task 2
select species as label
from characters
union
select type
from locations
order by label
;

-- task 3
select 'character:' || character_id  as obj_key
from characters
union all
select 'location:' || location_id
from locations
union all
select 'event:' || event_id
from events
;

-- task 4
select 'character' as obj_type, character_id as obj_id, name, strength_level as score
from "characters" c 
union all
select 'location' as obj_type, location_id, name, danger_level 
from locations
order by score desc, name
limit 10
;

-- task 5
select 'characters' as src, count(*) as cnt
from characters
union all
select 'locations' as src, count(*) as cnt
from locations
union all
select 'events' as src, count(*) as cnt
from events
union all
select 'quests' as src, count(*) as cnt
from quests
;

-- task 6
select quest_id, 'success' as status
from quests
where success = 1
union all
select quest_id, 'fail' as status
from quests
where success = 0
;

-- task 7
select name
from "characters" c 
union
select quest_name  
from quests
;

-- task 8
select name as title
from locations
where type = 'swamp'
union all
select quest_name
from quests
where quest_name ilike '%swamp%'
;

-- task 9
select event_type as key
from events
union
select issued_by
from quests
order by key
;

-- task 10
select 'character' as obj_type, name, case when strength_level >=8 then 'high' else 'low' end as bucket
from characters 
union all
select 'location' as obj_type, name, case when danger_level >=8 then 'high' else 'low' end as bucket
from locations 
;
