-- Window Function ( Analytical Functions)
select * from eba_countries;

select 
    a.REGION_ID,
    a.Country_code,
    a.POPULATION,
    b.Region_population,
    round((a.POPULATION / b.Region_population) * 100,5) AS Percentile_region_population
from  eba_countries a 
LEFT JOIN (
    select 
        REGION_ID , 
        sum(POPULATION) as Region_population
    from eba_countries 
    group by REGION_ID
) b
on a.REGION_ID = b.REGION_ID;

-- over()

select
    name,
    POPULATION,
    REGION_ID,
    round(population / sum(POPULATION) over(partition by region_id),2) as Population_per_reg
    from 
eba_countries;

select * from EMP_1;

select
    Ename,
    JOB,
    SAL,
    SAL_TYPES,
    sum(sal) over(partition by SAL_Types) Total_type_salary
from EMP_1;


--Over() Pertition
-- If we dont use Pertition by in the Over() the the Over() apply all over the table. The over() sometime works like group by 
-- In a single Over() close we can write multiple pertitions. Like Over( Pertision by X1, X2)
SELECT 
    Job,
    SAL,
    SAL_TYPEs,
    over(partition by SAL, SAL_TYPES)
from EMP_1;


SELECT 
    SAL_TYPES,
    job,
    sal /count(job) OVER (PARTITION BY SAL_TYPES,job)
FROM EMP_1;


