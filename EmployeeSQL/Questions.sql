-- 1.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
Inner Join "Salaries" as s ON
e.emp_no = s.emp_no;

-- 2.

SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '01/01/1986'
AND hire_date <= '01/01/1987'