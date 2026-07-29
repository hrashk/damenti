-- task 1
select count(*) as pairs_cnt
from "characters" a join "characters" b on a.species <> b.species and a.character_id < b.character_id 
;

-- task 2
select a.species , a."name" as name_a, b."name" as name_b
from "characters" a join "characters" b on a.species = b.species and a.alignment <> b.alignment and a.name < b.name 
;

-- task 3
select e.*
from events e join locations l on e.location_id = l.location_id
where e.risk_level > l.danger_level 
;

-- task 4
select a.event_id , b.event_id 
from events a join events b on a.start_day <> b.start_day and a.event_id < b.event_id
;

-- task 5
with issuer as (
	select distinct issued_by
	from quests
), align as (
	select distinct alignment
	from "characters" c 
)
select i.issued_by, alignment, count(*) as quests_cnt
from issuer i join align on 1=1
	join quests q on q.issued_by = i.issued_by 
group by i.issued_by, alignment
order by i.issued_by, alignment
;
