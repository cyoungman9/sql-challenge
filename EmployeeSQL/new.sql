CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM "Departments";

CREATE TABLE "Dept_Employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept_Employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

SELECT * FROM "Dept_Employee"

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR  NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "Employees"

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR  NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);



ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- Question 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
Inner Join "Salaries" as s ON
e.emp_no = s.emp_no;


SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '01/01/1986'
AND hire_date <= '01/01/1987'

SELECT de.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
FROM "Dept_Manager" as de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no;


SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Employee" de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no;

SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name like 'B%'


SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Dept_Employee" as de
INNER Join "Departments" as d
ON de.dept_no = d.dept_no
INNER Join "Employees" as e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

SELECT "Employees"
(SELECT COUNT(last_name))
FROM "Employees"

