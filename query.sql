-- List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW salaries AS
	SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		s.salary AS "Salary"
		FROM employees AS e
		JOIN salaries AS s ON e.emp_no = s.emp_no;
	
-- List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW 1986_hires AS
	SELECT e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.hire_date AS "Hire Date"
		FROM employees AS e WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
CREATE VIEW managers AS
	SELECT ds.dept_no AS "Department Number",
		ds.dept_name AS "Department Name",
		dm.emp_no AS "Manager Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
		FROM employees AS e
		JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
		JOIN departments as ds on dm.dept_no = ds.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW departments AS
	SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		ds.dept_name AS "Department Name"
		FROM employees AS e
		JOIN dept_emp AS de ON e.emp_no = de.emp_no
		JOIN departments AS ds ON de.dept_no = ds.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Hercules_B AS
	SELECT first_name AS "First Name",
		last_name AS "Last Name",
		sex AS "Sex"
		FROM employees WHERE first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_dept AS
	SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		ds.dept_name AS "Department Name"
		FROM employees AS e
		JOIN dept_emp AS de ON de.emp_no = e.emp_no
		JOIN departments AS ds ON de.dept_no = ds.dept_no
		WHERE ds.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_devel_dept AS
	SELECT e.emp_no AS "Employee Number",
			e.last_name AS "Last Name",
			e.first_name AS "First Name",
			ds.dept_name AS "Department Name"
			FROM employees AS e
			JOIN dept_emp AS de ON de.emp_no = e.emp_no
			JOIN departments AS ds ON de.dept_no = ds.dept_no
			WHERE ds.dept_name = 'Sales' OR ds.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.		
CREATE VIEW last_name_freq AS
	SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency Count"
	FROM employees
	GROUP BY last_name
	ORDER BY "Frequency Count" DESC;
	
	