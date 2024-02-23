REM   Script: Section 9 Script
REM   Section 9 Script

CREATE TABLE department 
( 
  id	   		number(5) constraint pk_department primary key, 
  name	   		varchar2(50), 
  monthly_budget 	number(8,2), 
  last_employee_id 	number(5) 
);

CREATE TABLE employee 
( 
  id        number(5) constraint pk_employee primary key, 
  name      varchar2(50), 
  birthdate date, 
  phone     varchar2(20), 
  salary    number(7,2) not null, 
  department_id number(3) constraint fk_employee_department references department, 
  hire_date date, 
  job_id    varchar2(20), 
  email     varchar2(50) 
 );

 insert into department values (1,'ACCOUNTING',20000,8);

 insert into department values (2,'MARKETING',15000,9);

 insert into department values (3,'INFORMATION TECHNOLOGY',30000,10);

 insert into department values (4,'HUMAN RESOURCES',25000,13);

 insert into department values (5,'REGULATORY AFFAIRS',5000,null);

 insert into department values (6,'CUSTOMER SERVICE',2000,null);

 insert into employee values (1,'JOHN SMITH',date '1995-01-01','1.123.456.7890',4000.00,1,date '2015-03-28','AC_ACCOUNT','JSMITH');

 insert into employee values (2,'JAMES BOSH',date '1992-02-15','1.234.567.8901',3500.00,2,date '2014-07-01','MK_REP','JBOSH');

 insert into employee values (3,'LUISA JACKSON',date '1970-03-08','1.345.678.9012',4500.00,3,date '2013-08-29','IT_PROG','LJACKSON');

 insert into employee values (4,'STUART GARCIA',date '1965-04-12','1.456.789.0123',2000.00,4,date '2010-02-15','HR_REP','SGARCIA');

 insert into employee values (5,'JUSTIN BLACK',date '1990-05-16','1.567.890.1234',2550.00,1,date '2015-05-02','AC_ACCOUNT','JBLACK');

 insert into employee values (6,'ANGIE CROOD',date '1998-06-22','1.678.901.2345',1500.00,1,date '2015-07-01','AC_ACCOUNT','ACROOD');

 insert into employee values (7,'CHARLES DEAN',date '1973-06-08','1.789.012.3456',2250.00,3,date '2002-03-01','IT_PROG','CDEAN');

 insert into employee values (8,'EDDIE FARREL',date '1980-07-28','1.890.123.4567',3000.00,1,date '2009-04-20','AC_ACCOUNT','EFARREL');

 insert into employee values (9,'GEORGE HAYES',date '1982-08-03',NULL,2500.00,2,date '2012-09-22','MK_REP','GHAYES');

 insert into employee values (10,'IGOR KEYS OSBOURNE',date '1987-09-11','144.898.7564',6000.00,3,date '2014-11-14','IT_PROG','IKEYS');

 insert into employee values (11,'LUKE MINT',date '1985-10-19','1.123.456.7890',5000.00,4,date '2011-01-08','HR_REP','LMINT');

 insert into employee values (12,'NIGEL OAKS',date '1997-11-05','52.987.654.3210',4750.00,4,date '2014-10-01','HR_REP','NOAKS');

 insert into employee values (13,'LUKE GREEN JR',date '1995-02-05',NULL,4750.00,4,date '2015-09-01','HR_REP','LGREEN');

ALTER TABLE EMPLOYEE ADD BONUS NUMBER;

UPDATE employee 
SET bonus = 
  CASE 
    WHEN salary < 3000 
    THEN 100 
    WHEN salary BETWEEN 3000 AND 4000 
    THEN 200 
    WHEN salary BETWEEN 4001 AND 4900 
    THEN 300 
  END;

commit;

select substr('SOME TEXT', 2, 3),
substr('SOME TEXT', 2),
substr('SOME TEXT', -4, 3),
upper('hello'),
lower('HELLO'),
initcap('HELLO THERE'),
replace('ONE DAY', 'DAY', 'YEAR'),
replace('ONE DAY', 'DAY'),
translate('HELLO THERE', 'ELH', '314'),
translate('HELLO THERE', 'LHE', '143'),
translate('HELLO THERE', 'EL', ''),
translate('HELLO THERE', 'EL', '*'),
length('LENGTH OF THIS TEXT'),
instr('THIS IS A STRING', 'I'),
instr('THIS IS A STRING', 'I', 4),
instr('THIS IS A STRING', 'I', 4, 2),
instr('THIS IS A STRING', 'I', -1, 3),
concat('ONE ', 'TWO '),
'ONE ' || 'TWO'
from dual;

select *
from employee
where length(name) - length(replace(name, 'O')) = 2;

select name, job_id, substr(job_id, 1, instr(job_id, '_')-1) as dept
from employee;

-- This essentially allows you to nest functions
--One important note is understand that what's being passed through is job id but it negates everything after the underscore and doesn't include the '_'


select initcap(name), birthdate, replace(phone, '.', '-'), salary, department_id, hire_date, job_id, lower(email) || '@gmail.com', bonus, translate(substr(name, 1, instr(name, ' ')-1), 'XAEIOU', 'X') as CODE
from employee;

-- Use this translate method to remove all letters to exclude and define a specific position of the string

select name, birthdate, phone, translate(substr(phone, 3, 3), 'x.', 'x') as PHONE_SEGMENT, salary, department_id, hire_date, job_id, email, bonus
from employee
where hire_date > date '2010-01-01'
order by salary desc; 

-- I can also carry over the same concept here but this time I can set a character limit and position in the substr part of the method


select trunc(26.895),
trunc(26.895, 1),
trunc(469.895, -2),
round(26.895),
round(26.895, 1),
round(469.895, -2),
floor(26.895),
ceil(26.895),
sign(-25),
sign(0),
sign(25),
mod(10,4)
from dual;

select round(salary/30)
from employee;


 with emp_data as
(
     select name, job_id, salary, salary / 30 as daily_salary
     from employee
     where hire_date > date '2010-12-31' or department_id = 3
)
select e.*, round(daily_salary), trunc(daily_salary), ceil(daily_salary), floor(daily_salary)
from emp_data e
where daily_salary = trunc(daily_salary);

--Note that a with query can only be properly called when it is used in a from statement 
--An established letter (like 'e' in this example) can be used in basically any select statement, just be careful as far as where it should be used


alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

select
sysdate,
systimestamp,
add_months(sysdate, 2),
add_months(sysdate, -2),
last_day(sysdate),
months_between(sysdate, '22-dec-2018'),
months_between(sysdate, '22-sep-2019'),
extract(year from sysdate),
extract(month from sysdate),
extract(hour from systimestamp),
next_day(sysdate, 'sunday'),
next_day(sysdate, 'sun'),
trunc(sysdate),
trunc(sysdate, 'hh'),
trunc(sysdate, 'month'),
trunc(sysdate, 'year'),
round(sysdate, 'year')
from dual;

select *
from dual
where sysdate between date '2019-01-01' and date '2019-05-07';

--This method does not work because it is not properly formatted in this context

select *
from dual
where sysdate between date '2019-01-01' and to_date ('2019-05-07 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

--The methods above and below can be great alternate solutions to fix this issue

select *
from dual
where sysdate between date '2019-01-01' and date '2019-05-07' + 1 - 1/86400;


alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

select id, name, hire_date, 
round(months_between(sysdate, hire_date)) as MONTHS_WORKED, 
add_months(hire_date, 6) as RAISE_EARNED_DATE,
next_day(hire_date, 'mon') as INDUCTION_DATE,
trunc(hire_date, 'month') as NEWSLETTER_DATE
from employee
where department_id not like 3;


alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

SELECT
'['||to_char(325) ||']',
'['||to_char(1325, '9,999.999') ||']', 
'['||to_char(1325, '99,999.999') ||']', 
'['||to_char(0.25) ||']',
'['||to_char(0.25, '00.99') ||']', 
'['||to_char(10.25, '00.99') ||']', 
'['||to_char(1325, '999') ||']', 
'['||to_char(-1325, '9,999') ||']', 
'['||to_char(1325, 'fm9,999') ||']',
'['||to_char(1325, 'fmL9,999', 'NLS_CURRENCY= ''USD''') ||']',
'['||to_char(1325, 'fmL9,999') ||']',
to_number('$.05', 'L.99'),
to_number('T5' DEFAULT -1 ON CONVERSION ERROR, '99'), 
to_char (sysdate, 'day'),
to_char (sysdate, 'month'),
to_char (sysdate, 'mm-dd-yyyy "TIME:" hh24:mi:ss'),
to_date('jun152019', 'monddyyyy'),
to_date ('2019150618', 'yyyyddmmhh24'),
to_date ('2019150618' DEFAULT NULL ON CONVERSION ERROR, 'ddmmyyyyhh24'), 
cast('mar15-2019 10:20:30' as date, 'mondd-yyyy hh24:mi:ss'),
cast (1325 as varchar2 (50)),
cast (sysdate as varchar2 (20)),
cast ('Q.05' as number, 'L.99', 'NLS_CURRENCY = ''Q'''),
cast('$.05' as number DEFAULT -1 ON CONVERSION ERROR, '0.99') 
FROM dual;

select *
from department
where validate_conversion(to_char(last_employee_id) as DATE, 'mm') = 1;

select *
from department;

select d.*, to_date(last_employee_id, 'mm')
from department d
where validate_conversion(to_char(last_employee_id) as DATE, 'mm') = 1;


select name, birthdate, phone, 
to_char(department_id, '0009') as department_id, 
to_char(salary,'FML9,999.00') as salary,
to_date(to_char(birthdate, 'ddmmyyyy') default null on conversion error, 'mmddyyyy') as ALT_BIRTHDATE
from employee 
where birthdate > date '1970-12-31' and phone is not null;

select name,
to_char(birthdate, 'DD/MM') as BIRTHDATE,
to_char(hire_date, 'Monthyyyy') as HIRE_DATE,
to_char(to_number(substr(phone,-4, 4)), 'fmL9999.00') as BONUS,
to_char(to_date(substr(phone, -1) default 12 on conversion error, 'mm'), 'Month') as BONUS_MONTH
from employee
where (hire_date < date '2015-01-01' and salary > 2500) or (hire_date >= date '2015-01-01' and salary < 3000);


select *
from employee
where hire_date = '01-10-2014';

--This query is correct but instead of returning it as a date, it is returned as a string so watch out for mistakes like this

select *
from employee
where hire_date = to_date('01-10-2014', 'DD-MM-YYYY');

-- This is the correct way to fix this problem
-- However this can still be susceptible to error if I were to change the langauge perhaps

select *
from employee
where hire_date = to_date('01-10-2014', 'DD-MM-YYYY', 'NLS_DATE_LANGUAGE = ''english''');

--This prevents a language change from affecting the functionality of the code

select *
from employee
where hire_date = to_date(sysdate, 'dd-mon-yyyy');

--This code does not work because sysdate stores a date not a varchar, therfore it doesn't return anything


select name, 
'DEPT: ' || Decode(department_id, 3,'IT', 4, 'HR', 'OTHER')
from employee;

--The decode function essentially works the same way as an if then else statment
--It uses an expression followed by an infinite number of search values and a default result in case nothing is returned

select salary, decode(sign(salary-3000), 1, 'Greater THAN 3000', 'NOT GREATER')
from employee;

--This code uses the sign function to determin wheather a number is greater than 0
--If it sees a negative number, it returns 'NOT GREATER'

select name,
case department_id
when 3
then 'IT'
when 4
then 'HR'
else
'OTHER'
end as dept_id
from employee;

--This method is functionally the same as decode, but this allows you to asign a name after the conditions are returned 
--This is an overall a more preferrable method because it's more common across a lot of other databases while decode is more exclusive to Oracle

select name,
case
when department_id = 1 and hire_date >= date '2015-01-01'
then 'New accountant'
when job_id = 'IT_PROG' and salary < 3000
then 'Low pay programmer'
else
'Other'
end as type
from employee;


select name,
salary as CURRENT_SALARY,
decode(department_id, 1, salary * 1.10, 2, salary * 1.15, salary * 1.20) as NEW_SALARY_1,
case
    when department_id = 1
    then salary * 1.10
    when department_id = 2
    then salary * 1.15
    else
    salary * 1.20
end as NEW_SALARY_2
from employee;



select name, salary,
to_char(hire_date, 'yyyy') as HIRE_YEAR,
case
when salary < 2500
then 'A'
when salary >= 2500 and salary < 4000
then 'B'
when salary >= 4000 and hire_date < date '2014-01-01'
then 'C'
when salary >= 4000 and to_char(hire_date, 'yyyy') in ('2014', '2015')
then 'D'
else
'Null'
end as CLASSIFICATION
from employee
where department_id != 2 and phone is not null
order by salary;


select sysdate,
sysdate-365,
add_months(sysdate, 1) - sysdate,
--This is another way of describing the difference in days within the current month
to_char(sysdate+6/24, 'hh24:mi:ss')
from dual;

select name,
to_char(birthdate+5.787037037037037e-5, 'dd-mm-yyyy hh24:mi:ss')
from employee;

select name,
to_char(birthdate+5/(24*60*60), 'dd-mm-yyyy hh24:mi:ss')
from employee;


select id, name,
to_char(birthdate + (2 * 365), 'dd-mm-yyyy hh24:mi:ss') as SECOND_BIRTHDAY,
(hire_date - birthdate) * 24 as HOURS_OLD_WHEN_HIRED
-- to calculate a date to hours, multiply by 24 to convert to hours since there are 24 hours in a day
from employee
where hire_date >= date '1980-01-01' and substr(phone, 1, 1) = 1
order by department_id, salary desc;


select product_name as 'product name',
replace(description, 'and', '&') as description,
upper(category) as category,
list_price as 'list price',
round(list_price - (list_price * (discount_percentage / 100)), 2) as 'final price',
case
when discount_percentage = 0 
then 'None'
when discount_percentage < 40 and discount_percentage > 0 
then 'Moderate'
else 'High'
end as "discount level"
from products
where (category, list_price) in 
(
select category, max(list_price)
from products
group by category
)
order by category;


