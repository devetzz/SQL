-- SELECT 문 예제
-- <문제> EMPLOYEES 테이블의 모든 내용 출력
select * from employees;
-- <문제> 사원의 이름과 급여와 입사일자 만을 출력하는 SQL 문을 작성해보자.
select first_name, last_name, salary, hire_date from employees;
-- <문제> 직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고 한번씩 출력하는 쿼리문을 작성하자.
select department_id from employees group by department_id;
select distinct department_id from employees;
-- <문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
select * from employees where department_id = 110;
-- <문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력 하라.
select employee_id, first_name, last_name, salary from employees where salary < 5000;
-- <문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라.
select employee_id, first_name, last_name, job_id from employees where first_name = 'John';
-- <문제> 급여가 5000에서 10000이하 직원 정보 출력
select * from employees where salary between 5000 and 10000;
-- <문제> 직원번호가 134이거나 201이거나 107인 직원 정보 출력
select * from employees where employee_id in (134,201,107);
-- <문제> 직급이 FI_MGR가 아닌 직원
select * from employees where job_id != 'FI_MGR';
-- <문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라. (AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것)
select employee_id, first_name, last_name, salary from employees where salary BETWEEN 2500 and 4000;
select employee_id, first_name, last_name, salary from employees where salary >= 2500 and salary <= 4000;
-- <문제> 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 직원번호, 이름, 급여, 커미션 비율을 출력하라. (OR 연산자와 IN 연산자 사용 모두 사용해볼것)
select employee_id, first_name, last_name, salary, commission_pct from employees where commission_pct in (0.3, 0.05, 0.1);
select employee_id, first_name, last_name, salary, commission_pct from employees where commission_pct = 0.3 or commission_pct = 0.05 or commission_pct = 0.1;
-- <문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라.
select employee_id, first_name, last_name from employees where first_name not like '%a%';
-- <문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라
select first_name, last_name, job_id, employee_id from employees where manager_id is null;
-- <문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라.
select employee_id, first_name, last_name, salary from employees order by salary desc;
-- <문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
select employee_id, first_name, last_name, hire_date from employees order by hire_date desc;