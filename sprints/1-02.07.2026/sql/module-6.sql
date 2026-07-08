-- task 1
select *
from quests
where quest_name ilike '%dragon%'
;

-- task 2
select *
from quests
where quest_name like 'Rescue%'
;

-- task 3
select *
from quests
where quest_name like '%Duloc'
;

-- task 4
select *, length(quest_name) as len
from quests
order by len desc
;

-- task 5
select *, quest_name || ' | reward=' || reward_gold as label
from quests
where reward_gold is not null
;

-- task 6
select *
from quests
where quest_name ilike '%rescue%' or quest_name ilike '%save%'
;

-- task 7
select quest_id , substr(quest_name , 1, 5) as first5
from quests
;

-- task 8
select quest_id , replace(quest_name , ' ', '-') as dash_title
from quests
;

-- task 9
with al as (
	select avg(length(quest_name)) as avg_len
	from quests
)
select q.*
from quests q join al
on length(q.quest_name ) > al.avg_len 
;

-- task 10
select *, position('swamp' in lower(quest_name)) as pos
from quests
;
