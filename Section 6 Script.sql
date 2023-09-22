REM   Script: Udemy Section 6 Script
REM   Udemy Section 6 Script

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

COMMIT;;

select * 
from employee

where salary > any(50000,100000,1);


select *
from products

where product_name like 'A%';

--In this example, the LIKE command is used to recognze patterns within a table when using a query
--The % sign is used to signifiy an empty string
--This means that anything with the the letter A within a product name is returned (even if it's just the letter A)

select *
from products

where product_name like '%o%n%';

--In this example, if there is a character or space before and after O  and a character or space before and after N,  the product name is returned

select *
from products

where product_name like '_n%';

--This example means that the second character must be an N and anything afterwards can be returned
--The '_' signifies the position of where the character is located
--The to use this method you must always use in total three characters to signify the position. No more no less (ie. '___')

select * 
from products 

where price in (5,10,25);

--The difference between IN and ALL is that all is used in conditional settings (ie prod >= all (etc.))
--IN is used to directly filter the results instead of comparing values like ALL
--The  IN command basically shortens the expression to make it eaiser (ie. price = 5 or price =10 or price = 25)

select *
from products

where price between 5 and 10;

--This BETWEEN  command is used as a shortcut to use this expression (where price >=5 and price <=10)

select *
from company

where budget between budget_range_start and budget_range_end;

--This BETWEEN function is used to select specific columns. Something that a normal conditional statement cannot do.


select *
from employee

where name like '%O_%O%';

--The purpose for adding an undersore in the middle is to indicate that at least one character must be in-between the two letters. 
--We would also need a percentage sign after the underscore as well to indicate that it can be any character. 
--And of course, We will need  percentage signs before the first "O" and after the last "O". 
--The purpose is to filter any names that have two O's but are not together (ie. Wood, Book, Look, etc.)

select *
from department

where monthly_budget > 15000
and (name like '%G%' or name like 'H%');

select *
from employee

where (department_id in (3, 4))  
and (salary between 3000 and 5000) 
and (birthdate between date '1970-01-01' and date '1990-12-31');


select *
from products 
where not price > 10;

--The NOT operator is used to return results that are false to the conditional statement used

select * 
from products
where not product_name like '%llin%';

select *
from products
where not (price < 10 
and product_id  > 1);

--In this example the statement in the parenthesis is carried out first before applying the NOT statement. If what's in the parenthesis is false, it's returned.

select *
from products
where not price < 10 
and product_id  > 1;

--Without parenthesis, the NOT statement is used first and then carries out the the AND statement in this example
--In terms of priorty with the logical operators it's in this order from greatest to least: NOT, AND, OR
--These priorities are important to determine what is considered first when there are not parenthesis that are used in the statement


select *
from employee
where (birthdate < date '1980-01-01' or birthdate > date '1995-01-01')
and salary + nvl (bonus, 0) > 2000
and not (name like 'N%' or name like '%N');

--The NVL for bonus is not extremely important in the context of this table, but it's important to include it for future iterations since it could likely be important in a real-world setting.


select *
from employee
where department_id = &department;

--The & is used to represent a substitution variable that enables the user to enter a value to return.
--Doesn't work in SQL Live

select *
from employee
where job_id = &'job';

-- Used to input strings

select *
from employee
where hire_date >= date '&date';

-- Used for dates

select *
from employee
where salary = &&sal
or salary = &sal * 2;

--This is used in instances where you don't need to input the value multiple times


