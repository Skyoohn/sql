CREATE TABLE TBL_TEACHER_202201(
TEACHER_CODE CHAR(3) NOT NULL PRIMARY KEY,
TEACHER_NAME VARCHAR2(15),
CLASS_NAME VARCHAR2(20),
CLASS_PRICE NUMBER(8),
TEACHER_REGIST_DATE VARCHAR2(8)
);

CREATE TABLE TBL_MEMBER_202201(
C_NO CHAR(5) NOT NULL PRIMARY KEY,
C_NAME VARCHAR2(15),
PHONE VARCHAR2(11),
ADDRESS VARCHAR2(50),
GRADE VARCHAR2(6)
);

CREATE TABLE TBL_CLASS_202201(
REGIST_MONTH VARCHAR2(6),
C_NO CHAR(5),
CLASS_AREA VARCHAR2(15),
TUITION NUMBER(8),
TEACHER_CODE CHAR(3),
CONSTRAINT CLASS_PK PRIMARY KEY (REGIST_MONTH, C_NO)
);

CREATE TABLE MEMBER_TBL_02(
CUSTNO NUMBER(6) NOT NULL PRIMARY KEY,
CUSTNAME VARCHAR2(20),
PHONE VARCHAR2(13),
ADDRESS VARCHAR2(60),
JOINDATE DATE,
GRADE CHAR(1),
CITY CHAR(2)
);

CREATE TABLE MONEY_TBL_02(
CUSTNO NUMBER(6) REFERENCES MEMBER_TBL_02(CUSTNO),
SALENOL NUMBER(8) NOT NULL PRIMARY KEY,
PCOST NUMBER(8),
AMOUNT NUMBER(4),
PRICE NUMBER(8),
PCODE VARCHAR2(4),
SDATE DATE
);

CREATE TABLE TBL_VOTE_202005(
V_JUMIN CHAR(13) NOT NULL PRIMARY KEY,
V_NAME VARCHAR2(20),
M_NO CHAR(1),
V_TIME CHAR(4),
V_AREA CHAR(20),
V_CONFIRM CHAR(1)
);

CREATE TABLE TBL_MEMBER_202005(
M_NO CHAR(1) NOT NULL PRIMARY KEY,
M_NAME VARCHAR2(20),
P_CODE CHAR(2),
P_SCHOOL CHAR(1),
M_JUMIN CHAR(13),
M_CITY VARCHAR2(20)
);

CREATE TABLE TBL_PARTY_202005(
P_CODE CHAR(2) NOT NULL PRIMARY KEY,
P_NAME VARCHAR2(20),
P_INDATE DATE,
P_READER VARCHAR2(20),
P_TEL1 CHAR(3),
P_TEL2 CHAR(4),
P_TEL3 CHAR(4)
);

--�ȵ�
--CREATE TABLE MEMBER_TBL_02(
--CUSTNO NUMBER(6) NOT NULL PRIMARY KEY,
--CUSTNAME VARCHAR2(20),
--PHONE VARCHAR2(13),
--ADDRESS VARCHAR2(60),
--JOINDATE DATE,
--GRADE CHAR(1),
--CITY CHAR(2)
--);
--
--CREATE TABLE MONEY_TBL_02(
--CUSTNO NUMBER(6) REFERENCES MEMBER_TBL_02(CUSTNO),
--SALENOL NUMBER(8) NOT NULL PRIMARY KEY,
--PCOST NUMBER(8),
--AMOUNT NUMBER(4),
--PRICE NUMBER(8),
--PCODE VARCHAR2(4),
--SDATE DATE
--);

INSERT INTO TBL_TEACHER_202201 VALUES('100','���ʱ�','�ʱ޹�',100000,'20220101');
INSERT INTO TBL_TEACHER_202201 VALUES('200','���߱�','�߱޹�',200000,'20220102');
INSERT INTO TBL_TEACHER_202201 VALUES('300','�ڰ��','��޹�',300000,'20220103');
INSERT INTO TBL_TEACHER_202201 VALUES('400','����ȭ','��ȭ��',400000,'20220104');

INSERT INTO TBL_MEMBER_202201 VALUES('10001','ȫ�浿','01011112222','����� ������','�Ϲ�');
INSERT INTO TBL_MEMBER_202201 VALUES('10002','�����','01022223333','������ �д籸','�Ϲ�');
INSERT INTO TBL_MEMBER_202201 VALUES('10003','�Ӳ���','01033334444','������ ������','�Ϲ�');
INSERT INTO TBL_MEMBER_202201 VALUES('20001','������','01044445555','�λ�� ����','VIP');
INSERT INTO TBL_MEMBER_202201 VALUES('20002','�̸���','01055556666','�뱸�� �ϱ�','VIP');

INSERT INTO TBL_CLASS_202201 VALUES('202203','10001','���ﺻ��',100000,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203','10002','�����п�',100000,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203','10003','�����п�',200000,'200');
INSERT INTO TBL_CLASS_202201 VALUES('202203','20001','�λ�п�',150000,'300');
INSERT INTO TBL_CLASS_202201 VALUES('202203','20002','�뱸�п�',200000,'400');


SELECT * FROM TBL_CLASS_202201;

SELECT * FROM TBL_TEACHER_202201;

SELECT * FROM TBL_MEMBER_202201;


SELECT TEACHER_CODE AS �����ڵ�,CLASS_NAME AS ���Ǹ�,TEACHER_NAME AS �����,CLASS_PRICE AS �Ѹ���
FROM TBL_TEACHER_202201;


SELECT * FROM TBL_TEACHER_202201,TBL_CLASS_202201
WHERE TBL_TEACHER_202201.TEACHER_CODE = TBL_CLASS_202201.TEACHER_CODE;


select distinct a.TEACHER_CODE, a.TEACHER_NAME, a.TEACHER_NAME, d.TUITION
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE; 

SELECT *
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE; 




select a.TEACHER_CODE AS �����ڵ�, a.CLASS_NAME AS ���Ǹ�, a.TEACHER_NAME AS �����, '\'||SUM(d.TUITION) AS �Ѹ���
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE
group by a.TEACHER_CODE, a.CLASS_NAME, a.TEACHER_NAME, d.TUITION
order by a.TEACHER_CODE;



--����
select a.TEACHER_CODE AS �����ڵ�, a.CLASS_NAME AS ���Ǹ�, a.TEACHER_NAME AS �����, to_char((SUM(d.TUITION)),'l999,999') AS �Ѹ���
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE
group by a.TEACHER_CODE, a.CLASS_NAME, a.TEACHER_NAME, d.TUITION
order by a.TEACHER_CODE;


-- ��ǥ


select * from tbl_vote_202005;

insert into tbl_vote_202005 values('99010110001','������','1','0930','��1��ǥ��','N');

insert into tbl_vote_202005 values('89010120002','������','2','0930','��1��ǥ��','N');


insert into tbl_vote_202005 values('69010110003','������','3','0930','��1��ǥ��','Y');



insert into tbl_vote_202005 values('59010120004','ȫ����','4','0930','��1��ǥ��','Y');


insert into tbl_vote_202005 values('79010110005','������','5','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('89010120006','������','1','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('59010110007','������','1','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('49010120008','������','3','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('79010110009','������','3','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('89010120010','������','4','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('99010110011','������','5','0930','��1��ǥ��','Y');

insert into tbl_vote_202005 values('79010120012','������','1','1330','��1��ǥ��','Y');

insert into tbl_vote_202005 values('69010110013','������','4','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('89010110014','������','2','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('99010110015','������','3','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('79010110016','������','2','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('89010110017','������','4','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('99010110018','������','2','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('99010110019','������','4','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('79010110020','Ȳ����','5','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('69010110021','������','3','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('79010110022','������','3','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('99010110023','������','1','1330','��2��ǥ��','Y');

insert into tbl_vote_202005 values('59010110024','������','3','1330','��2��ǥ��','Y');


SELECT * FROM TBL_MEMBER_202005;


INSERT INTO TBL_MEMBER_202005 VALUES('1','���ĺ�','P1','1','6603011999991','����ȭ��');
INSERT INTO TBL_MEMBER_202005 VALUES('2','���ĺ�','P2','3','5503011999992','�ε鷡��');
INSERT INTO TBL_MEMBER_202005 VALUES('3','���ĺ�','P3','2','7703011999993','���Ȳɵ�');
INSERT INTO TBL_MEMBER_202005 VALUES('4','���ĺ�','P4','2','8803011999994','���޷���');
INSERT INTO TBL_MEMBER_202005 VALUES('5','���ĺ�','P5','3','9903011999995','��������');



INSERT INTO TBL_PARTY_202005 VALUES('P1','A����','2010-01-01','����ǥ','02','1111','0001');
INSERT INTO TBL_PARTY_202005 VALUES('P5','E����','2010-05-01','�Ӵ�ǥ','02','1111','0005');


SELECT * FROM TBL_PARTY_202005;

SELECT * FROM TBL_MEMBER_202005;

select * from tbl_vote_202005;


ALTER TABLE TBL_MEMBER_202005
RENAME COLUMN P_JUMIN TO M_JUMIN;


--�ĺ���ȸ �޴�
--select d."�ĺ���ȣ",d."����",a."��Ī" as �Ҽ�����,d."�ֹι�ȣ",d."������",a."��ȭ��ȣ1"||'- '||a."��ȭ��ȣ2"||' - '||a."��ȭ��ȣ3" as ��ǥ��ȭ
--from TBL_PARTY_202005 a, TBL_MEMBER_202005 d
--where a.�����ڵ�=d.�Ҽ�����; 

select d."M_NO" AS �ĺ���ȣ,d."M_NAME" AS ����,a."P_NAME" as �Ҽ�����, 
case when substr(d.P_SCHOOL,1,1) = '1' then '����'
         when substr(d.P_SCHOOL,1,1) = '2' then '�л�'
         when substr(d.P_SCHOOL,1,1) = '3' then '����'
end as �����з�,
substr(d."M_JUMIN",1,6)||'-'||substr(d."M_JUMIN",7,14) AS �ֹι�ȣ,
d."M_CITY" AS ������,a."P_TEL1"||'- '||a."P_TEL2"||' - '||a."P_TEL3" as ��ǥ��ȭ
from TBL_PARTY_202005 a, TBL_MEMBER_202005 d
where a.P_CODE=d.P_CODE;



--����
select ����, �ֹι�ȣ as �������, �ֹι�ȣ as ����, �ֹι�ȣ as ����, �ĺ���ȣ, ��ǥ�ð�, ������Ȯ��
from tbl_vote_202005;

select ����, 19||substr(�ֹι�ȣ,1,2) ||'��'|| substr(�ֹι�ȣ,3,2)||'��'||substr(�ֹι�ȣ,3,2)||'�ϻ�' as �������
from tbl_vote_202005;

select sysdate, ����, 19||substr(�ֹι�ȣ,1,2) ||'��'|| substr(�ֹι�ȣ,3,2)||'��'||substr(�ֹι�ȣ,3,2)||'�ϻ�' as �������, 
floor(months_between(sysdate,to_date(substr(�ֹι�ȣ,1,6)))/12) as ����
from tbl_vote_202005;



--��ǥ�˼���ȸ
select V_NAME AS ����, 19||substr(V_JUMIN,1,2) ||'��'|| substr(V_JUMIN,3,2)||'��'||substr(V_JUMIN,3,2)||'�ϻ�' as �������, 
floor(months_between(sysdate,to_date(substr(V_JUMIN,1,6)))/12) as ����,
case when substr(V_JUMIN,7,1) = '1' then '��'
         when substr(V_JUMIN,7,1) = '2' then '��'
end as ����, 
M_NO AS �ĺ���ȣ, substr(V_TIME,1,2)||':'||substr(V_TIME,3,4) as ��ǥ�ð�,
case when substr(V_CONFIRM,1,1) = 'N' then '��Ȯ��'
         when substr(V_CONFIRM,1,1) = 'Y' then 'Ȯ��'
end as ������Ȯ��
from tbl_vote_202005;
-- 49��� ������ ������ �����Ҹ�

select * from tbl_vote_202005;


-- ����
select count (distinct d.�ĺ���ȣ)
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.�ĺ���ȣ=d.�ĺ���ȣ; 

select distinct d."����"
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.�ĺ���ȣ=d.�ĺ���ȣ; 


select d.����, count(d."�ĺ���ȣ") as ����ǥ�Ǽ�
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.�ĺ���ȣ=d.�ĺ���ȣ
group by d.����
order by ����ǥ�Ǽ� desc;



--�ĺ��ڵ��
select d.M_NO AS �ĺ���ȣ, d.M_NAME AS ����, count(d."M_NO") as ����ǥ�Ǽ�
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.M_NO=d.M_NO
group by d.M_NAME, d.M_NO
order by ����ǥ�Ǽ� desc;
-- ���ð� Ʋ���� ���ĺ� 4, ���ĺ� 5�� ����



--ALTER TABLE tbl_vote_202005
--RENAME COLUMN ������Ȯ�� TO V_CONFIRM;

-- Ȩ����


SELECT * FROM MEMBER_TBL_02 order by custno desc;

ALTER TABLE MEMBER_TBL_02
RENAME COLUMN �����ڵ� TO city;

INSERT INTO MEMBER_TBL_02 VALUES('100006','������','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');
INSERT INTO MEMBER_TBL_02 VALUES('100005','����ȭ','010-1111-6666','���ֵ� ���ֽ� �ܳ�����','20151225','B','60');
INSERT INTO MEMBER_TBL_02 VALUES('100004','�ֻ��','010-1111-5555','�︪�� �︪�� ����2��','20151113','A','30');
INSERT INTO MEMBER_TBL_02 VALUES('100003','�����','010-1111-4444','�︪�� �︪�� ����1��','20151001','B','30');
INSERT INTO MEMBER_TBL_02 VALUES('100002','���ູ','010-1111-3333','���� ���빮�� �ְ�2��','20151206','B','01');
INSERT INTO MEMBER_TBL_02 VALUES('100001','���ູ','010-1111-2222','���� ���빮�� �ְ�1��','20151202','A','01');

SELECT * FROM MONEY_TBL_02;

INSERT INTO MONEY_TBL_02 VALUES('100001','20160001','500','5','2500','A001','20160101');
INSERT INTO MONEY_TBL_02 VALUES('100002','20160002','1000','4','4000','A002','20160101');
INSERT INTO MONEY_TBL_02 VALUES('100003','20160003','500','3','1500','A008','20160101');
INSERT INTO MONEY_TBL_02 VALUES('100004','20160004','2000','1','2000','A004','20160102');
INSERT INTO MONEY_TBL_02 VALUES('100005','20160005','500','1','500','A001','20160103');
INSERT INTO MONEY_TBL_02 VALUES('100006','20160006','1500','2','3000','A003','20160103');
INSERT INTO MONEY_TBL_02 VALUES('100007','20160007','500','2','1000','A001','20160104');
INSERT INTO MONEY_TBL_02 VALUES('100008','20160008','300','1','300','A005','20160104');
INSERT INTO MONEY_TBL_02 VALUES('100009','20160009','600','1','600','A006','20160104');
INSERT INTO MONEY_TBL_02 VALUES('100010','20160010','3000','1','3000','A007','20160106');


--ȸ�������ȸ/����
SELECT custno as ȸ����ȣ, custname as ȸ������,
phone as ��ȭ��ȣ, address as �ּ�, 20||joindate as ��������,
case when substr(grade,1,1) = 'A' then 'VIP'
         when substr(grade,1,1) = 'B' then '�Ϲ�'
         when substr(grade,1,1) = 'C' then '����'
end as �����, 
city as ��������
FROM  MEMBER_TBL_02;


SELECT * FROM MEMBER_TBL_02;


--ȸ��������ȸ

select a.custno as ȸ����ȣ, a. custname as ȸ������,
case when substr(grade,1,1) = 'A' then 'VIP'
         when substr(grade,1,1) = 'B' then '�Ϲ�'
         when substr(grade,1,1) = 'C' then '����'
end as �����, 
d. price as ����
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
order by ���� desc;



select a.custno as ȸ����ȣ, a. custname as ȸ������,
case when substr(a.grade,1,1) = 'A' then 'VIP'
         when substr(a.grade,1,1) = 'B' then '�Ϲ�'
         when substr(a.GRADE,1,1) = 'C' then '����'
end as �����,
sum(d.price) as ����
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
group by a.custno, a. custname, d.price, a.GRADE,a.custno
order by ���� desc;



--ȸ�� ���� ��ȸ
select a.custno as ȸ����ȣ, a. custname as ȸ������,
case when substr(a.grade,1,1) = 'A' then 'VIP'
         when substr(a.grade,1,1) = 'B' then '�Ϲ�'
         when substr(a.GRADE,1,1) = 'C' then '����'
end as �����,
sum(d.price) as ����
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
group by a.custno, a.custname, a.GRADE
order by ���� desc;





-����
SELECT * FROM MEMBER_TBL_02;

SELECT * FROM MONEY_TBL_02;


INSERT INTO MEMBER_TBL_02 (custno, custname, phone, address, joindate, grade, city)
     SELECT custno + 1
          , custname
          , phone
          ,address
          ,sysdate
          ,grade
          ,city
       FROM MEMBER_TBL_02
      WHERE custno IN (60, 70, 80);
      
INSERT INTO MEMBER_TBL_02
values (custno+1, ' ', ' ', ' ', sysdate, ' ', ' ');


--ȸ����� ȭ��
INSERT INTO MEMBER_TBL_02 (custno, custname, phone, address, joindate, grade, city)
values ((SELECT MAX(custno) + 1 FROM MEMBER_TBL_02), 'ȫ�浿', '010-1111-1111', '���� ���ʱ� ���ʵ�', sysdate, 'A', '01');

rollback;

select * from MEMBER_TBL_02;

INSERT INTO MEMBER_TBL_02 VALUES('100006','������','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');



--��ǥ �̷� ���̺�

select * from tbl_vote_202005;

insert into tbl_vote_202005 
values('59010110024','������','3','1330','��2��ǥ��','Y');

rollback;