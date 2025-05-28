select * from employees;

select * from departments;

-- SELECT문 함수 문제
--<문제> 'jking'이란 이메일을 갖은 직원의 이름과 급여와 커미션을 출력하라. (INITCAP, UPPER 사용)
select first_name, salary, commission_pct from employees where upper(email) = upper('jking');
select first_name, salary, commission_pct from employees where initcap(email) = initcap('jking');
--<문제> 이름이 6글자 이상인 직원의 직원번호과 이름과 급여를 출력하라.
select employee_id, first_name, salary from employees where length(first_name) >= 6;
--<문제> 03년도에 입사한 사원 알아내기 (비교 연산자와 AND 연산자, BETWEEN AND연산자, SUBSTR함수) 
select * from employees where substr(hire_date,1,2) = '03'; 
--<문제> 이름이 k로 끝나는 직원을 검색(LIKE 연산자와 와일드 카드 (%), SUBSTR 함수)
select * from employees where first_name like '%k';
select * from employees where substr(first_name,-1,1) = 'k';
--<문제> 직원 번호가 짝수인 직원들의 직원번호와 이름과 직급을 출력하라.
select * from employees where mod(employee_id,2) = 0;
--<문제>모든 직원은 자신의 상관(MANAGER_ID)이 있다. 하지만 EMPLOYEES 테이블에 유일하게 상관이 없는 로우가 있는데 그 사원의 MANAGER_ID 칼럼 값이 NULL이다. 
-- 상관이 없는 대표이사만 출력하되 MANAGER_ID 칼럼 값 NULL 대신 CEO로 출력한다.
select employee_id, first_name, nvl(to_char(manager_id),'CEO') as manager from employees where manager_id is null;
--<문제> 부서별에 따라 급여를 인상하도록 하자. (직원번호, 직원명, 직급, 급여) 
-- 부서명이 'Marketing'인 직원은 5%, 'Purchasing'인 사원은 10%, 'Human Resources'인 사원은 15%, ' IT'인 직원은 20%인 인상한다.
-- inner join
select e.department_id, employee_id, first_name, job_id, d.department_name ,e.salary,
    case    when d.department_name = 'Marketing' then e.salary * 1.05
            when d.department_name = 'Purchasing' then e.salary * 1.1
            when d.department_name = 'Human Resources' then e.salary * 1.15
            when d.department_name = 'IT' then salary * 1.2
    else salary
    end "인상후 salary"
from employees e
join departments d on d.department_id = e.department_id;


-- 그룹함수
-- <문제> JOB의 종류가 몇 개인지 즉, 중복되지 않은 직업의 개수를 구해보자.
select count(DISTINCT job_id) from employees;
select job_id from employees group by job_id;
select count(*) as "직업의 개수" from (select job_id from employees group by job_id);
-- <문제> 부서별로 직원의 수와 커미션을 받는 직원의 수를 카운트해 보자.
select department_id, count(*) from employees group by department_id;
select department_id, count(*), count(commission_pct) from employees group by department_id ;

-- 입력,수정,삭제
-- 1
create table EMP01(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    mgr number(4),
    hiredate date not null,
    sal number(7,2) not null,
    somm number(7,2),
    deptno number(2) not null
);

insert into EMP01 values (7369,'SMITH','CLEAK',7836,'80/12/17',800,NULL,20);

-- 2
 create table members(
    id varchar2(20) primary key,
    name varchar2(20) not null,
    regno varchar2(13) not null,
    hp varchar(13) not null,
    address varchar(100) not null
 );
 
 --3
 create table books (
    code number(4) primary key,
    title varchar2(50) not null,
    count number(6) not null,
    price number(10) not null,
    publish varchar2(50) not null
 );


SELECT * FROM EMP01;
select * from members;
desc members;

select * from books;
desc books;


insert into members values ('chowoojin','조우진','9801011234567','010-3333-4444','서울시 동대문구 답십리');
insert into members values ('gihuni','차기훈','9701011234567','010-5555-6666','부산시 수영구 광안동');

insert into books values (1,'리액트로 웹앱만들기',100,30000,'이지스퍼블리싱');
insert into books values (2,'html+css+자바스크립트 웹표준의 정석',200,28000,'이지스퍼블리싱');

