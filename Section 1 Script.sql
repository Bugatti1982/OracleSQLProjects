REM   Script: Udemy Section 1 Script
REM   Udemy Section 1 Script

select * from hr.employees;

select * from hr.employees;

select first_name, last_name, department_name 
from hr.employees join hr.employees 
using (department_id);

select * from hr.employees;

select first_name, last_name, department_name 
from hr.employees join hr.departments 
using (department_id);

