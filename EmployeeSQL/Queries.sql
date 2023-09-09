-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, last_name, first_name, sex, salary
from employees e 
join salaries s on e.emp_no = s.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees  
where hire_date between '1986-01-01' and '1986-12-31'
;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select title, d.dept_no, dept_name, e.emp_no, last_name, first_name
from titles t 
join employees e on t.title_id = e.emp_title_id
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
where title = 'Manager'
;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, e.emp_no, last_name, first_name, dept_name
from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
select dept_name, e.emp_no, last_name, first_name 
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = de.dept_no
where dept_name = 'Sales' 
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where dept_name = 'Sales' or dept_name = 'Development'
; 

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, Count(last_name) as same_last
from employees
group by last_name
order by same_last desc
