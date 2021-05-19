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

-- 3.

SELECT de.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
FROM "Dept_Manager" as de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no;

-- 4. 

SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Employee" de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no;

-- 5.

SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
SELECT SUBSTRING(last_name, 1, "B") AS ExtractString;

-- 6.

SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name like 'B%'

-- 7. 

SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Employee" as de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

-- 8.

SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Employee" as de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8.

SELECT count (last_name)
FROM "Employees"