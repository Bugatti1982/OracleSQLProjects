REM   Script: Section 7 Script
REM   Section 7 Script

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

CREATE TABLE products 
  ( 
	Product_Id   NUMBER(5), 
	Product_Name VARCHAR2(100), 
	Price           NUMBER(8,2), 
	Expiration_Date DATE 
  ) ;

ALTER TABLE products ADD CONSTRAINT products_PK PRIMARY KEY ( Product_Id ) ;

insert into products values (1,'Aspirin',5,date '2025-12-31');

insert into products values (2,'Penicillin',10,date '2026-04-30');

insert into products values (3,'Insulin',25,date '2026-05-31');

insert into products values (4,'Acetaminophen',5,date '2027-01-31');

insert into products values (5,'Amoxicillin',8,date '2026-07-31');

ALTER TABLE EMPLOYEE ADD BONUS NUMBER;

CREATE TABLE company ( 
    id                  NUMBER(3) CONSTRAINT pk_company PRIMARY KEY, 
    name                VARCHAR2(100) NOT NULL, 
    commercial_contact  VARCHAR2(50), 
    technical_contact   VARCHAR2(50), 
    president           VARCHAR2(50), 
    last_contacted      DATE, 
    budget              NUMBER(8,2), 
    budget_range_start  NUMBER(8,2) NOT NULL, 
    budget_range_end    NUMBER(8,2) NOT NULL 
);

INSERT INTO company (id,name,commercial_contact,president,budget_range_start,budget_range_end ) VALUES (1,'OUR BRILLIANT FUTURE LTD','LUISA JACKSON','JOHN SMITH',25000,50000);

INSERT INTO company (id,name,president,budget,budget_range_start,budget_range_end ) VALUES (2,'TESTING MAGIC','JUSTIN BLACK',35000,25000,50000);

INSERT INTO company (id,name,technical_contact,president,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (3,'MAKING PROGRESS','ANGIE CROOD','CHARLES DEAN',DATE '2020-01-01',350000,125000,500000);

INSERT INTO company (id,name,commercial_contact,technical_contact,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (4,'SKILL MASTERY','NIGEL OAKS','NIGEL OAKS',DATE '2020-02-15',12000,10000,24000);

INSERT INTO company (id,name,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (5,'UNDECIDED AND CO.',DATE '2015-12-31',51000,51000,100000);

COMMIT;

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

--Select Statements

select min (price), max (price), sum (price)
from products
where price < 25;

--MIN gives you the smallest value of the table
--MAX gives you the largest value of the table
--When you add a conditional statement to a line of code such as this, the values will be changed to make the conditional statement true.
--So instead of 25 being returned as the maximum without the conditional statement, 10 is returned instead with the conditional statement
--SUM is used to add values together
--Keep in mind that all the vaules added to make up 28 are all less than 25. 25 does not depict the end result, but rather all the values being returned from the table.

select count (product_id), sum (price), count(alternate_name), count(*)
from products;

--COUNT is used to count the number of values
--COUNT (*) counts the amount of rows in a table

alter table products add alternate_name varchar2(50);

update products 
set alternate_name = substr(product_name, 1,3)
where product_id < 4;

--This code allows you to directly edit the values entered within this table

select count(distinct salary)
from employee;


select count(department_id) as "EMPLOYEES", sum(salary) as "TOTAL_SALARIES", avg(salary) as "AVERAGE_SALARY", sum(salary) / count(department_id) as "MANUAL_AVERAGE_SALARY"
from employee
where department_id = 1;


select department_id, count(*) 
from employee 
group by department_id;

--This counts the number of occurences that the same department id is used
--The GROUP BY command is used to sort values into a specific group

select distinct department_id 
from employee;

--Alternatively, it is the same as this code above

select department_id, bonus, count(*) 
from employee 
group by department_id, bonus;

--This makes use of the conditonal statement nested within the process of building the table which is why we see more rows

select department_id, sum(salary), sum (salary)
from employee
group by department_id;

--This gives an explaination as to how you can nest multiple funtions which is utilized below

select max(sum(salary)), avg(sum(salary))
from employee
group by department_id
having count(*) > 1;

--You typically want to have the HAVE command after the GROUP BY command


select bonus as "BONUS", count(*) as "EMPLOYEES", max(salary) as "GREATEST_SALARY"
from employee
where birthdate < date '1995-01-01'
group by bonus
order by bonus;


select department_id, bonus, count(*) 
from employee 
group by department_id, bonus
having count(*) > 1;

-- A HAVING command is used for special functions such as aggregate functions (MIN, SUM, MAX, AVG, COUNT) to be used after the results are returned

select department_id, bonus, count(*) 
from employee 
where department_id = 3
group by department_id, bonus;

--A HAVING command command yield the same results

select department_id, bonus, count(*) 
from employee 
group by department_id, bonus
having department_id = 3;

select department_id, min(salary)
from employee
where department_id in (3, 4)
group by department_id
having min(salary) > 2000;


select department_id, min(salary), max(salary), avg(bonus)
from employee
where not bonus is null
group by department_id
having min(salary) < 2000 or max(salary) > 4000
order by min(salary) desc;


