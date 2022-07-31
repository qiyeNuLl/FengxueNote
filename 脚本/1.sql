MAX(sal) < 5000

SELECT job,ename
FROM 
WHERE (SELECT MAX(sal) FROM emp  HAVING MAX(sal) < 5000 GROUP BY job)



SELECT d.dname FROM emp e,dept d  HAVING MAX(e.sal) < 5000 GROUP BY job;

SELECT job FROM emp  HAVING MAX(sal) < 5000 GROUP BY job;

SELECT e.ename,temp.job 
FROM emp e,(SELECT job FROM emp 
HAVING MAX(sal) < 5000 GROUP BY job) temp




SELECT ename,job
FROM emp
WHERE job in (SELECT job FROM emp 
HAVING MAX(sal) < 5000 GROUP BY job);


SELECT e.ename,e.job,d.dname,temp.count,temp.avg
FROM emp e,dept d,(SELECT deptno,COUNT(empno) count,AVG(sal) avg FROM emp GROUP BY deptno) temp
WHERE (e.job in (SELECT job FROM emp 
HAVING MAX(sal) < 5000 GROUP BY job))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.deptno);

;

10.查询基本工资排序在10-15之间的员工信息
(SELECT * FROM (SELECT deptno,ROWNUM rn FROM emp WHERE ROWNUM <= 15) temp
wHERE (temp.rn > 9));



(SELECT * FROM emp ORDER BY sal)

SELECT * 
FROM (SELECT e.*,ROWNUM rn 
FROM (SELECT * FROM emp ORDER BY sal desc) e WHERE ROWNUM <= 15) temp
WHERE (temp.rn > 9);



SELECT SUBSTR(ename,1,2) FROM emp;

SELECT *
FROM emp
WHERE TO_CHAR(hiredate,'mm') == '02';

SELECT *
FROM (SELECT ROWNUM rn,e.* FROM emp e WHERE ROWNUM <= 15) temp
WHERE temp.rn >= 11;



SELECT *
FROM emp
WHERE sal IN (SELECT AVG(sal) FROM emp GROUP BY deptno);

SELECT *
FROM emp e,(SELECT AVG(sal) avg,deptno dno FROM emp GROUP BY deptno) temp
WHERE (e.deptno == temp.dno)
AND (e.sal > temp.avg);

SELECT e.*,d.deptno,d.dname,temp.count
FROM emp e,dept d,(SELECT COUNT(empno) count,deptno dno FROM emp GROUP BY deptno) temp
WHERE (e.deptno == d.deptno)
AND (e.deptno == temp.dno)
AND e.sal > (SELECT AVG(m.sal) avgsal FROM emp m WHERE e.deptno == m.deptno GROUP BY m.deptno );


SELECT *
FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno = 10)
AND conn IN (SELECT conn FROM emp WHERE deptno = 10);

SELECT *
FROM emp
WHERE deptno IN (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(EMPNO) > 5);

UPDATE myemp m SET m.sal = (SELECT AVG(sal) FROM emp e WHERE m.deptno = e.deptno GROUP BY e.deptno)+5000 ;


SELECT *
FROM (SELECT * FROM emp WHERE deptno = 20 ORDER BY sal DESC) temp
WHERE ROWNUM <= 2;

SELECT e.ename,e.sal,temp.sum,e.sal/temp.sum*100
FROM emp e,dept d,(SELECT SUM(sal) sum,deptno dno FROM emp GROUP BY deptno) temp,salgrade s
WHERE (e.deptno == d.deptno)
AND (TO_CHAR(e.hiredate,'yy') > '1979')
AND (e.deptno = temp.dno)
AND (e.sal BETWEEN s.lowsal AND s.hisal)
AND (s.grade = 1)
AND (d.loc == 'DALLAS');

SELECT *
FROM (SELECT ROWNUM rn,e.* FROM (SELECT * FROM emp ORDER BY sal) e WHERE ROWNUM >=10 ) temp
WHERE ROWNUM <= 15;



SELECT d.*
FROM dept d,(SELECT MAX(COUNT(empno)) count,deptno dno FROM emp GROUP BY deptno) temp
WHERE (d.deptno = temp.dno);


SELECT e.*,d.dname,d.loc
FROM emp e,dept d
WHERE e.sal = (SELECT MIN(MIN(sal)) FROM emp GROUP BY deptno)
AND e.deptno IN (SELECT DISTINCT deptno FROM emp WHERE job = 'MANAGER')
AND e.deptno = d.deptno;


SELECT *
FROM emp
WHERE conn < 100 or conn is NULL;

SELECT *
FROM emp
WHERE ename NOT LIKE '%R%';

select ename,empno,job,sal*12 income,hiredate
from emp
where ename like '%A%'
order by income DESC,hiredate,job;

select * from emp where upper('&inputname');


select * from emp where length(ename) = 4;

select substr(ename,1,3) from myemp;

select substr(ename,-3) from emp;

select empno,ename,sal,(SYSDATE-hiredate)
FROM emp;






