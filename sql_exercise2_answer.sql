/**
50번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라
**/
SELECT avg(salary) 평균, max(salary) 최고, min(salary) 최저, count(*) 인원수 FROM EMPLOYEES e WHERE department_id = 50;




/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
**/
SELECT round(avg(salary),0)평균, max(salary) 최고, min(salary) 최저, count(*) 인원수 FROM EMPLOYEES e2 GROUP BY DEPARTMENT_ID;





/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/
SELECT department_id 부서번호,  job_id 업무명, count(*) 인원수  FROM EMPLOYEES e GROUP BY department_id,JOB_ID ;



/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/
SELECT job_id 업무, count(*) 인원수 FROM EMPLOYEES e2 GROUP BY JOB_ID HAVING count(*) >=4;




/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/
SELECT round(avg(salary),0) 평균월급, sum(SALARY) 전체월급, max(salary) 최고월급 , min(salary) 최저월급 FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ORDER BY avg(salary) DESC;

/**
 부서번호, 부서명, 이름, 급여를 출력하라.
**/
SELECT e.department_id 부서번호, d.department_name 부서명, e.first_name 이름, e.salary 급여 FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.department_id = d.department_id;

/**
이름이 adam인 사원의 부서명을 출력하라.
**/
SELECT d.department_name FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.department_id = d.department_id WHERE e.first_name ='adam';


/**
employees테이블에 있는 employee_id와 manager_id를 이용하여 서로의 관계를 다음과 같이 출력하라
'smith'의 매니저는 'ford'이다.
**/
SELECT e.employee_id 사원, edv2.employee_id 매니저 FROM EMPLOYEES e JOIN EMP_DETAILS_VIEW edv2 ON e.MANAGER_ID = edv2.MANAGER_ID;


/**
adam의 직무와 같은 직무를 갖는 사람의 이름, 부서명, 급여, 직무를 출력하라.
**/
SELECT e.first_name 이름, d2.department_name 부서명, e.salary 급여, e.job_id 직무 FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE job_id IN (SELECT job_id FROM EMPLOYEES e WHERE FIRST_NAME = 'adam');

/**
전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
**/
SELECT e.EMPLOYEE_ID 사원번호, e.first_name 이름, d2. department_name 부서명, e.hire_date 입사일, d2.location_id 지역, e.salary 급여 FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE salary > any(SELECT avg(SALARY) FROM EMPLOYEES e) ORDER BY SALARY ;

/**
50번 부서사람들 중에서 30번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일을 출력하라.
**/
SELECT e.employee_id 사원번호, e.job_id 이름, d2.department_name 부서명, e.hire_date 입사일, d2.location_id 지역, e.salary 급여 FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE job_id IN (SELECT job_id FROM EMPLOYEES WHERE DEPARTMENT_ID = 30 AND e.DEPARTMENT_ID =50); 


/**
급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
**/
SELECT department_id 사원번호, first_name 이름, salary 급여 FROM EMPLOYEES WHERE SALARY > all(SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = 30);