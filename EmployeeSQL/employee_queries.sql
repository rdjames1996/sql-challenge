-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
JOIN salaries ON
employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees WHERE
hire_date >= '01/01/1986'AND hire_date <= '12/31/1986'
ORDER BY employees.hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_name,
	departments.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%'
ORDER BY employees.last_name;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'
ORDER BY employees.emp_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).	
SELECT employees.last_name, COUNT(employees.last_name) AS frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency DESC;
