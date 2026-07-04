-- task 1
select *
from characters
where species = 'ogre'
;

-- task 2
select event_id, event_type, risk_level
from events
where risk_level < 4
;

-- task 3
select *
from locations
where type in ('swamp', 'forest')
order by type, name
;

-- task 4
select name, strength_level 
from characters
where strength_level between 4 and 6
;

-- task 5
select name, alignment 
from characters 
where alignment != 'good'
;

-- task 6
select quest_id, quest_name, reward_gold
from quests
where reward_gold >= 100
;

-- task 7
select quest_id, quest_name
from quests
where reward_gold is null
;

-- task 8
select *
from event_participants
where role_in_event = 'victim'
order by event_id, character_id
;

-- task 9
select *
from events
where start_day =5
;

-- task 10
select *
from characters
where (is_magical  = 1 and intelligence_level >= 7) or (alignment = 'evil' and strength_level >= 6)
;
