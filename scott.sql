--SELECT * FROM EMP;
--SELECT * FROM emp WHERE SAL = 5000;
--select * from emp where deptno = 20;

--select * from emp where sal != 3000; --�����ڰ� ���� ���� ���� ǥ��
--select * from emp where sal <> 3000; --DBA�� ���� ���� ���� ǥ��
--select * from emp where sal ^= 3000;

--select * from emp where ename = 'SMITH'; -- �÷����� ��ҹ��� �Ȱ����� �����ʹ� ����
--select * from emp where job = 'PRESIDENT';
--select * from emp where hiredate >= '82/01/01';
--select * from emp where deptno = 10 and JOB = 'MANAGER'; --���� 2��
--select * from emp where DEPTNO = 10 or job = 'MANAGER';
--select * from emp where not deptno = 10; --10�� �ƴ�

--select * from emp where sal >= 2000 and sal <= 3000;
--select * from emp where sal between 2000 and 3000; -- ���� ���� ��Ÿ��

--select * from emp where sal < 2000 or sal > 3000; 
--select * from emp where sal not between 2000 and 3000; 

--select * from emp where hiredate >= '82/01/01';
--select * from emp where hiredate between '82/01/01' and '82/12/31';

--select * from emp where comm = 300 or comm = 500 or comm = 1400;
--select * from emp where comm in (300,500,1400); -- in�� or, ���� ���x

--select * from emp where comm not in (300,500,1400);