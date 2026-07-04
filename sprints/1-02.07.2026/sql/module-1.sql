-- task 1
SELECT *
FROM characters
LIMIT 12
;

-- task 2
SELECT DISTINCT species
FROM characters
ORDER BY species
;

-- task 3
select name, danger_level 
from locations
order by danger_level desc, name
limit 5
;

-- task 4
select event_id, event_type, risk_level
from events
order by risk_level desc
limit 5
;

-- task 5
select distinct role_in_event
from event_participants
;

-- task 6
select quest_id, quest_name
from quests
order by quest_id
limit 10
;

-- task 7
select distinct issued_by
from quests
order by issued_by 
;

-- task 8
select name, strength_level
from characters
order by strength_level desc, name
;

-- task 9
select event_id, event_type, start_day
from events
order by start_day, event_id
;

-- task 10
select distinct species, is_magical
from characters
order by species, is_magical
;
