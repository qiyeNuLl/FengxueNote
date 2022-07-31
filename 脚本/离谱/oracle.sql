1
SELECT e.ename,e.sal,d.dname,temp.count
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) COUNT
    FROM emp
    GROUP BY deptno
) temp
WHERE e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30)
AND (e.deptno = temp.dno)
AND (e.deptno = d.deptno);


SELECT e.ename,e.sal,d.dname,temp.count
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) COUNT
    FROM emp
    GROUP BY deptno
) temp
WHERE e.sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30)
AND (e.deptno = temp.dno)
AND (e.deptno = d.deptno);

-- WHERE e.sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30)
2
SELECT e.ename,e.job,e.sal,d.dname,temp.count,m.ename
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count 
    FROM emp
    GROUP BY deptno
) temp,emp m
WHERE (e.job IN (SELECT job FROM emp WHERE ename = 'SCOTT'))
AND (e.ename != 'SCOTT')
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr(+) = m.empno);


3
SELECT e.empno,e.ename,d.dname,m.ename,temp.count,temp.avg,temp.max,temp.min
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count,AVG(sal) avg,MAX(sal) max,MIN(sal) min
    FROM emp
    GROUP BY deptno
) temp,emp m
WHERE e.sal >ANY (SELECT sal FROM emp WHERE ename IN ('SMITH','ALLEN'))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr(+) = m.empno);


4
SELECT e.empno,e.ename,d.dname,d.loc,temp.count
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp,emp m
WHERE (e.mgr = m.empno)
AND (e.hiredate < m.hiredate)
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno);

5
SELECT e.ename,d.dname,temp.count,s.grade
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp,salgrade s
WHERE (e.job = 'CLERK')
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.sal BETWEEN s.losal AND s.hisal);

6
SELECT d.deptno,d.dname,d.loc,temp.count
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp
WHERE (e.deptno = d.deptno)
AND (e.deptno = temp.dno);

SELECT d.dname,d.loc,temp.count
FROM dept d,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp
WHERE (d.deptno = temp.dno(+));


7
SELECT e.ename,temp.count
FROM emp e,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp
WHERE (e.ename LIKE '%K%')
AND (e.deptno = temp.dno);

8
SELECT s.grade,COUNT(e.empno) count,MAX(e.sal) max,MIN(e.sal) min,TRUNC(AVG(e.sal)) avg
FROM emp e,salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal
GROUP BY s.grade
ORDER BY grade;



9
SELECT e.ename,e.sal,e.hiredate,d.loc,s.grade,temp.count
FROM emp e,dept d,salgrade s,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp
WHERE (e.deptno = (SELECT deptno FROM dept WHERE dname = 'ACCOUNTING'))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.sal BETWEEN s.losal AND s.hisal)
ORDER BY s.grade;

10
SELECT *
FROM test
WHERE (test_category = 'MySQL') OR (test_category = 'SQLServer');

11
SELECT e.ename,d.dname,temp.count
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count
    FROM emp
    GROUP BY deptno
) temp,emp m
WHERE (e.mgr = m.empno)
AND (e.hiredate < m.hiredate)
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno);

12
SELECT COUNT(empno),TRUNC(AVG(sal)) FROM emp WHERE (mgr IS NOT NULL)
union
SELECT COUNT(empno),TRUNC(AVG(sal)) FROM emp WHERE (mgr IS NULL);


13
SELECT e.ename,e.sal,d.loc,m.ename,temp.count,temp.max
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count,MAX(sal) max
    FROM emp
    GROUP BY deptno
) temp,emp m
WHERE (e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr = m.empno);




14
SELECT *
FROM emp
WHERE (deptno = 20)
AND (TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) > 37)
AND (sal < 2000);

15
SELECT deptno,COUNT(empno)
FROM emp e
HAVING COUNT(empno) > 0
GROUP BY deptno;



16
SELECT *
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'SMITH')
ORDER BY sal,deptno;

17
SELECT e.ename,m.ename lead
FROM emp e,emp m
WHERE e.mgr = m.empno(+);



18
SELECT *
FROM emp e,emp m
WHERE (e.mgr = m.empno)
AND (e.hiredate < m.hiredate);

19
SELECT e.ename,d.dname,temp.count,temp.avg
FROM emp e,dept d,(
    SELECT deptno dno,COUNT(empno) count,TRUNC(AVG(sal)) avg
    FROM emp
    GROUP BY deptno
)temp
WHERE (e.job IN (SELECT job FROM emp GROUP BY job HAVING COUNT(empno) < 5000 ))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno);


SELECT *
FROM emp
WHERE sal >ANY (SELECT sal FROM emp WHERE deptno = 20);

SELECT d.dname,temp.count,temp.avg
FROM dept d,(
    SELECT deptno,COUNT(empno) count,AVG(sal) avg
    FROM emp e
    HAVING COUNT(empno) > 4
    GROUP BY deptno) temp
WHERE d.deptno = temp.deptno;


UPDATE myemp SET hiredate = SYSDATE;

DELETE FROM myemp WHERE empno = 7839;

DELETE FROM myemp WHERE (sal > (SELECT AVG(sal) FROM myemp));





























