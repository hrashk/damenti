-- task 1
select a.species, a.name as name_a, b.name as name_b
from "characters" a join "characters" b on a.species = b.species and a.name < b.name
;

-- task 2
select a.type, a."name" a, b."name" b, a.danger_level , b.danger_level 
from locations a join locations b
	on a."type" = b."type"
	and a.danger_level <> b.danger_level
	and a.location_id < b.location_id 
;

-- task 3
select a.species, a.strength_level, a."name" a, b."name" b
from "characters" a join "characters" b
	on a.species = b.species
	and a.strength_level = b.strength_level
	and a.character_id  < b.character_id 
;

-- task 4
select a.event_type , a.location_id , a.event_id as a , b.event_id as b
from events a join events b
	on a.event_type = b.event_type
	and a.location_id = b.location_id
	and a.event_id < b.event_id 
;

-- task 5
select a.species, a."name" as magical_one, b."name" as nonmagical_one
from "characters" a join "characters" b
	on a.species = b.species
	and a.is_magical = 1 and b.is_magical = 0
;
