REM   Script: Udemy Section 5 Script Part 2
REM   Udemy Section 5 Script Part 2

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

--Select Statements

select *
from employee;

select * 
from employee 

where phone != '1';

--The WHERE statement uses an != sign to represet a value being different to what is specified.

select * 
from employee 

where phone is null;

--The IS NULL command is used to specify results are null or has no information at alll

select * 
from employee 

where phone is not null;

--The IS NOT NULL command is used to specify results are not null


select *
from employee

where salary > 4000
and (phone != '1.234.567.8901' or phone is null);

--This WHERE stement filters results by salaries that ar greater than 4000
--Concurrently the sub-conditional OR statement is specified since in the problem, the individual in question has a tendency to be available and not be available and is not important to include him on the list
--To fix this by adding an != and an IS NULL statement, it implies that either the individual with this phone number or ANY individual with a null value within thier phone number must not be included


select *
from employee

order by phone nulls first;

--This ORDER BY statement sorts the query results by specifing the null values for phone first

select *
from employee

order by phone desc nulls last;

--This ORDER BY statement sorts the query results by specifing phone numbers from last to first and displays the null results at the end of the returned list.


select id, name, nvl(phone, '***NO PHONE***')
from employee

order by id;

--The NVL function uses two expressions: (expression 1, expression 2)
--Basically works the same way as an if-else statement execept both expresseions must yield results with a similar data type
--Meaning, you can't send a var char and a string as the expressions in a nvl because they do not yeid the same data types

select *
from employee

where nvl(phone, '*') = '*';

--This WHERE statement uses an NVL function to specifiy null values within a query
--By setting the * string equal to what's within the NVL function, means that it will return null results because it filters results that yield null results becasuse once you set the nvl equal to one of it's expressions, it will filter results further to make the entire statement true.
--However the * string does not appear in the results returned. In this case, it's only used as a pointer of information for anything that is considered null.

select *
from employee

where salary > 4000
and nvl(phone, '*') != '1.234.567.8901';

-- This WHERE statment essentially yields the same result as the last query just made simpler with the NVL command
--This essentially means that you can do two tasks without calling the phone value twice
--This is acceived by having the NVL store the phone value and the * marker while also calling a != command for the specific number 

select name, coalesce(phone, email, 'NO CONACT INFO') 
from employee;

--This COALESCE statement works essentially the same as NVL but isn't as limited with the amount of expressions
--NVL can only take two expressions while COALESCE can take multiple expressions
--Both share the same purpose for replacing null results


select name, coalesce(commercial_contact,technical_contact, president, '*NO CONTACT DATA*'), nvl(budget, budget_range_start) from company;


select id, nvl2(phone, name, job_id)
from employee;

--NVL2 Does not return the first expression if it is null. It will instead return either expressions 2 or 3 depending on 1
--In this case phone is considered to be the value that is checked instead of serving as a conditional expression if a value is null

select id, name, department_id, nullif(id, department_id)
from employee;

--NULLIF is used in cases where two values being called are considered null if they are both the same
--If they are different, it will then choose which value to use based on wheather the value being inspected into the first expression within the NULLIF command is null or not. If it is null, it moves on to second expression and returns that value instead.
--If both values are null, it will return null as well since both values match as null values.

select *
from employee
where salary > 4000
and lnnvl(phone='1.234.567.8901');

--LNNVL is used in cases where you return results that are false based on what's entered in the LNNVL command or is unknown (null)


select name, nullif(commercial_contact, technical_contact), nvl2(last_contacted, budget, budget_range_start), last_contacted
from company

where lnnvl(last_contacted < date '2019-01-01')
order by last_contacted nulls first;


