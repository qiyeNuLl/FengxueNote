SELECT e.ename,e.job,d.dname,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30)
AND (e.deptno != 30)
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno);



SELECT e.ename,e.job,e.sal,d.dname,temp.count,m.ename
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE (e.job = (SELECT job FROM emp WHERE ename = 'SCOTT'))
AND (e.ename != 'SCOTT')
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr(+) = m.empno);


SELECT e.empno,e.ename,d.dname,m.ename,temp.count,temp.avg,temp.max,temp.min
FROM emp e,dept d,emp m,(SELECT deptno dno,COUNT(empno) count,AVG(sal) avg,MAX(sal) max,MIN(sal) min
                        FROM emp 
                        GROUP BY deptno) temp
WHERE (e.sal >ANY (SELECT sal FROM emp WHERE ename IN ('SMITH','ALLEN')) )
AND (e.deptno = d.deptno)
AND (e.mgr = m.empno(+))
AND (e.deptno = temp.dno);


SELECT e.empno,e.ename,d.dname,d.loc,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr = m.empno(+))
AND (e.hiredate < m.hiredate);


SELECT e.ename,d.dname,temp.count,s.grade
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,salgrade s
WHERE (e.job = 'CLERK')
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.sal BETWEEN s.losal AND s.hisal);


SELECT d.dname,d.loc,temp.count
FROM dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE (d.deptno = temp.dno);



SELECT e.ename,temp.count
FROM emp e,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE (e.ename LIKE '%K%')
AND (e.deptno = temp.dno);


SELECT s.grade,COUNT(e.empno),AVG(e.sal),MIN(e.sal),MAX(e.sal)
FROM salgrade s,emp e
WHERE (e.sal BETWEEN s.losal AND s.hisal)
GROUP BY s.grade;


ACCOUNTING

SELECT e.ename,e.sal,e.hiredate,d.loc,s.grade,temp.count
FROM emp e,salgrade s,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE (d.dname = 'ACCOUNTING')
AND (e.deptno = temp.dno)
AND (e.deptno = d.deptno)
AND (e.sal BETWEEN s.losal AND s.hisal);


SELECT *
FROM test
WHERE test_category IN ('Mysql','SQLServer');

SELECT e.ename,d.dname,d.loc
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE (e.mgr = m.empno(+))
AND (e.hiredate < m.hiredate)
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno);

mgr IS NOT NULL
mgr IS NULL


SELECT '有' title,COUNT(empno),AVG(sal) FROM emp WHERE mgr IS NOT NULL
union
SELECT '无' title,COUNT(empno),AVG(sal) FROM emp WHERE mgr IS NULL;


SELECT e.ename,e.sal,d.loc,m.ename,temp.count,temp.max
FROM emp e,dept d,emp m,(SELECT deptno dno,COUNT(empno) count,MAX(sal) max FROM emp GROUP BY deptno) temp
WHERE (e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30))
AND (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND (e.mgr = m.empno(+));

UPDATE myemp SET sal=5000,conn=2333 WHERE ename = 'SMITH';

UPDATE myemp SET sal=(SELECT sal FROM myemp WHERE ename='CCOTT') WHERE ename = 'ALLEN';

DELETE FROM myemp WHERE empno = 7839;

DELETE FROM myemp WHERE empno IN (7788,7902);

DELETE FROM myemp WHERE sal > (SELECT AVG(sal) FROM myemp);

SELECT * FROM emp WHERE TO_CHAR(hiredate,'mm') = '02';

SELECT e.ename,e.sal,d.dname,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno)  temp
WHERE (e.deptno = d.deptno)
AND (e.deptno = temp.dno)
AND e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30);


SELECT e.ename,e.job,e.sal,d.dname,temp.count,m.ename
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE e.job = (SELECT job FROM emo WHERE ename = 'SCOTT')
AND e.deptno = d.deptno
AND e.deptno = temp.dno
AND e.mgr = m.empno(+);


SELECT e.empno,e.ename,d.dname,m.ename,temp.count,temp.avg,temp.max,temp.min
FROM emp e,dept d,emp m,(SELECT deptno dno,COUNT(empno) count,AVG(empno) avg,MAX(sal) max,MIN(sal) min
    FROM emp GROUP BY deptno
)
WHERE e.deptno = d.deptno
AND e.sal >ANY (SELECT sal FROM emp WHERE ename = 'SMITH' OR ename = 'ALLEN')
AND e.ename NOT IN ('SMITH','ALLEN')
AND e.deptno = temp.dno
AND e.mgr = m.empno(+);


SELECT e.empno,e.ename,d.dname,d.loc,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE e.deptno = d.deptno
AND e.deptno = temp.dno
AND e.mgr = m.empno(+)
AND e.hiredate < m.hiredate;


SELECT e.ename,d.dname,temp.count,s.grade
FROM emp e,dept d,salgrade s,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE e.deptno = d.deptno
AND e.sal BETWEEN s.hisal AND s.losal
AND e.deptno = temp.dno
AND e.job = 'CLERK';



SELECT d.dname,d.loc,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE e.deptno = d.deptno
AND e.deptno = temp.dno;

SELECT e.ename,temp.count
FROM emp e,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE e.deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%K%')
AND e.deptno = temp.dno
AND e.ename LIKE '%K%';


SELECT temp.count,temp.max,temp.min,temp.AVG
FROM emp e,salgrade s,(SELECT deptno dno,COUNT(empno) count,MAX(sal) max,MIN(sal) min,AVG(sal) avg FROM emp GROUP BY deptno) temp
WHERE e.sal BETWEEN s.losal AND s.hisal
AND e.deptno = temp.dno;


SELECT e.ename,e.sal,e.hiredate,d.loc,s.grade,temp.count
FROM emp e,dept d,salgrade s,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE d.dname = ''
AND e.deptno = d.deptno
AND e.deptno = temp.dno
AND e.sal BETWEEN s.losal AND s.hisal;


SELECT * 
FROM test
WHERE test_category IN ('MYSQL','SQLSever');


SELECT e.ename,d.dname,temp.count
FROM emp e,dept d,(SELECT deptno dno,COUNT(empno) count FROM emp GROUP BY deptno) temp,emp m
WHERE e.deptno = d.dname
AND e.deptno = temp.dno
AND e.mgr = m.empno(+)
AND e.hiredate < m.hiredate;

SELECT COUNT(empno),AVG(sal) FROM emp WHERE mgr IS NOT NULL
UNION
SELECT COUNT(empno),AVG(sal) FROM emp WHERE mgr IS NULL;

SELECT e.ename,e.sal,d.loc,m.ename,temp.count,temp.max
FROM emp e,emp m,dept d,(SELECT deptno dno,COUNT(empno) count,MAX(sal) max FROM emp GROUP BY deptno) temp
WHERE e.deptno = temp.dno
AND e.mgr = m.empno(+)
AND e.deptno = d.deptno
AND e.sal >ALL (SELECT sal FROM emp WHERE deptno = 30);


SELECT *
FROM emp
WHERE deptno = 20
AND (TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12)>37)
AND sal < 2000;

SELECT deptno,dname
FROM dept
WHERE deptno IN (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(empno) >=1 );

SELECT *
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'SMITH');


SELECT e.ename,m.ename
FROM emp e,emp m
WHERE e.mgr = m.empno(+);


SELECT e.ename
FROM emp e,emp m
WHERE e.mgr = m.empno
AND e.hiredate < m.hiredate;

SELECT *
FROM emp
WHERE sal >ANY (SELECT sal FROM emp WHERE deptno = 20);


SELECT d.dname,temp.avg,temp.count
FROM dept d,(SELECT deptno dno,AVG(sal) avg,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE deptno IN (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(empno) >= 5)
AND d.deptno = temp.dno;


SELECT e.job,e.ename,d.dname,temp.count,temp.avg
FROM emp e,dept d,(SELECT deptno dno,AVG(sal) avg,COUNT(empno) count FROM emp GROUP BY deptno) temp
WHERE e.job IN (SELECT job FROM emp GROUP BY job HAVING MAX(sal) < 5000)
AND e.deptno = d.deptno
AND e.deptno = temp.dno;

SELECT substr(ename,1,2) FROM emp;


SELECT * FROM emp WHERE TO_CHAR(hiredate,'mm') = '02';

SELECT *
FROM (SELECT ROWNUM rn,emp.* FROM emp WHERE ROWNUM <= 15) temp
WHERE temp.rn > 10;

SELECT *
FROM emp
WHERE sal IN (SELECT AVG(sal) FROM emp GROUP BY deptno);


SELECT * 
FROM (SELECT deptno dno,AVG(sal) avg FROM emp GROUP BY deptno)temp,emp e
WHERE e.deptno = temp.dno
AND e.sal > temp.avg;


SELECT e.*,d.dname,temp.avg
FROM emp e,dept d,(SELECT deptno dno,AVG(sal) avg FROM emp GROUP BY deptno)temp
WHERE e.deptno = temp.dno
AND e.sal > temp.avg
AND e.deptno = d.deptno;


SELECT *
FROM emp
WHERE (sal,NVL(comm,0)) IN (SELECT sal,NVL(comm,0) FROM emp WHERE deptno = 10);

SELECT *
FROM emp
WHERE deptno In (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(empno) > 5);


UPDATE myemp e SET e.sal = (SELECT AVG(m.sal) FROM myemp m WHERE e.deptno = m.deptno GROUP BY m.deptno)+5000;


SELECT *
FROM (SELECT e.*,ROWNUM rn FROM (SELECT * FROM emp ORDER BY sal DESC)e WHERE ROWNUM <=2)temp
WHERE temp.rn >=1;


SELECT  e.ename,e.sal,temp.sum,(e.sal/temp.sum)*100
FROM emp e,(SELECT deptno dno,SUM(sal) sum FROM emp GROUP BY deptno)temp,dept d,salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal
AND s.grade = 1
AND TO_CHAR(e.hiredate,'yyyy') > 1979
AND d.loc = 'DALLAS'
AND e.deptno = temp.dno
AND e.deptno = d.deptno;


SELECT *
FROM (SELECT e.*,ROWNUM rn FROM (SELECT * FROM emp ORDER BY sal DESC)e WHERE ROWNUM <=15)temp
WHERE temp.rn >=10;

SELECT d.*
FROM emp e,dept d
WHERE e.deptno = d.deptno
GROUP BY d.deptno,d.loc,d.dname
HAVING COUNT(e.empno) = (SELECT MAX(COUNT(empno)) FROM emp GROUP BY deptno);

SELECT e.*,d.*
FROM emp e,dept d
WHERE e.deptno IN (SELECT deptno FROM emp WHERE job = 'MANAGER')
AND e.sal IN (SELECT MIN(MIN(sal)) FROM emp GROUP BY deptno)
AND e.deptno = d.deptno;

SELECT *
FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE job != 'MANAGER' OR job != 'PRESIDENT')

SELECT d.loc,d.dname,e.*
FROM emp e,dept d
WHERE e.deptno IN (SELECT distinct deptno
FROM emp
WHERE deptno NOT IN (SELECT deptno
FROM emp
WHERE sal < 1200))
AND e.deptno = d.deptno;


SELECT distinct deptno
FROM emp
WHERE deptno NOT IN (SELECT deptno
FROM emp
WHERE sal < 1200);

SELECT *
FROM emp
WHERE LENGTH(ename) = 4;

CREATE TABLE product(
    product_id VARCHAR2(3),
    product_name VARCHAR2(200) NOT NULL,
    price NUMBER,
    category VARCHAR2(40),
    provider VARCHAR2(40),
    CONSTARINT pk_product_id PRIMARY KEY(product_id),
    CONSTARINT ck_price CHECK(price > 0)
);

CREATE TABLE customer(
    customer_id VARCHAR2(3),
    name VARCHAR2(40) NOT NULL,
    location VARCHAR2(200),
    CONSTARINT pk_customer_id PRIMARY KEY(customer_id)
);

CREATE TABLE purchase(
    customer_id VARCHAR2(3),
    product_id VARCHAR2(3),
    quantity NUMBER NOT NULL,
    CONSTARINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE cascade,
    CONSTARINT fk_product_id FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE cascade,
    CONSTARINT ck_quantity CHECK(quantity BETWEEN 0 AND 20)
);




