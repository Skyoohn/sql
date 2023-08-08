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

--안됨
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

INSERT INTO TBL_TEACHER_202201 VALUES('100','이초급','초급반',100000,'20220101');
INSERT INTO TBL_TEACHER_202201 VALUES('200','김중급','중급반',200000,'20220102');
INSERT INTO TBL_TEACHER_202201 VALUES('300','박고급','고급반',300000,'20220103');
INSERT INTO TBL_TEACHER_202201 VALUES('400','정심화','심화반',400000,'20220104');

INSERT INTO TBL_MEMBER_202201 VALUES('10001','홍길동','01011112222','서울시 강남구','일반');
INSERT INTO TBL_MEMBER_202201 VALUES('10002','장발장','01022223333','성남시 분당구','일반');
INSERT INTO TBL_MEMBER_202201 VALUES('10003','임꺽정','01033334444','대전시 유성구','일반');
INSERT INTO TBL_MEMBER_202201 VALUES('20001','성춘향','01044445555','부산시 서구','VIP');
INSERT INTO TBL_MEMBER_202201 VALUES('20002','이몽룡','01055556666','대구시 북구','VIP');

INSERT INTO TBL_CLASS_202201 VALUES('202203','10001','서울본원',100000,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203','10002','성남분원',100000,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203','10003','대전분원',200000,'200');
INSERT INTO TBL_CLASS_202201 VALUES('202203','20001','부산분원',150000,'300');
INSERT INTO TBL_CLASS_202201 VALUES('202203','20002','대구분원',200000,'400');


SELECT * FROM TBL_CLASS_202201;

SELECT * FROM TBL_TEACHER_202201;

SELECT * FROM TBL_MEMBER_202201;


SELECT TEACHER_CODE AS 강사코드,CLASS_NAME AS 강의명,TEACHER_NAME AS 강사명,CLASS_PRICE AS 총매출
FROM TBL_TEACHER_202201;


SELECT * FROM TBL_TEACHER_202201,TBL_CLASS_202201
WHERE TBL_TEACHER_202201.TEACHER_CODE = TBL_CLASS_202201.TEACHER_CODE;


select distinct a.TEACHER_CODE, a.TEACHER_NAME, a.TEACHER_NAME, d.TUITION
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE; 

SELECT *
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE; 




select a.TEACHER_CODE AS 강사코드, a.CLASS_NAME AS 강의명, a.TEACHER_NAME AS 강사명, '\'||SUM(d.TUITION) AS 총매출
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE
group by a.TEACHER_CODE, a.CLASS_NAME, a.TEACHER_NAME, d.TUITION
order by a.TEACHER_CODE;



--매출
select a.TEACHER_CODE AS 강사코드, a.CLASS_NAME AS 강의명, a.TEACHER_NAME AS 강사명, to_char((SUM(d.TUITION)),'l999,999') AS 총매출
from TBL_TEACHER_202201 a,TBL_CLASS_202201 d
where a.TEACHER_CODE=d.TEACHER_CODE
group by a.TEACHER_CODE, a.CLASS_NAME, a.TEACHER_NAME, d.TUITION
order by a.TEACHER_CODE;


-- 투표


select * from tbl_vote_202005;

insert into tbl_vote_202005 values('99010110001','김유권','1','0930','제1투표장','N');

insert into tbl_vote_202005 values('89010120002','이유권','2','0930','제1투표장','N');


insert into tbl_vote_202005 values('69010110003','박유권','3','0930','제1투표장','Y');



insert into tbl_vote_202005 values('59010120004','홍유권','4','0930','제1투표장','Y');


insert into tbl_vote_202005 values('79010110005','조유권','5','0930','제1투표장','Y');

insert into tbl_vote_202005 values('89010120006','최유권','1','0930','제1투표장','Y');

insert into tbl_vote_202005 values('59010110007','지유권','1','0930','제1투표장','Y');

insert into tbl_vote_202005 values('49010120008','장유권','3','0930','제1투표장','Y');

insert into tbl_vote_202005 values('79010110009','정유권','3','0930','제1투표장','Y');

insert into tbl_vote_202005 values('89010120010','강유권','4','0930','제1투표장','Y');

insert into tbl_vote_202005 values('99010110011','신유권','5','0930','제1투표장','Y');

insert into tbl_vote_202005 values('79010120012','오유권','1','1330','제1투표장','Y');

insert into tbl_vote_202005 values('69010110013','현유권','4','1330','제2투표장','Y');

insert into tbl_vote_202005 values('89010110014','왕유권','2','1330','제2투표장','Y');

insert into tbl_vote_202005 values('99010110015','유유권','3','1330','제2투표장','Y');

insert into tbl_vote_202005 values('79010110016','한유권','2','1330','제2투표장','Y');

insert into tbl_vote_202005 values('89010110017','문유권','4','1330','제2투표장','Y');

insert into tbl_vote_202005 values('99010110018','양유권','2','1330','제2투표장','Y');

insert into tbl_vote_202005 values('99010110019','구유권','4','1330','제2투표장','Y');

insert into tbl_vote_202005 values('79010110020','황유권','5','1330','제2투표장','Y');

insert into tbl_vote_202005 values('69010110021','배유권','3','1330','제2투표장','Y');

insert into tbl_vote_202005 values('79010110022','전유권','3','1330','제2투표장','Y');

insert into tbl_vote_202005 values('99010110023','고유권','1','1330','제2투표장','Y');

insert into tbl_vote_202005 values('59010110024','권유권','3','1330','제2투표장','Y');


SELECT * FROM TBL_MEMBER_202005;


INSERT INTO TBL_MEMBER_202005 VALUES('1','김후보','P1','1','6603011999991','수선화동');
INSERT INTO TBL_MEMBER_202005 VALUES('2','이후보','P2','3','5503011999992','민들래동');
INSERT INTO TBL_MEMBER_202005 VALUES('3','박후보','P3','2','7703011999993','나팔꽃동');
INSERT INTO TBL_MEMBER_202005 VALUES('4','조후보','P4','2','8803011999994','진달래동');
INSERT INTO TBL_MEMBER_202005 VALUES('5','최후보','P5','3','9903011999995','개나리동');



INSERT INTO TBL_PARTY_202005 VALUES('P1','A정당','2010-01-01','위대표','02','1111','0001');
INSERT INTO TBL_PARTY_202005 VALUES('P5','E정당','2010-05-01','임대표','02','1111','0005');


SELECT * FROM TBL_PARTY_202005;

SELECT * FROM TBL_MEMBER_202005;

select * from tbl_vote_202005;


ALTER TABLE TBL_MEMBER_202005
RENAME COLUMN P_JUMIN TO M_JUMIN;


--후보조회 메뉴
--select d."후보번호",d."성명",a."명칭" as 소속정당,d."주민번호",d."지역구",a."전화번호1"||'- '||a."전화번호2"||' - '||a."전화번호3" as 대표전화
--from TBL_PARTY_202005 a, TBL_MEMBER_202005 d
--where a.정당코드=d.소속정당; 

select d."M_NO" AS 후보번호,d."M_NAME" AS 성명,a."P_NAME" as 소속정당, 
case when substr(d.P_SCHOOL,1,1) = '1' then '고졸'
         when substr(d.P_SCHOOL,1,1) = '2' then '학사'
         when substr(d.P_SCHOOL,1,1) = '3' then '석사'
end as 최종학력,
substr(d."M_JUMIN",1,6)||'-'||substr(d."M_JUMIN",7,14) AS 주민번호,
d."M_CITY" AS 지역구,a."P_TEL1"||'- '||a."P_TEL2"||' - '||a."P_TEL3" as 대표전화
from TBL_PARTY_202005 a, TBL_MEMBER_202005 d
where a.P_CODE=d.P_CODE;



--과정
select 성명, 주민번호 as 생년월일, 주민번호 as 나이, 주민번호 as 성별, 후보번호, 투표시간, 유권자확인
from tbl_vote_202005;

select 성명, 19||substr(주민번호,1,2) ||'년'|| substr(주민번호,3,2)||'월'||substr(주민번호,3,2)||'일생' as 생년월일
from tbl_vote_202005;

select sysdate, 성명, 19||substr(주민번호,1,2) ||'년'|| substr(주민번호,3,2)||'월'||substr(주민번호,3,2)||'일생' as 생년월일, 
floor(months_between(sysdate,to_date(substr(주민번호,1,6)))/12) as 나이
from tbl_vote_202005;



--투표검수조회
select V_NAME AS 성명, 19||substr(V_JUMIN,1,2) ||'년'|| substr(V_JUMIN,3,2)||'월'||substr(V_JUMIN,3,2)||'일생' as 생년월일, 
floor(months_between(sysdate,to_date(substr(V_JUMIN,1,6)))/12) as 나이,
case when substr(V_JUMIN,7,1) = '1' then '남'
         when substr(V_JUMIN,7,1) = '2' then '여'
end as 성별, 
M_NO AS 후보번호, substr(V_TIME,1,2)||':'||substr(V_TIME,3,4) as 투표시간,
case when substr(V_CONFIRM,1,1) = 'N' then '미확인'
         when substr(V_CONFIRM,1,1) = 'Y' then '확인'
end as 유권자확인
from tbl_vote_202005;
-- 49년생 장유권 에러남 이유불명

select * from tbl_vote_202005;


-- 과정
select count (distinct d.후보번호)
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.후보번호=d.후보번호; 

select distinct d."성명"
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.후보번호=d.후보번호; 


select d.성명, count(d."후보번호") as 총투표건수
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.후보번호=d.후보번호
group by d.성명
order by 총투표건수 desc;



--후보자등수
select d.M_NO AS 후보번호, d.M_NAME AS 성명, count(d."M_NO") as 총투표건수
from tbl_vote_202005 a, TBL_MEMBER_202005 d
where a.M_NO=d.M_NO
group by d.M_NAME, d.M_NO
order by 총투표건수 desc;
-- 예시가 틀렸음 이후보 4, 김후보 5가 맞음



--ALTER TABLE tbl_vote_202005
--RENAME COLUMN 유권자확인 TO V_CONFIRM;

-- 홈쇼핑


SELECT * FROM MEMBER_TBL_02 order by custno desc;

ALTER TABLE MEMBER_TBL_02
RENAME COLUMN 도시코드 TO city;

INSERT INTO MEMBER_TBL_02 VALUES('100006','차공단','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');
INSERT INTO MEMBER_TBL_02 VALUES('100005','진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');
INSERT INTO MEMBER_TBL_02 VALUES('100004','최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');
INSERT INTO MEMBER_TBL_02 VALUES('100003','장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');
INSERT INTO MEMBER_TBL_02 VALUES('100002','이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');
INSERT INTO MEMBER_TBL_02 VALUES('100001','김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');

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


--회원목록조회/수정
SELECT custno as 회원번호, custname as 회원성명,
phone as 전화번호, address as 주소, 20||joindate as 가입일자,
case when substr(grade,1,1) = 'A' then 'VIP'
         when substr(grade,1,1) = 'B' then '일반'
         when substr(grade,1,1) = 'C' then '직원'
end as 고객등급, 
city as 거주지역
FROM  MEMBER_TBL_02;


SELECT * FROM MEMBER_TBL_02;


--회원매출조회

select a.custno as 회원번호, a. custname as 회원성명,
case when substr(grade,1,1) = 'A' then 'VIP'
         when substr(grade,1,1) = 'B' then '일반'
         when substr(grade,1,1) = 'C' then '직원'
end as 고객등급, 
d. price as 매출
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
order by 매출 desc;



select a.custno as 회원번호, a. custname as 회원성명,
case when substr(a.grade,1,1) = 'A' then 'VIP'
         when substr(a.grade,1,1) = 'B' then '일반'
         when substr(a.GRADE,1,1) = 'C' then '직원'
end as 고객등급,
sum(d.price) as 매출
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
group by a.custno, a. custname, d.price, a.GRADE,a.custno
order by 매출 desc;



--회원 매출 조회
select a.custno as 회원번호, a. custname as 회원성명,
case when substr(a.grade,1,1) = 'A' then 'VIP'
         when substr(a.grade,1,1) = 'B' then '일반'
         when substr(a.GRADE,1,1) = 'C' then '직원'
end as 고객등급,
sum(d.price) as 매출
from MEMBER_TBL_02 a, MONEY_TBL_02 d
where a.custno = d. custno
group by a.custno, a.custname, a.GRADE
order by 매출 desc;





-과정
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


--회원등록 화면
INSERT INTO MEMBER_TBL_02 (custno, custname, phone, address, joindate, grade, city)
values ((SELECT MAX(custno) + 1 FROM MEMBER_TBL_02), '홍길동', '010-1111-1111', '서울 서초구 서초동', sysdate, 'A', '01');

rollback;

select * from MEMBER_TBL_02;

INSERT INTO MEMBER_TBL_02 VALUES('100006','차공단','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');



--투표 이력 테이블

select * from tbl_vote_202005;

insert into tbl_vote_202005 
values('59010110024','권유권','3','1330','제2투표장','Y');

rollback;