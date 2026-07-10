-- task 1
select *
from events
where end_day is null 
;

-- task 2
select count(*) as open_events_cnt
from events
where end_day is null 
;

-- task 3
select avg(coalesce(end_day, start_day) - start_day + 1) as avg_dur
from events
;

-- task 4
select min(coalesce(reward_gold , 0)) as min_r, max(coalesce(reward_gold , 0)) as max_r
from quests
;

-- task 5
select quest_id , reward_gold , coalesce(reward_gold , 0) as reward_filled
from quests
order by quest_id
;

-- task 6
select *
from characters
where intelligence_level is null and is_magical = 1 
;

-- task 7
select count(*) as cnt
from quests
where success is null
;

-- task 8
select avg(coalesce(success, 0)) as success_rate
from quests
;

-- task 9
select name, coalesce(intelligence_level, -1) as intelligence_filled
from characters
;

-- task 10
select alignment, avg(intelligence_level) as avg_int, count(intelligence_level ) as known_cnt
from characters
group by alignment
;
