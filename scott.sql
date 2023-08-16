desc mvc_board;
  
select * from mvc_board order by bgroup desc,bstep asc;

create table mvc_board(
    bid NUMBER(4) PRIMARY KEY,
    bname VARCHAR2(20),
    btitle VARCHAR2(100),
    bcontent VARCHAR2(300),
    bdate DATE DEFAULT SYSDATE,
    bhit NUMBER(4) DEFAULT 0,
    bgroup NUMBER(4),
    bstep NUMBER(4),
    bindent NUMBER(4)
);

commit;

--sequence ����
create sequence mvc_board_seq;

--�ְ���� ��ŭ �� ����(�����Ҷ����� commit�� �Բ� ����� ��)
insert into mvc_board(bid, bname, btitle, bcontent, bhit, bgroup, bstep, bindent)
values (mvc_board_seq.nextval, 'abcd', 'is title', 'is content', 0, 
mvc_board_seq.currval, 0, 0);

select  *  from mvc_board;





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

select ename, sal, to_char(sal, 'l99,999') as ��ȭ from emp; -- �� ������ ��ȭ��ȣ�� �տ� ���̰� õ�������� �޸��� �ٿ��� ���

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

select * from emp, salgrade where sal between losal and hisal order by ename;   -- �� ����� �޿��� �������� ���캸�� ������ // �ܿ��� ��

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



-- 7/12

--������ �������� - ������ �����ڿ� �Բ� ���

-- ������ 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� ������
select ename, sal, deptno
from emp
where deptno in (
select distinct deptno 
from emp 
where sal >= 3000
);

--�μ� ��ȣ�� 30���� ������� �޿� �� ���� ���� ��(800)���� ���� �޿��� �޴� ����� �̸�, �޿��� ����ϴ� ������
--select ename, sal, deptno
--from emp
--where deptno in (select deptno from emp where sal > 800 and deptno = 30);

select *
from emp
where deptno = 30 and sal > (select min(sal) from emp);

-- any (or)
select ename, sal
from emp
where sal > any (select sal from emp where deptno = 30);

select *
from emp
where sal = any(1000,2000,3000);    -- �����ϴ� ���� �ϳ��� ������ ����� ����, =�϶��� in�� ����

select *
from emp
where sal > any(1000,2000,3000);    --1000���� ũ�ų� 2000���� ũ�ų� 3000���� ũ��, min(1000)�� ����

select *
from emp
where sal >= any(1000,2000,3000);    -- >= 1000

select *
from emp
where sal < any(1000,2000,3000) order by sal;    -- max(3000)

-- all

select *
from emp
where sal > all (select sal from emp where deptno = 30);   -- 30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϴ� ������
select ename, sal
from emp
where sal > (select max(sal) from emp where deptno = 30);

select *
from emp
where sal = all(1000,2000,3000);    -- ��� ���� �����ؾ� ��, and���� (sal�� 1000,2000,3000)

select *
from emp
where sal> all(1000,2000,3000);   -- ���� ū��(3000)���� ū��
select * from emp where sal >1000 and sal >2000 and sal>3000;


select *
from emp
where sal< all(1000,2000,3000); -- ���� ������(1000)���� ū��


--sql 50��

select * from dept;

select job,deptno,ename,hiredate
from emp;

SELECT DISTINCT JOB
FROM EMP;
select job
from emp group by job;

select *
from emp where sal >=2850;

select ename,deptno
from emp
where empno = 7566;

select ename, sal   -- �ܿ�����
from emp
where sal not between 1500 and 2850;

select ename, job, hiredate
from emp
where hiredate between '1981/02/20' and '1981/05/01'  order by hiredate asc;

-- DDL (���̺� ������ �����ϴ� create table)

create table EMP01(
    empno number(4),
    ename varchar2(20),
    sal number(7,2)
);   -- table ����

desc emp01;

create table emp02 as select * from emp;   -- data ��ü ����

desc emp02;

select * from emp02;

create table emp03 as select empno,ename from emp;   -- empno,ename�� ����

select * from emp03;

--ALTER TABLE (���� ���̺��� ��������)

alter table emp01 add (job varchar2(9)); --���� �߰�
desc emp01;
alter table emp01 modify (job varchar2(30)); -- ���� ����

alter table emp01 drop column job;  --����

--DROP TABLE

drop table emp01;

--���̺� ������ ���Ἲ ���� ����

--Truncate table

select * from emp02;

truncate table emp02;

--���̺�� ����
rename emp02 to test;
desc test;
rename test to emp02;
desc emp02;


--�ý��� ������ ��ųʸ�

desc user_tables;
select * from user_tables;

select table_name from user_tables;

desc all_tables;
select * from all_tables;


-- ���̺��� ������ �߰�, ����, �����ϴ� DML
-- CRUD

create table dept02 as select * from dept;

select * from dept02;
TRUNCATE table dept02;

--insert
insert into dept02(deptno,dname,loc) values (10,'ACCOUNTING','NEW YORK');
insert into dept02(deptno,dname,loc) values (20,'RESEARCH','DALLAS');
commit;  --��������

CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;   -- �������� ���� �Ұ� (false �� �ȳ��´�) �ƹ��͵� �������� �ʰ� ������ ������

select * from dept03;

drop table emp01;
create table emp01 as select * from emp;

select * from emp01;
update emp01 set deptno = 30;   --��� ����� �μ� ��ȣ�� 30������ ����

update emp01 set sal = sal * 1.1;  - ���� 10% �λ�
commit;

update emp01 set hiredate = sysdate;  --��� ����� �Ի����� ���÷� ����

update emp01 set deptno = 40 where deptno = 10;     -- 10�� ����� 40������ ����

update emp01 set sal = sal * 1.1 where job = 'MANAGER';   -- �Ŵ��� ���� 10% �λ�
update emp01 set hiredate = sysdate where ename = 'MILLER'; - �з��� ���ó�¥��

update emp01 set hiredate = sysdate where substr(hiredate, 1, 2) = '82';
update emp01 set hiredate = sysdate where hiredate between '82/01/01' and '82/12/31'; -- 82�� �Ի��� ���ó�¥��

update emp01 set deptno=20, job='MANAGER' where ename = 'SMITH';

update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SMITH';  -- ���̽� sal 50, comm 4000, �Ի��� ����

DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
select * from dept01;

update dept01 set  loc = (select loc from dept01 where deptno=40) where deptno = 20;  -- 20�� �������� 40������

--delete

delete from dept01;
commit;
rollback;

delete from dept01 where deptno = 30;   -- 30�� �μ� ������ �μ� ���̺� Ȯ��

select * from emp01;
select * from dept01;

DELETE FROM EMP01 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');   -- ���� ���������� �μ����� SALES�� �μ��� ��ȣ���� �˾Ƴ� �� SALES �μ� �Ҽ��� ����� �����ϴ� ������


--- Ʈ������ ����

DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
select * from dept01;

delete from dept01;

rollback;

delete from dept01 where deptno = 20;
commit;

-- not null

--null ������ ��
DROP TABLE EMP02;
CREATE TABLE EMP02(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

desc emp02;
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, 'ȫ�浿','SALESMAN', 20);
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, 'ȫ�浿',null, null);
INSERT INTO EMP02 (EMPNO, ENAME) values (1, 'ȫ�浿');

select * from emp02;


-- unique�� �ߺ� ���X
DROP TABLE EMP03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) primary key,   -- unique not null ��ģ��
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, 'ȫ�浿',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, 'ȫ�浿',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, 'ȫ���',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (null, 'ȫ���',null, null);

select * from emp03;

DROP TABLE EMP05;
CREATE TABLE EMP05(
EMPNO NUMBER(4) CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY, 
ENAMR VARCHAR2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL, 
JOB VARCHAR(9), DEPTNO NUMBER(2));


DROP TABLE EMP06;


--7/13

--foreign

CREATE TABLE EMP06(
EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,     -- ������ �㶧 EMP06_EMPNO_PK �� ��� (��� ��)
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR(9), 
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO));   -- REFERENCES�� foreignŰ ����

select * from emp06;

insert into emp06 values(7499,'ALLEN','SALESMAN',30);

insert into emp06 values(7800,'ȫ�浿','SALESMAN',50);   -- �θ� 50���� ��� �������


--check (�߾Ⱦ�)

create table student(
    id number(4) primary key,
    score number(3) not null,    
    constraint SCORE_CHECK check (score >= 0)
    );
    
insert into student values(1,100);
insert into student values(2,-20);
      
select * from student;

--������

drop sequence EMP_SEQ;
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;          -- start with 1�� 1����

DROP TABLE EMP01;

CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY, 
    ENAME VARCHAR(10), 
    HIREDATE DATE
);

insert into emp01 values(
EMP_SEQ.NEXTVAL,'ȫ�浿',SYSDATE);    

select * from emp01;

select EMP_SEQ.currval from dual;
select EMP_SEQ.nextval from dual;             

alter sequence EMP_SEQ increment by 2;         -- 2�� ���� �ϵ��� ����

--50��

select * from emp;

--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ�� ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
select deptno, ename 
from emp 
WHERE DEPTNO IN(10,30)
ORDER BY ENAME;

-- 9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ����϶�.
-- (�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)

--���� ������ " "
SELECT ENAME AS "Employee", SAL AS "Monthly Salary"
FROM EMP
WHERE DEPTNO IN(10,30) AND SAL>1500;

select * from emp;

--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.
select ename, job 
from emp 
where mgr is null;

--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, �޿��� �������� ������������ �����Ͽ� ����϶�.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC;

--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
select * from emp where ename like '__A%';

--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.
select ename from emp where ename like '%L%L%' and deptno = 30;

--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
select job, ename, sal
from emp 
where job in ('CLERK', 'ANALYST') and sal not in(1000,3000,5000);

--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� �÷����� New Salary�� �����Ͽ� ����϶�.
SELECT EMPNO, ENAME, SAL,
ROUND(SAL+(SAL*0.15),0) AS "New Salary"
FROM EMP;

--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�).
SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15) ) AS "New Salary",
(ROUND(SAL+(SAL*0.15)))-SAL AS "Increase"
FROM EMP;

--18> ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ� ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
SELECT UPPER(SUBSTR(ENAME,1,1)) || LOWER(SUBSTR(ENAME,2,12)) AS "NAME",    -- ||�� �׳� +
LENGTH(ENAME) AS "LENENAME"
FROM EMP;

select initcap (ename) as "ename",
length (ename) as "lenename"
from emp;

--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� ����� Ŀ�̼��� 'no commission'���� ����϶�.
SELECT ENAME, NVL(TO_CHAR(COMM),'no commission')
FROM EMP;

--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.(DECODE)
SELECT empno, deptno , DECODE(deptno,10,'ACCOUNTING' ,
20,'RESEARCH',
30,'SALES',
40,'OPERATIONS') AS "dname"
FROM EMP;

--���� �̰ź��� ���� ����
select *
from emp e, dept d
where e.deptno=d.deptno; 

--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=30;

--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
SELECT DISTINCT E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO=30;

--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.
select e.ename, e.deptno, d.loc
from emp e, dept d
where e.deptno=d.deptno and e.comm is not null;

--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME LIKE '%A%';

--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno and d.loc = 'DALLAS';

select * from emp;

--26> ��� �̸� �� �����ȣ, �ش� ������ �̸� �� ������ ��ȣ�� ����ϵ�, �� Į������ EMPLOYEE,EMP#,MGR#,MANAGER���� ǥ���Ͽ� ����϶�.
select e.ename as employee, e.empno as emp#, e.mgr as mgr#, m.ename as manager
from emp e, emp m    -- self join
where E.MGR = M.EMPNO;

--27>��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;


CREATE TABLE users (
	"ID"	varchar2(50)		NULL,
	"email"	varchar(100)		NOT NULL
);

CREATE TABLE "users" (
	"ID"	varchar2(50)		NULL,
	"email"	varchar(100)		NOT NULL,
	"Key"	number		NOT NULL
);

CREATE TABLE "images" (
	"Key"	number		NOT NULL,
	"Field"	varchar2(200)		NOT NULL
);

ALTER TABLE "images" ADD CONSTRAINT "PK_IMAGES" PRIMARY KEY (
	"Key"
);



--7/17

--rownum (����Ŭ�� ����¡)
--select �ؿ� �����Ϳ� �Ϸù�ȣ ���̱� = 1������ ���̱�

select rownum, emp.*  from emp where rownum  <= 10;

--select rownum, emp.*  from emp where rownum between 5 and 10;  -- �� �ȵǴ� ������ rownum�� 1���� ���۵Ǳ� ����

select *
from (select rownum as rn, emp.* from emp)
where rn between 5 and 10; -- 1�� ���� �̾ƾ� �ϱ� ����

--28> smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�. 

select ename, hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'SMITH');  --�ʰ� �Ի��� ����� ���ڰ� �� ũ��

--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���,
--�������� �̸�, �������� �Ի����� ����ϵ� ���� �÷�����
--Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� ����϶�.

SELECT E.ENAME AS "Employee", E.HIREDATE AS "EmpHIredate",
M.ENAME AS "Manager",
M.HIREDATE AS "MgrHiredate"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO AND E.HIREDATE<M.HIREDATE;

--7/18

--30> ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϵ�
--�� Į������ maximum, minimum, sum, average �� �����Ͽ� ����϶�.
select max(sal) maximum, min(sal) minimum, sum(sal) sum, avg(sal) average
from emp;

--31> �� �������� �޿� ������, �ְ��, �Ѿ�, �� ��վ��� ����϶�. (group by�� select�� ���� �־�� �Ѵ�)
select job, max(sal) maximum, min(sal) minimum, sum(sal) sum, avg(sal) average
from emp 
group by job;

--32> ������ ������ ��� ���� ������ ���� ����϶�.
select job, count(job)
from emp
group by job;

--33>�������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�. �׸���,
--Į������ number of manager�� �����Ͽ� ����϶�.
select count(distinct(mgr)) as "number of manager"
from emp;



--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
select max(sal) - min(sal)
from emp;

--35> ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�.
--��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� �޿��� ��������
--��� ����� ������������ �����϶�.

select mgr, min(sal)
from emp
where mgr is not null 
group by mgr 
having min(sal) >= 1000 order by min(sal);

--7/19

--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
--�׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
select e.deptno "�μ���",d.dname "�μ��̸�",count(e.empno) "����� ��",avg(sal) "��ձ޿�",d.loc "��ġ"
from emp e, dept d
where E.DEPTNO=D.DEPTNO
group by e.deptno, d.dname, d.loc;


--37> smith�� ������ �μ��� ���� ����� �̸� �� �Ի����� ����϶�.
select ename, hiredate
from emp
where deptno in(select deptno from emp where ename = 'SMITH')
and ename != 'SMITH';


--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� �����ȣ, �̸�, �޿���
--ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ���� �������� �����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

select empno, ename, sal, (select avg(sal) from emp) as "���" 
from emp 
where sal > (select avg(sal) from emp) order by sal desc;

SELECT e.EMPNO, e.ENAME, e.SAL, d.avgsal as "���"
FROM EMP e, (SELECT AVG(SAL) as avgsal FROM EMP) d
WHERE e.SAL >(SELECT AVG(SAL)FROM EMP)
ORDER BY e.SAL DESC;

select * from emp;
select * from dept;

--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ �� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%');


select * from mvc_board;



begin
  for i in 1..1000 loop
   insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) 
   values (mvc_board_seq.nextval, 'test' , '�׽�Ʈ', '�׽�Ʈ', 0, mvc_board_seq.currval, 0, 0);
  end loop;
commit;
end;


commit;

select * from mvc_board where bid >= 1 and bid <= 10;
--rownum : ��ȸ�� ������ �ű涧 ���

select rownum, a.* from emp a;

select rownum rn, m.* from mvc_board m where rownum <=10;


select rownum rn, m.* from mvc_board m where rownum >0 and rownum <= 20;


        SELECT * FROM (
              SELECT ROWNUM AS RNUM, A.* FROM (
                       SELECT
                             *
                         FROM
                             mvc_board 
                         order by bGroup desc, bStep asc   
             ) A WHERE ROWNUM <= 20
         ) WHERE RNUM > 10;
         ;
         
