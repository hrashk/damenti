-- task 1
select type, count(*) as cnt
from locations
group by type
;

-- task 2
select type, avg(danger_level)
from locations
group by type
;

-- task 3
select issued_by, count(*) as cnt
from quests
group by issued_by 
;

-- task 4
select issued_by, sum(reward_gold ) as total_reward
from quests
where reward_gold  is not null
group by issued_by 
;

-- task 5
select event_type, avg(risk_level) as avg_risk
from events
group by event_type
having avg(risk_level) >= 7
;

-- task 6
select species, avg(strength_level) as avg_strength
from characters
group by species
having avg(strength_level) > 6
;

-- task 7
select role_in_event , count(*) as cnt
from event_participants
group by role_in_event 
;

-- task 8
select location_id , count(*) as cnt
from events
group by location_id
having count(*) >= 2
;

-- task 9
select location_id , max(risk_level )
from events
group by location_id 
;

-- task 10
select species, count(*) as cnt
from characters
where alignment  = 'evil'
group by species
;

