CREATE TABLE emp_1 as 
SELECT 
ename, job, sal, 
CASE 
WHEN sal >= 3500 then 'High'
WHEN sal >= 2500 and sal <3499 THEN 'Mideum'
else 'low'
end as sal_types 
from emp;

SELECT * FROM EMP_1;

-- This is the example of the pivot operetion 
create table emp_pivot as 
SELECT * FROM 
(SELECT JOB, SAL, SAL_TYPES FROM emp_1)
PIVOT(count(sal) for sal_types in ('High','Mideum','low'));

-- drop table 
drop table emp_pivot;


--unpivot 


-- create a table from the raw and the incert data

CREATE TABLE Avg_test_score(S_name varchar(10), Math number, Science number, Programing number);

insert into Avg_test_score(S_name, Math, Science, Programing)
value('Nahid', 87, 93, 91);

INSERT INTO Avg_test_score (S_name, Math, Science, Programing)
VALUES ('Nahid', 87, 93, 91);

INSERT INTO Avg_test_score ( S_name, Math, Science, Programing)
VALUES ('Ferdous', 97, 83, 71);

INSERT INTO Avg_test_score ( S_name, Math, Science, Programing)
VALUES ('Ferdous', 97, 83, 71);

INSERT INTO Avg_test_score ( S_name, Math, Science, Programing)
VALUES ('marzia', 93, 93, 61);

-- OR 

INSERT INTO Avg_test_score VALUES('Khan', 99, 98, 97);

SELECT * FROM Avg_test_score;

-- UNPIVOT
select * from Avg_test_score
unpivot(New_coml for subject in (Math, Science, Programing));



-- pivot assignment 
SELECT * FROM emp;

SELECT * FROM 
(SELECT 
    job,
    deptno,
    sal
from emp)
PIVOT(sum(sal) for job in ('ANALYST','CLERK','SALSMAN','MANAGER','PRESIDENT'));

SELECT DISTINCT(job) FROM emp;


-- 2ND ASSIGNMENT 

CREATE TABLE Score(Player VARCHAR(10), Goal_2018 NUMBER, Goal_2029 NUMBER, Goal_2020 NUMBER);

INSERT INTO Score VALUES('Messi', 21, 23,19);
INSERT INTO Score VALUES('Ronando', 21,20,17);
INSERT INTO Score VALUES('Naimar',20,21,23);
select * from Score;

SELECT * FROM 
Score
UNPIVOT( Goal for Season in ( Goal_2018 as 2018, Goal_2029 as 2019, Goal_2020 as 2020) );

