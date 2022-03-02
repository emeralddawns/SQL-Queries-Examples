--Confirm the table's existence
select * from "departmentemployee";
select * from "departmentmanager";
select * from "departments";
select * from "employees";
select * from "salaries";
select * from "titles";


-------------------------------------------
---------------DATA ANALYSIS---------------
-------------------------------------------

-- 1) List the following details: employee number, last name, first name, sex, and salary.

select employees.emp_id, employees.first_name, employees.last_name, employees.sex, salaries.salary
from employees
inner join salaries
	on employees.emp_id = salaries.emp_id;

-- 2) List first name, last name, and hire date for employees 
	--who were hired in 1986.
	
select employees.first_name, employees.last_name, employees.hire_date
from employees
where date_part('year', employees.hire_date) = 1986;

-- 3) List the manager of each department with the following information:
	--department number, department name, the manager's employee number, last name, first name.
	
select departments.dept_id, departments.dept_name, departmentmanager.emp_id, employees.last_name, employees.first_name
from departmentmanager
inner join departments
	on departments.dept_id = departmentmanager.dept_id
inner join employees
	on employees.emp_id = departmentmanager.emp_id;

-- 4) List the department of each employee with the following information:
	--employee number, last name, first name, and department name.
	
select employees.emp_id, employees.last_name, employees.first_name, departments.dept_name
from departmentemployee
inner join departments
	on departments.dept_id = departmentemployee.dept_id
inner join employees
	on employees.emp_id = departmentemployee.emp_id;

-- 5) List first name, last name, and sex for employees 
	--whose first name is "Hercules" and last names begin with "B."
	
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6) List all employees in the Sales department with the following information:
	--employee number, last name, first name, and department name.
	
select employees.emp_id, employees.last_name, employees.first_name, departments.dept_name
from departmentemployee
inner join departments
	on departments.dept_id = departmentemployee.dept_id
inner join employees
	on employees.emp_id = departmentemployee.emp_id
where departments.dept_name = 'Sales';
	
-- 7) List all employees in the Sales and Development departments with the following information:
	--employee number, last name, first name, and department name.	
	
select employees.emp_id, employees.last_name, employees.first_name, departments.dept_name
from departmentemployee
inner join departments
	on departments.dept_id = departmentemployee.dept_id
inner join employees
	on employees.emp_id = departmentemployee.emp_id
where (departments.dept_name = 'Sales' or  departments.dept_name = 'Development');
	
-- 8) List the frequency count of employee last names, i.e., how many employees share each last name.
	--In descending order

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) DESC;







