
-- Data Cleancing And Manipulation
-- Coalescs 
select * from stores;

select store_name, web_address, coalesce(web_address, store_name) from stores;

-- NVL function replace null values from an expression a specific string 
select * from emp;

select emp.*, NVL(comm, 0) from emp;

-- import a row 

insert into emp values(0,null,null,null,null,null,null,null);
select * from emp;

select emp.*, nvl(ename,'Nahid') from emp;

-- delate a row 

delete from emp where ename is null;

-- Trim "we can trim leading and training or both using the trim function "

select ename, trim('K' from ename) from emp;

select length (trim( trailing ' ' from '  nahid   ')) from dual; 
select length (trim( leading ' ' from '  nahid   ')) from dual; 

select * from emp;


select job, length(trim(' ' from Job)) from emp;
select length(job) from emp;

-- Pad "LPAD" "RPAD"

select * from emp;

select lpad(empno,6,0) from emp;
select rpad(empno,5,0) from emp;

select * from emp;

select ename, rpad(ename, 7, 'x') from emp;

select * from emp;

-- extra work group by 
select job, avg(sal) from emp group by job;

-- Greatest and Least 

select * from emp;

select ename, sal, greatest(sal,2000) from emp;
select ename, sal, least(sal,2000) from emp;
select count(ename) from emp;

--pivot convert the row values to columns 
select * from emp;



-- DISTINCT FUNCTION 
select distinct(job) from emp;


SELECT *
FROM (
    SELECT  
        job, 
        sal, 
        CASE 
            WHEN sal >= 4000 THEN 'High'
            WHEN sal >= 3000 AND sal < 4000 THEN 'Medium'
            ELSE 'Low'
        END AS sal_types
    FROM emp
) 
PIVOT (
    SUM(sal) 
    FOR sal_types IN ('High','Medium','Low')
);

SELECT * 
FROM (
    SELECT 
        job, 
        sal,
        CASE 
            when sal >= 4000 THEN 'High'
            when sal >= 3000 AND  sal < 3999 THEN 'Mead'
            ELSE 'Low'
        END AS Sal_types 
    FROM emp
)

PIVOT(
       SUM(sal) 
       FOR sal_types IN ('High','Mead','Low') 
);


















