/**
50�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�
**/
SELECT avg(salary) ���, max(salary) �ְ�, min(salary) ����, count(*) �ο��� FROM EMPLOYEES e WHERE department_id = 50;




/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
**/
SELECT round(avg(salary),0)���, max(salary) �ְ�, min(salary) ����, count(*) �ο��� FROM EMPLOYEES e2 GROUP BY DEPARTMENT_ID;





/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/
SELECT department_id �μ���ȣ,  job_id ������, count(*) �ο���  FROM EMPLOYEES e GROUP BY department_id,JOB_ID ;



/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/
SELECT job_id ����, count(*) �ο��� FROM EMPLOYEES e2 GROUP BY JOB_ID HAVING count(*) >=4;




/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/
SELECT round(avg(salary),0) ��տ���, sum(SALARY) ��ü����, max(salary) �ְ���� , min(salary) �������� FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ORDER BY avg(salary) DESC;

/**
 �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
**/
SELECT e.department_id �μ���ȣ, d.department_name �μ���, e.first_name �̸�, e.salary �޿� FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.department_id = d.department_id;

/**
�̸��� adam�� ����� �μ����� ����϶�.
**/
SELECT d.department_name FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.department_id = d.department_id WHERE e.first_name ='adam';


/**
employees���̺� �ִ� employee_id�� manager_id�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�
'smith'�� �Ŵ����� 'ford'�̴�.
**/
SELECT e.employee_id ���, edv2.employee_id �Ŵ��� FROM EMPLOYEES e JOIN EMP_DETAILS_VIEW edv2 ON e.MANAGER_ID = edv2.MANAGER_ID;


/**
adam�� ������ ���� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.
**/
SELECT e.first_name �̸�, d2.department_name �μ���, e.salary �޿�, e.job_id ���� FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE job_id IN (SELECT job_id FROM EMPLOYEES e WHERE FIRST_NAME = 'adam');

/**
��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.
**/
SELECT e.EMPLOYEE_ID �����ȣ, e.first_name �̸�, d2. department_name �μ���, e.hire_date �Ի���, d2.location_id ����, e.salary �޿� FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE salary > any(SELECT avg(SALARY) FROM EMPLOYEES e) ORDER BY SALARY ;

/**
50�� �μ������ �߿��� 30�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի����� ����϶�.
**/
SELECT e.employee_id �����ȣ, e.job_id �̸�, d2.department_name �μ���, e.hire_date �Ի���, d2.location_id ����, e.salary �޿� FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE job_id IN (SELECT job_id FROM EMPLOYEES WHERE DEPARTMENT_ID = 30 AND e.DEPARTMENT_ID =50); 


/**
�޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
**/
SELECT department_id �����ȣ, first_name �̸�, salary �޿� FROM EMPLOYEES WHERE SALARY > all(SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = 30);