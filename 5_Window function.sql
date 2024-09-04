
Select 
name,
region_id,
sub_region_id,
population,
sum(population) over(partition by region_id order by sub_region_id range between 1 preceding and 1 following) as a
--sum(population) over(partition by region_id order by sub_region_id range between 0 preceding and 70 following) as b,
--sum(population) over(partition by region_id order by sub_region_id range between 70 preceding and 119 following) as c

from eba_countries;


-- Window function with out window fream 

select 
    name,
    region_id,
    sub_region_id,
    population,
    sum(population) over(partition by region_id order by sub_region_id) as a,
    sum(population) over(partition by region_id) as b
from eba_countries;

