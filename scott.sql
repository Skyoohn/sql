SELECT * FROM EMP;
SELECT * FROM emp WHERE SAL = 5000;
select * from emp where deptno = 20;

select * from emp where sal != 3000; --개발자가 가장 많이 쓰는 표현
select * from emp where sal <> 3000; --DBA가 가장 많이 쓰는 표현
select * from emp where sal ^= 3000;

select * from emp where ename = 'SMITH'; -- 컬럼명은 대소문자 안가리고 데이터는 가림
select * from emp where job = 'PRESIDENT';
select * from emp where hiredate >= '82/01/01';
select * from emp where deptno = 10 and JOB = 'MANAGER'; --조건 2개
select * from emp where DEPTNO = 10 or job = 'MANAGER';
select * from emp where not deptno = 10; --10이 아닌


select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000; -- 많이 쓰는 스타일

select * from emp where sal < 2000 or sal > 3000; 
select * from emp where sal not between 2000 and 3000; 

select * from emp where hiredate >= '82/01/01';
select * from emp where hiredate between '82/01/01' and '82/12/31';

select * from emp where comm = 300 or comm = 500 or comm = 1400;
select * from emp where comm in (300,500,1400); -- in이 or, 갯수 상관x

select * from emp where comm not in (300,500,1400);



-- 7/10


select * from emp where ename like 'F%'; --F로 시작하는 사람 찾기

select * from emp where ename like '%A%'; --앞뒤 상관없이 A가 들어간 사람

select * from emp where ename like '%N'; --이름이 N으로 끝나는 사람

select * from emp where ename like '_A%'; -- 이름의 두번째 글자가 A인 사람

select * from emp where ename like '__A%'; -- 이름의 세번째 글자가 A인 사람

select * from emp where ename not like '%A%'; --이름에 A가 안들어간 사람

select * from emp where comm is null; -- comm이 null 인 사람

select * from emp where comm is not null;

select * from emp  order by  sal asc; -- 오름차순

select * from emp  order by  sal desc; --내림차순

select * from emp  order by  hiredate desc; --가장 최근 입사 사원

select * from emp  order by ename asc; -- 이름 사전순

select * from emp where sal >= 3000 order by ename asc; -- 월급 3000 이상 이름 사전순

select DISTINCT deptno from emp; -- 중복 제거해서 부서번호 출력

select  sal * 12 as 샐러리 from emp; -- 컬럼에 연산 가능, as 로 별칭(앨리어스) 주기 가능

select ename || ' is a ' || job "연결정의 예" from emp; -- ||로 문자열을 추가 연결시킴 별칭은 " "로, as 생략 가능 

desc dept;   -- 컬럼의 유형 확인

select 24 * 26 from dual;

select sysdate from dual;    -- 현재 날짜

select abs(-10) from dual; -- abs가 절대값 구하는 용어

-- 소수점 아래를 버리는 함수
SELECT 34.5432, FLOOR(34.5432) FROM DUAL;

select 34.5678, round(34.5678,2) from dual;    -- 소수점 2 자리부터 반올림, 안쓰면 0과 같음

select mod(27, 2), mod(27, 5), mod(27, 7) from dual;  -- 나누고 난 후의 나머지 (자바의 %)

select 'oracle', upper('oracle') from dual; -- upper 대문자

select lower ('ORACLE') from dual;

select lower(ename) from emp; -- ename 만 소문자로 출력

select initcap('oracle') from dual; -- 첫글자만 대문자

select initcap(ename) from emp; -- ename 안에서 첫글자만 대문자

select length(ename), ename from emp;   -- 문자 길이 뽑기

select SUBSTR('oracle',0,1) from dual;    

select SUBSTR(ename,0,1) from emp;    -- 맨 앞글자

select SUBSTR('Smith',2,2) from dual; -- 2,3번째 글자

select substr(ename,2,2) from emp; -- 2,3번째 글자

select * from emp;

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 FROM EMP; 

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 
FROM EMP
where substr(hiredate,4,2) = '09';   -- 9월 입사자 꺼내기   (달 = 09 가 안되는 이유는 where가 먼저 실행되기 때문)

select ltrim('          oracle') from dual;   -- 공백 제거 (왼쪽)

select trim('          oracle                       ') from dual;

select sysdate -1 from dual;  -- 어제 날짜

select SYSDATE +1 from dual; -- 내일

select ename, sysdate, hiredate, floor(months_between(sysdate,hiredate)) 근무개월수 from emp;  --소수점 제거

select ename, hiredate, add_months(hiredate, 4) from emp;  -- 입사 날짜에서 4개월 추가

select sysdate, next_day(sysdate,'금요일') from dual;    -- 오늘 기준 가장 가까운 다음 수요일 (OS 언어 기준으로 문자 인식)

select hiredate, last_day(hiredate) from emp;    -- 입사한 달의 마지막날


select sysdate, to_char (sysdate, 'yyyy-mm-dd') from dual;  -- 현재 날짜를 문자형으로 변환하여 출력

select hiredate, to_char(hiredate,'yyyy/mm/dd day') as 입사일 from emp;   -- 입사일 출력, 요일과 함께 (day는 요일)

select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;


desc emp; 

select ename, sal, to_char(sal, 'l99,999') from emp; -- 각 지역별 통화기호를 앞에 붙이고 천단위마다 콤마를 붙여서 출력

select ename, hiredate from emp where hiredate = '1981-02-20';      -- 날짜형은 ' ' 로 변환      to_char('1981/02/20') 도 가능 (숫자형을 다이렉트로 집어넣으면 안된다는게 중요)
select ename, hiredate from emp where hiredate = to_date(19810220,'yyyymmdd');    -- 위와 동일한

select sysdate - to_date ('2016/01/01','yyyy/mm/dd') from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;   -- 문자를 숫자로 바꿈

select ename, sal, sal * 12 + nvl(comm,0) comm from emp;    -- null을 0으로 바꿔라(null value) 연봉계산할때

select ename, sal, sal * 12 + nvl(comm,0) 연봉, nvl(comm,0) from emp; 

select deptno from emp order by deptno;

select deptno, decode(deptno,10,'a',20,'b',30,'c') from emp order by deptno;    -- decode 함수 (정수, string만 가능)
select ename, deptno, decode (deptno,10,'accounting',20,'research',30,'sales') as dname from emp order by deptno;   -- 응용

select ename, deptno,    -- if문과 유사
       case when deptno = 10 then 'accounting'
                when deptno = 20 then 'research'
                when deptno = 30 then 'sales'
                when deptno = 40 then 'operations'
      end as ENAMEs
from emp;

select ename, sal,
    case when sal > 2500 then '수'
              when sal < 2500 then '가'
    end as 등급
    from emp;
    
select deptno, sal, round(sal, -3) from emp;     -- -3이면 0에서 +3자리 반올림, 단일행 함수 (각각의 행마다 적용)

select  sum(sal) from emp;   -- 그룹함수로 사원의 총 급여 확인 select * , 이 안되는 이유는 12개 전체를 다 뿌려야 하기 때문 (그룹함수는 1개만 뿌림, 산출되는 로우수가 다르다)

select avg (sal) from emp;  -- 평균

select max(sal) from emp;  -- 최대값
select min(sal) from emp;  -- 최소값

select count (*) from emp;  -- 총 사원수

select * from emp;

select count(DISTINCT  job) from emp;     -- DISTINCT 중복제거로 job 갯수 계산 (로우 갯수 계산)

select deptno from emp group by deptno;   -- 특정 컬럼 기준으로 그룹화 (중복 제거)

--select ename from emp group by deptno; -- 그룹으로 묶었는데 이름을 뿌릴수 없기 때문에 실행안됨

select deptno, avg(sal) from emp group by deptno;   -- 1. 컬럼은 group by 한 컬럼 명이 올 수 있다. 2. 집합 함수가 올 수 있다.(단일함수 X) (그룹 10,20,30 만들고 sal 넣는것)

select deptno, sum(sal) from emp group by deptno;

select deptno, max(sal), min(sal) from emp group by deptno;  -- 최대와 최소

select deptno, count(*)  from emp group by deptno;  --부서별 사원수

select count (job) from emp group by job;  --직함별 사원수

select * from emp;

select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;    -- 그룹별 평균봉급

select deptno, max(sal), min(sal) from emp group by deptno having max(sal) >= 2900;    -- 부서의 최대값과 최소값을 구하되, 최대 급여가 2900 이상인 부서만 출력


-- 7/11


 select * from emp, dept;    -- join은 기본적으로 카테이션 곱  (emp 기준: 4개로 모든 요소를 곱함)
 
 select * from emp, dept where emp.deptno = dept.deptno;    -- 사원의 정보 출력시, 각 사원이 소속된 부서의 상세정보를 출력하기 위해 두개의 테이블을 조인 (dept정보로 emp와 dept가 같은것만 표시)
 
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';     -- smith인 사람의 부서명 출력

select ename, dname from emp e, dept d where e.deptno = d.deptno and e.ename = 'SMITH';    -- 별칭 주기 가능


select * from salgrade;   -- 급여 등급

select * from emp, salgrade where sal between losal and hisal order by ename;   -- 각 사원의 급여가 몇등급인지 살펴보는 쿼리문

select * from emp, salgrade,dept                -- + 사원의 부서명
where dept.deptno = emp.deptno and sal between losal and hisal 
order by ename;

SELECT E.ENAME||'의 매니저는 '|| M.ENAME||'입니다.' FROM EMP E, EMP M WHERE E.MGR = M.EMPNO;   -- 매니저 구하기


-- anci 조인 (등가조인)

select * from emp, dept where emp.deptno = dept.deptno;
-- = 위 아래 동일
select * from emp inner join dept on emp.deptno = dept.deptno;


-- (outer join)

select * from dept left outer join emp on emp. deptno = dept.deptno;   -- 교집합에다 dept (left)에 들어있는게 포함되어있다
select * from emp left outer join dept on emp. deptno = dept.deptno;   --

select * from dept, emp where emp.deptno(+) = dept.deptno;  --  (+)는 emp에 dept에 있는것 하나 더 추가


-- 유니온

--select a.job, b.deptno
--from (select job, deptno from emp where sal >= 3000)  a, (select job, deptno from emp where deptno = 10) b;   -- 안해도됨

select job, deptno from emp where sal >= 3000
union all
select job, deptno from emp where deptno = 10;    -- 합집합 (union은 중복불가) (union all은 중복 허용)


-- 서브쿼리

select deptno from emp where ename = 'SMITH';
select dname from dept where deptno = 20;

--join 사용
select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

-- 서브쿼리
select dname from dept           -- 하나의 select 문장 내에 포함된 또 하나의 select 문장이 있는 쿼리문
where deptno = (select deptno from emp where ename = 'SMITH');           -- 비교 연산자의 오른쪽에 기술, 반드시 괄호 안에 넣어야 한다.

select * from emp;

select * from emp
where sal > (select avg (sal) from emp);  -- 평균 급여보다 많이 받는 사원

select * from emp
where sal > (select sal from emp where ename = 'SMITH');    -- 스미스보다 많이 받는 사원 목록


---

desc emp;