select COMP_PROGRAM_NUM, count(*) from commisns.PROCESSED_EXPENSE_TRANS group by COMP_PROGRAM_NUM;
select COMP_PROGRAM_NUM, count(*) from commisns.PROCESSED_EXPENSE_TRANS group by COMP_PROGRAM_NUM 

---Minus Query to validate source to  target differences
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS
minus
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM


select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM
minus
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS

---Return rows matching to both--
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM
intersect
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS


---Union only return the distinct rows while union all return all the rows
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM
union 
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS

select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS
union all
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM

---Except is similar to minus-- 
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM
except
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS

---Like is case sensitive--
select * from ffba.COMP_PROGRAM where COMP_PROGRAM_NAM like 'A%'--For starting
select * from ffba.COMP_PROGRAM where COMP_PROGRAM_NAM like '%s'--For ending
select * from ffba.COMP_PROGRAM where COMP_PROGRAM_NAM like '_g%' --In middle
select * from ffba.COMP_PROGRAM where COMP_PROGRAM_NAM like '%agent%' --anywhere
select COMP_PROGRAM_NAM from ffba.COMP_PROGRAM where COMP_PROGRAM_NAM LIKE 'A%' or COMP_PROGRAM_NAM LIKE 'C%';--multiple condn


--Join---
select T1.COMP_PROGRAM_NUM,T2.COMP_PROGRAM_NUM from ffba.COMP_PROGRAM T1 inner join commisns.PROCESSED_EXPENSE_TRANS T2 ON
T1.COMP_PROGRAM_NUM=T2.COMP_PROGRAM_NUM;

--Left Outer Join--
select T1.COMP_PROGRAM_NUM, T2.COMP_PROGRAM_NUM from ffba.COMP_PROGRAM T1 LEFT OUTER join commisns.PROCESSED_EXPENSE_TRANS T2 ON
T1.COMP_PROGRAM_NUM=T2.COMP_PROGRAM_NUM;

--Right Outer Join--
select T1.COMP_PROGRAM_NUM,T2.COMP_PROGRAM_NUM from ffba.COMP_PROGRAM T1 RIGHT OUTER join commisns.PROCESSED_EXPENSE_TRANS T2 ON
T1.COMP_PROGRAM_NUM=T2.COMP_PROGRAM_NUM;

--Full Outer Join--
select T1.COMP_PROGRAM_NUM,T2.COMP_PROGRAM_NUM from ffba.COMP_PROGRAM T1 FULL OUTER join commisns.PROCESSED_EXPENSE_TRANS T2 ON
T1.COMP_PROGRAM_NUM=T2.COMP_PROGRAM_NUM;

--Cartesian Product--
select count(*)  from ffba.COMP_PROGRAM,commisns.PROCESSED_EXPENSE_TRANS;
select * from commisns.PROCESSED_EXPENSE_TRANS T1, commisns.PROCESSED_EXPENSE_TRANS T2 where T1.


select distinct(COMP_PROGRAM_NUM) from commisns.PROCESSED_EXPENSE_TRANS;
--For duplicates---
select BUS_TRAN_AMT, count(*) from commisns.PROCESSED_EXPENSE_TRANS  group by BUS_TRAN_AMT having count(*) >1;
---For second max--
select max(COMP_PROGRAM_NUM) from commisns.PROCESSED_EXPENSE_TRANS where COMP_PROGRAM_NUM NOT IN (select max(COMP_PROGRAM_NUM) from commisns.PROCESSED_EXPENSE_TRANS);

SELECT COMP_PROGRAM_NUM FROM commisns.PROCESSED_EXPENSE_TRANS T1
WHERE 2 = (SELECT COUNT(DISTINCT COMP_PROGRAM_NUM )    
FROM commisns.PROCESSED_EXPENSE_TRANS T2    
WHERE T2.COMP_PROGRAM_NUM>T1.COMP_PROGRAM_NUM) ;

select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM group by COMP_PROGRAM_NUM  ORDER BY COMP_PROGRAM_NUM ASC FETCH FIRST 3 ROWS ONLY

---To find out the nth highest in a table--
SELECT MIN (COMP_PROGRAM_NUM)
FROM ffba.COMP_PROGRAM
WHERE COMP_PROGRAM_NUM NOT IN (SELECT COMP_PROGRAM_NUM
                               FROM ffba.COMP_PROGRAM
                               GROUP BY COMP_PROGRAM_NUM
                               ORDER BY COMP_PROGRAM_NUM ASC
                               FETCH FIRST 5 ROWS ONLY);


--One row twice in results using UNION ALL--
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS where COMP_PROGRAM_NUM=113
union all
select COMP_PROGRAM_NUM from commisns.PROCESSED_EXPENSE_TRANS where COMP_PROGRAM_NUM=113;

---Between--
select * from commisns.PROCESSED_EXPENSE_TRANS where TRANS_EFF_DTE between  '02/02/2018'  AND  '02/02/2018';
select * from commisns.PROJ_EXPENSE_TRANS where '02/02/2018' between START_DTE and END_DTE;


select COMP_PROGRAM_NUM,sum(BUS_TRAN_AMT) from commisns.PROCESSED_EXPENSE_TRANS group by COMP_PROGRAM_NUM order by COMP_PROGRAM_NUM ASC;
--Even Rows--
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM where (COMP_PROGRAM_NUM %2) = 0;
--Odd Rows--
select COMP_PROGRAM_NUM from ffba.COMP_PROGRAM where (COMP_PROGRAM_NUM %2) = 0;

