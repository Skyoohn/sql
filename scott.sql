SELECT * FROM EMP;
SELECT * FROM emp WHERE SAL = 5000;
select * from emp where deptno = 20;

select * from emp where sal != 3000; --�����ڰ� ���� ���� ���� ǥ��
select * from emp where sal <> 3000; --DBA�� ���� ���� ���� ǥ��
select * from emp where sal ^= 3000;

select * from emp where ename = 'SMITH'; -- �÷����� ��ҹ��� �Ȱ����� �����ʹ� ����
select * from emp where job = 'PRESIDENT';
select * from emp where hiredate >= '82/01/01';
select * from emp where deptno = 10 and JOB = 'MANAGER'; --���� 2��
select * from emp where DEPTNO = 10 or job = 'MANAGER';
select * from emp where not deptno = 10; --10�� �ƴ�


select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000; -- ���� ���� ��Ÿ��

select * from emp where sal < 2000 or sal > 3000; 
select * from emp where sal not between 2000 and 3000; 

select * from emp where hiredate >= '82/01/01';
select * from emp where hiredate between '82/01/01' and '82/12/31';

select * from emp where comm = 300 or comm = 500 or comm = 1400;
select * from emp where comm in (300,500,1400); -- in�� or, ���� ���x

select * from emp where comm not in (300,500,1400);



-- 7/10


select * from emp where ename like 'F%'; --F�� �����ϴ� ��� ã��

select * from emp where ename like '%A%'; --�յ� ������� A�� �� ���

select * from emp where ename like '%N'; --�̸��� N���� ������ ���

select * from emp where ename like '_A%'; -- �̸��� �ι�° ���ڰ� A�� ���

select * from emp where ename like '__A%'; -- �̸��� ����° ���ڰ� A�� ���

select * from emp where ename not like '%A%'; --�̸��� A�� �ȵ� ���

select * from emp where comm is null; -- comm�� null �� ���

select * from emp where comm is not null;

select * from emp  order by  sal asc; -- ��������

select * from emp  order by  sal desc; --��������

select * from emp  order by  hiredate desc; --���� �ֱ� �Ի� ���

select * from emp  order by ename asc; -- �̸� ������

select * from emp where sal >= 3000 order by ename asc; -- ���� 3000 �̻� �̸� ������

select DISTINCT deptno from emp; -- �ߺ� �����ؼ� �μ���ȣ ���

select  sal * 12 as ������ from emp; -- �÷��� ���� ����, as �� ��Ī(�ٸ��) �ֱ� ����

select ename || ' is a ' || job "�������� ��" from emp; -- ||�� ���ڿ��� �߰� �����Ŵ ��Ī�� " "��, as ���� ���� 

desc dept;   -- �÷��� ���� Ȯ��

select 24 * 26 from dual;

select sysdate from dual;    -- ���� ��¥

select abs(-10) from dual; -- abs�� ���밪 ���ϴ� ���

-- �Ҽ��� �Ʒ��� ������ �Լ�
SELECT 34.5432, FLOOR(34.5432) FROM DUAL;

select 34.5678, round(34.5678,2) from dual;    -- �Ҽ��� 2 �ڸ����� �ݿø�, �Ⱦ��� 0�� ����

select mod(27, 2), mod(27, 5), mod(27, 7) from dual;  -- ������ �� ���� ������ (�ڹ��� %)

select 'oracle', upper('oracle') from dual; -- upper �빮��

select lower ('ORACLE') from dual;

select lower(ename) from emp; -- ename �� �ҹ��ڷ� ���

select initcap('oracle') from dual; -- ù���ڸ� �빮��

select initcap(ename) from emp; -- ename �ȿ��� ù���ڸ� �빮��

select length(ename), ename from emp;   -- ���� ���� �̱�

select SUBSTR('oracle',0,1) from dual;    

select SUBSTR(ename,0,1) from emp;    -- �� �ձ���

select SUBSTR('Smith',2,2) from dual; -- 2,3��° ����

select substr(ename,2,2) from emp; -- 2,3��° ����

select * from emp;

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)�⵵, SUBSTR(HIREDATE, 4, 2)�� FROM EMP; 

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)�⵵, SUBSTR(HIREDATE, 4, 2)�� 
FROM EMP
where substr(hiredate,4,2) = '09';   -- 9�� �Ի��� ������   (�� = 09 �� �ȵǴ� ������ where�� ���� ����Ǳ� ����)

select ltrim('          oracle') from dual;   -- ���� ���� (����)

select trim('          oracle                       ') from dual;

select sysdate -1 from dual;  -- ���� ��¥

select SYSDATE +1 from dual; -- ����

select ename, sysdate, hiredate, floor(months_between(sysdate,hiredate)) �ٹ������� from emp;  --�Ҽ��� ����

select ename, hiredate, add_months(hiredate, 4) from emp;  -- �Ի� ��¥���� 4���� �߰�

select sysdate, next_day(sysdate,'�ݿ���') from dual;    -- ���� ���� ���� ����� ���� ������ (OS ��� �������� ���� �ν�)

select hiredate, last_day(hiredate) from emp;    -- �Ի��� ���� ��������


select sysdate, to_char (sysdate, 'yyyy-mm-dd') from dual;  -- ���� ��¥�� ���������� ��ȯ�Ͽ� ���

select hiredate, to_char(hiredate,'yyyy/mm/dd day') as �Ի��� from emp;   -- �Ի��� ���, ���ϰ� �Բ� (day�� ����)

select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;


desc emp; 

select ename, sal, to_char(sal, 'l99,999') from emp; -- �� ������ ��ȭ��ȣ�� �տ� ���̰� õ�������� �޸��� �ٿ��� ���

select ename, hiredate from emp where hiredate = '1981-02-20';      -- ��¥���� ' ' �� ��ȯ      to_char('1981/02/20') �� ���� (�������� ���̷�Ʈ�� ��������� �ȵȴٴ°� �߿�)
select ename, hiredate from emp where hiredate = to_date(19810220,'yyyymmdd');    -- ���� ������

select sysdate - to_date ('2016/01/01','yyyy/mm/dd') from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;   -- ���ڸ� ���ڷ� �ٲ�

select ename, sal, sal * 12 + nvl(comm,0) comm from emp;    -- null�� 0���� �ٲ��(null value) ��������Ҷ�

select ename, sal, sal * 12 + nvl(comm,0) ����, nvl(comm,0) from emp; 

select deptno from emp order by deptno;

select deptno, decode(deptno,10,'a',20,'b',30,'c') from emp order by deptno;    -- decode �Լ� (����, string�� ����)
select ename, deptno, decode (deptno,10,'accounting',20,'research',30,'sales') as dname from emp order by deptno;   -- ����

select ename, deptno,    -- if���� ����
       case when deptno = 10 then 'accounting'
                when deptno = 20 then 'research'
                when deptno = 30 then 'sales'
                when deptno = 40 then 'operations'
      end as ENAMEs
from emp;

select ename, sal,
    case when sal > 2500 then '��'
              when sal < 2500 then '��'
    end as ���
    from emp;
    
select deptno, sal, round(sal, -3) from emp;     -- -3�̸� 0���� +3�ڸ� �ݿø�, ������ �Լ� (������ �ึ�� ����)

select  sum(sal) from emp;   -- �׷��Լ��� ����� �� �޿� Ȯ�� select * , �� �ȵǴ� ������ 12�� ��ü�� �� �ѷ��� �ϱ� ���� (�׷��Լ��� 1���� �Ѹ�, ����Ǵ� �ο���� �ٸ���)

select avg (sal) from emp;  -- ���

select max(sal) from emp;  -- �ִ밪
select min(sal) from emp;  -- �ּҰ�

select count (*) from emp;  -- �� �����

select * from emp;

select count(DISTINCT  job) from emp;     -- DISTINCT �ߺ����ŷ� job ���� ��� (�ο� ���� ���)

select deptno from emp group by deptno;   -- Ư�� �÷� �������� �׷�ȭ (�ߺ� ����)

--select ename from emp group by deptno; -- �׷����� �����µ� �̸��� �Ѹ��� ���� ������ ����ȵ�

select deptno, avg(sal) from emp group by deptno;   -- 1. �÷��� group by �� �÷� ���� �� �� �ִ�. 2. ���� �Լ��� �� �� �ִ�.(�����Լ� X) (�׷� 10,20,30 ����� sal �ִ°�)

select deptno, sum(sal) from emp group by deptno;

select deptno, max(sal), min(sal) from emp group by deptno;  -- �ִ�� �ּ�

select deptno, count(*)  from emp group by deptno;  --�μ��� �����

select count (job) from emp group by job;  --���Ժ� �����

select * from emp;

select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;    -- �׷캰 ��պ���

select deptno, max(sal), min(sal) from emp group by deptno having max(sal) >= 2900;    -- �μ��� �ִ밪�� �ּҰ��� ���ϵ�, �ִ� �޿��� 2900 �̻��� �μ��� ���


-- 7/11


 select * from emp, dept;    -- join�� �⺻������ ī���̼� ��  (emp ����: 4���� ��� ��Ҹ� ����)
 
 select * from emp, dept where emp.deptno = dept.deptno;    -- ����� ���� ��½�, �� ����� �Ҽӵ� �μ��� �������� ����ϱ� ���� �ΰ��� ���̺��� ���� (dept������ emp�� dept�� �����͸� ǥ��)
 
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';     -- smith�� ����� �μ��� ���

select ename, dname from emp e, dept d where e.deptno = d.deptno and e.ename = 'SMITH';    -- ��Ī �ֱ� ����


select * from salgrade;   -- �޿� ���

select * from emp, salgrade where sal between losal and hisal order by ename;   -- �� ����� �޿��� �������� ���캸�� ������

select * from emp, salgrade,dept                -- + ����� �μ���
where dept.deptno = emp.deptno and sal between losal and hisal 
order by ename;

SELECT E.ENAME||'�� �Ŵ����� '|| M.ENAME||'�Դϴ�.' FROM EMP E, EMP M WHERE E.MGR = M.EMPNO;   -- �Ŵ��� ���ϱ�


-- anci ���� (�����)

select * from emp, dept where emp.deptno = dept.deptno;
-- = �� �Ʒ� ����
select * from emp inner join dept on emp.deptno = dept.deptno;


-- (outer join)

select * from dept left outer join emp on emp. deptno = dept.deptno;   -- �����տ��� dept (left)�� ����ִ°� ���ԵǾ��ִ�
select * from emp left outer join dept on emp. deptno = dept.deptno;   --

select * from dept, emp where emp.deptno(+) = dept.deptno;  --  (+)�� emp�� dept�� �ִ°� �ϳ� �� �߰�


-- ���Ͽ�

--select a.job, b.deptno
--from (select job, deptno from emp where sal >= 3000)  a, (select job, deptno from emp where deptno = 10) b;   -- ���ص���

select job, deptno from emp where sal >= 3000
union all
select job, deptno from emp where deptno = 10;    -- ������ (union�� �ߺ��Ұ�) (union all�� �ߺ� ���)


-- ��������

select deptno from emp where ename = 'SMITH';
select dname from dept where deptno = 20;

--join ���
select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

-- ��������
select dname from dept           -- �ϳ��� select ���� ���� ���Ե� �� �ϳ��� select ������ �ִ� ������
where deptno = (select deptno from emp where ename = 'SMITH');           -- �� �������� �����ʿ� ���, �ݵ�� ��ȣ �ȿ� �־�� �Ѵ�.

select * from emp;

select * from emp
where sal > (select avg (sal) from emp);  -- ��� �޿����� ���� �޴� ���

select * from emp
where sal > (select sal from emp where ename = 'SMITH');    -- ���̽����� ���� �޴� ��� ���


---

desc emp;