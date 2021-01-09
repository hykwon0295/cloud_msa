--�μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT job_id �����ȣ, first_name �̸�, salary ���� FROM EMPLOYEES e WHERE DEPARTMENT_ID = 10;

--�����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ� ��ȣ�� ����϶�.
SELECT first_name �̸�, hire_date �Ի���, department_id �μ���ȣ FROM EMPLOYEES e WHERE EMPLOYEE_ID = 7369;

--�̸��� Ellen�� ����� ��� ������ ����϶�.
SELECT * FROM EMPLOYEES e WHERE  FIRST_NAME = 'Ellen';

--�Ի����� 08/04/21�� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT first_name �̸�, department_id �μ���ȣ, salary ���� FROM EMPLOYEES e WHERE hire_date = '08/04/21' ;

--������ SA_MAN �ƴ� ����� ��� ������ ����϶�.
SELECT * FROM jobs WHERE not JOB_ID = 'sa_man'; 

--�Ի����� 08/04/21 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT * FROM EMPLOYEES e WHERE hire_date > '08/04/21';

--�μ���ȣ�� 20,30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT first_name �̸�, employee_id �����ȣ, department_id �μ���ȣ FROM EMPLOYEES e WHERE NOT DEPARTMENT_ID = 20 AND NOT DEPARTMENT_ID = 30;

--�̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT employee_id �����ȣ, first_name �̸�,  department_id �μ���ȣ FROM EMP_DETAILS_VIEW edv WHERE LAST_NAME = 's%'

--�̸��� s�� �����ϰ� ������ ���ڰ� t�� ����� ������ ����϶�.
SELECT * FROM EMP_DETAILS_VIEW edv WHERE LAST_NAME = 's%' AND FIRST_NAME = '%t'


/**
employees ���̺��� �̸�, �޿�, ��, �Ѿ��� ���Ͽ� �Ѿ� ���� ������ ����϶� �� �󿩱��� NULL�� ����� ����

*/
SELECT first_name �̸�, salary �޿� ,  COMMISSION_PCT ��, (salary + COMMISSION_PCT) �Ѿ� FROM EMPLOYEES e WHERE  COMMISSION_PCT IS NOT NULL ORDER BY (salary + COMMISSION_PCT) desc;


/**
10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�.
**/
SELECT first_name �̸�, salary �޿�, (salary * 0.13)���ʽ��ݾ�, department_id �μ���ȣ FROM EMPLOYEES e WHERE DEPARTMENT_ID = 10;

/**
30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�. �� ������ �޿��� 150%�� ���ʽ��� �����Ѵ�.
   -- ���� = sal*12+(sal*1.5)
**/
SELECT first_name �̸�, department_id �μ���ȣ, salary �޿�, salary*12+(salary*1.5) ���� FROM EMPLOYEES e WHERE DEPARTMENT_ID = 30;

/**
�μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�. �� 1���� �ٹ��ϼ��� 12���̰� 1�� �ٹ��ð��� 5�ð��̴�.
��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)�� ����϶�.
   -- �ñ� = sal/�ϼ�/�ð�  -> sal/ 12/5 
   -- round(m, n) m�� �Ҽ��� n�ڸ����� �ݿø� 
**/
SELECT first_name �̸�, salary �޿�, ROUND(((salary/12)/5), 1) �ӱ� FROM EMPLOYEES e WHERE DEPARTMENT_ID = 20;


/**
�Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�. �μ���ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ�����������), �ٹ����,
 �ٹ�����(30�� ����)�� ����϶�.
	-- ���� ��¥ : sysdate 
	-- �ٹ� �ϼ� : ���糯¥ - �Ի��� = sysdate - hire_date  -> ��¥ - ��¥ : �ϼ� ����
	-- �ٹ� ��� : round(sysdate-hiredate,0)
	-- �ٹ� ���� : �ٹ��ϼ� / 1��(30��)
**/
SELECT department_id �μ���ȣ, first_name �̸�, hire_date �Ի���, SYSDATE ������, floor(sysdate - hire_date) �ٹ��ϼ�,
floor(MONTHS_BETWEEN(sysdate, hire_date)/12) �ٹ����, floor(MONTHS_BETWEEN(SYSDATE, hire_date)) �ٹ����� FROM EMPLOYEES e 


/**
�Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ��� ����϶�.
--round(sysdate-hiredate,0) �ٹ��ϼ�
**/
SELECT first_name �̸�, hire_date �Ի���, round(sysdate-hire_date,0) �ٹ��ϼ� FROM EMPLOYEES e ;


/**
�Ի����� 2012�� 7�� 5���� ���·� �̸�, �Ի����� ����϶�.
	-- ��¥ ���� �տ� fm �� ���� '0'�� ǥ������ �ʴ´ٴ� ��.. 
	-- 'fmYYYY"��" MM"��" DD"��' 
**/

SELECT first_name �̸�, TO_CHAR(hire_date, 'fmYYYY"��" MM"��" DD"��' ) �Ի��� FROM EMPLOYEES e ;


/**
�̸�(first_name)�� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
	-- substr(str, position, length) : str ���ڸ� positin ���� length���� ��ŭ ǥ��
	-- lower(str)  �ҹ��� ��ȯ
	-- length(str)  str�� ����
**/

SELECT first_name �̸�, lower(substr(first_name, 1,3)) FROM EMPLOYEES e WHERE length(first_name) >=6;





/**
10�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�
**/
SELECT avg(salary) ���, max(salary) �ְ�, min(salary) ����, count(*) �ο��� FROM EMPLOYEES e WHERE department_id = 10;

/**SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID = 10;




/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
**/
SELECT avg(salary)���, max(salary) �ְ�, min(salary) ����, count(*) �ο��� FROM EMPLOYEES e2 GROUP BY DEPARTMENT_ID;





/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/

SELECT department_id �μ���ȣ,  job_id ������, count(*) �ο���  FROM EMPLOYEES e GROUP BY department_id,JOB_ID ;



/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/
SELECT job_id ���� count(*) �ο��� FROM EMPLOYEES GROUP BY JOB_ID HAVING count(*) >=4;


/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/
SELECT round(avg(salary),0) ��տ���, sum(SALARY) ��ü����, max(salary) �ְ���� , min(salary) �������� FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ORDER BY avg(salary) DESC;





