Drop existing tables before creating tables
drop table if exists employees cascade;
drop table if exists departments cascade;
drop table if exists dept_manager cascade;
drop table if exists titles cascade;
drop table if exists salaries cascade;
drop table if exists dept_emp cascade;

create table departments (
	dept_no varchar(20) primary key,
	dept_name varchar(20)
)
;

create table titles ( 
	title_id varchar(20) primary key,
	title varchar(20)
)
;

create table employees (
	emp_no int primary key,
	emp_title_id varchar(10), 
	birth_date date,
	first_name varchar(20),
	last_name varchar(20),
	sex varchar(10),
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

create table dept_emp (
	emp_no int,
	dept_no varchar(20),
	primary key(emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
)
;

create table dept_manager (
	dept_no varchar(10),
	emp_no int primary key,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
)
;
create table salaries (
	emp_no int primary key,
	salary money,
	foreign key (emp_no) references employees(emp_no)
)
;


