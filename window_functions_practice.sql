SELECT dem.employee_id, age,occupation
FROM employee_demographics AS dem
JOIN employee_salary AS sal
 ON dem.employee_id = sal.employee_id;














SELECT *
FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
 ON dem.employee_id + 1 = sal.employee_id
INNER JOIN parks_departments pd
ON sal.dept = pd.department_id;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
    ON sal.dept_id = pd.department_id;




SELECT *
FROM employee_demographics AS de
INNER JOIN employee_salary AS sal
ON de.employee_id = sal.employee_id;

 SELECT sa.employee_id, de.first_name, sa.salary
FROM employee_demographics AS de
JOIN employee_salary AS sa
ON de.employee_id = sa.employee_id;




SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;







SELECT first_name, last_name, 'Old Man' AS lable1
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Piad Employee' AS lable1
FROM employee_salary
WHERE salary > 70000
UNION
SELECT first_name, last_name, 'Old Lady' AS lable1
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
ORDER BY first_name, last_name;




SELECT LENGTH ('skyfall');
SELECT *
FROM employee_demographics
ORDER BY 2;




SELECT first_name, last_name, salary AS annual_pay
FROM employee_salary
WHERE salary > 50000
;





SELECT avg(age), gender
FROM employee_demographics
GROUP BY gender
;

SELECT occupation
FROM employee_salary
GROUP BY occupation
HAVING avg(salary) > 45000
;

SELECT dem.employee_id, dem.first_name, dem.age, sal.occupation, sal.salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;



SELECT dem.employee_id, dem.first_name, dem.age, sal.occupation, sal.salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;

select dem.first_name, dem.last_name, sal.occupation, pa.department_name
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
JOIN parks_departments AS pa 
ON sal.dept_id = pa.department_id
;

SELECT dem.first_name, sal.occupation, AVG(sal.salary) AS avg_sal  
FROM employee_demographics AS dem                
JOIN employee_salary AS sal                                         
    ON dem.employee_id = sal.employee_id                    
GROUP BY sal.occupation                                         
HAVING AVG(sal.salary) > 40000                             
LIMIT 5;                                                       



SELECT first_name, length(first_name) 
FROM employee_demographics
ORDER BY 2
;

SELECT first_name, UPPER(first_name) 
FROM employee_demographics
ORDER BY 2
;
SELECT ltrim('      sky     ');

SELECT first_name,
left(first_name,4),
RIGHT (first_name,4),
SUBSTRING(first_name,3),
birth_date,
SUBSTRING(birth_date,5,7) AS month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;

SELECT locate('e', 'Alexander');

SELECT first_name, locate('An',first_name)
FROM employee_demographics;


SELECT first_name, last_name,
CONCAT(first_name,'   ',last_name) AS full_name
FROM employee_demographics;

SELECT first_name, last_name, CONCAT(first_name, '         ', last_name) AS full_name 
FROM employee_demographics;


SELECT department_name, department_id, concat(department_name, '', department_id),
locate('a', 'ParksandRecreation')
FROM parks_departments;




SELECT first_name, last_name, age,
CASE
     WHEN age < 31 THEN 'young'
     WHEN age BETWEEN 30 and 50 THEN 'old'
     WHEN age > 50 THEN 'very old'
END AS age_bracket
FROM employee_demographics;



SELECT first_name, last_name, salary, 
CASE WHEN salary < 50000 THEN salary + (salary * 1.05)
WHEN salary > 50000 THEN salary + (salary * 1.07)
END AS new_salary,
CASE WHEN dept_id = 6 THEN salary * 0.10
END AS bonus
FROM employee_salary


SELECT *
FROM employee_demographics
WHERE employee_id IN (SELECT employee_id
FROM employee_salary  WHERE dep_id = 1 );



SELECT *
FROM employee_demographics
WHERE employee_id IN (SELECT employee_id
FROM employee_salary  WHERE dept_id = 1 );



SELECT first_name, last_name, salary, avg(salary),
(SELECT AVG(salary)
FROM employee_salary AS avg_salary)
FROM employee_salary
GROUP BY first_name, last_name,salary
;


SELECT avg(age), count(age), MAX(age), MIN(age) 
FROM employee_demographics
GROUP BY gender);




SELECT  AVG(`MAX(age)`)
FROM 
(SELECT gender, avg(age), count(age), MAX(age), MIN(age) 
FROM employee_demographics
GROUP BY gender) AS a_new_table
;



SELECT gender, AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal 
ON dem.employee_id = sal.employee_id
GROUP BY gender
;





SELECT gender, dem.first_name, dem.last_name, salary, 
ROW_NUMBER() OVER(PARTITION BY gender order by salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
dense_rank() OVER(PARTITION BY gender ORDER BY salary DESC) AS den
FROM employee_demographics dem
JOIN employee_salary sal 
ON dem.employee_id = sal.employee_id;


















   

