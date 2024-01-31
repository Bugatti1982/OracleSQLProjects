REM   Script: Section 8 Script (Revised)
REM   Section 8 Script (Revised)

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

select *
from employee
where salary = (
    select max(salary)
    from employee
);

-- This is what's known as a scalar subquery which means in only returns one row of information

select max(salary)
from employee;

-- This is what the inner query looks like by itself

select *
from employee 
where salary = 6000;

-- In this example, this essentially returns the same form of information as the one from the very top

select *
from employee
where department_id in
(select id
    from department
    where monthly_budget > 20000);

--Keep note that the 'in' command refers to matching the values in correspondence to another value
--Also understand that the subqueries in paranthesis are executed first before everything else in the code in this example

select *
from employee
where department_id in (3,4);

--It can alternatively be written this way. Both yield the same values.

select *
from department d
where 3 < (
    select count(*)
    from employee
    where department_id = d.id
);

--In this example this is what's known as a correlated subquery.
--What this does is select everything from the department table and assigns an alias (d).
--From there, this filters results that match both of the department id's from the department and employee tables and returns occurances of dep id's that are more than 3
--Because it's scalar, it returns only 1 result for each row intstead of listing all the occurances as listed.
--We cannot test this subquery by itself because it is calling to the alias d which is only assigned outside of the subquery.

select name,
(select max(salary)
    from employee
    where department_id = d.id)
from department d;

-- In this subquery, it is still correlated but this creates a new column.
-- Because it doesn't use a conditional sign (ie. >,=,<), it doesn't display one row of information and instead lists all that is needed.
-- It is possible to have the code create the alias d after the subquery is created as long as it is properly called.

SELECT *
FROM employee
WHERE department_id IN
  (
    SELECT department_id
    FROM department
    WHERE monthly_budget > 25000
  );

-- This code does not work because the select portion in the subquery does not match value of department_id in the where statement that's above it.
-- This is because department_id does not exist in the department table.
-- To fix this use 'id' instead of 'department_id' in the select part of the subquery

select *
from department
where (id, last_employee_id) in
(select department_id, id
    from employee
    where salary = (
    	select max (salary)
    	from employee)
);

-- In this example, there are two major things to keep in mind.
-- Notice that in the first where statement that the variables correspond to the pattern in the first select part of the subquery.
-- They must follow the same pattern in order for anything to be returned.
-- Also take note in the second where statement, there is another subquery being called.
-- This is known as a nested subquery.


select *
from department
where id in 
    (select department_id 
    from employee
    where birthdate in 
    (select max(birthdate)
    from employee)
);

--The key to remember here is find a bit of information that is identical to what's used in a different table
--You can use nested subqueries from the same table

select name , 
(
    select avg(salary)
    from employee
    where department_id = d.id
),
(
    select min(birthdate)
    from employee
    where department_id = d.id
)
from department d
order by id desc;

--Remember that subqueries that are used right at the begining of the main select statement creates a new column.


select *
from employee
where salary = 
(
    select max(salary)
    from employee
);

--To understand when to use queries is when you need to pull data from a different table or requires another query to perform a specific task
-- In this example, a subquery is used specifically to use the max function even though we are calling from the same table in both scenarios
-- Remember that functions like max, min, and avg can only be used in the select part of a query, hence the reason to form a subquery 

select *
from employee
where department_id in
(
    select id
    from department
    where monthly_budget > 20000
);

--Since this query needs to pull from 2 different tables, a subquery is needed.

select name ,
(
    select max(salary)
    from employee
    where department_id = d.id
)
from department d;

-- Remember that subqueries formed at the beginning of a select statment automatically creates a new column
-- Keep note that the d in 'd.id' refers to the alias referring to what will be called outside of the subquery
-- The 'id' in the 'd.id' refers to the value being pased through to match with from the second table (department table)

select *
from department d
where 3 <
(
    select count(*)
    from employee
    where department_id = d.id
);

-- This counts the number of employees returned that is greater than 3 and returns the correlated information regarding the department table
-- Keep note that the d in 'd.id' refers to the alias referring to what will be called outside of the subquery
-- The 'id' in the 'd.id' refers to the value being pased through to match with from the second table (department table)

select *
from 
(
    select department_id, avg(salary)as average_salary
    from employee
    group by department_id
) e
where e.average_salary > 4000;

-- If you need to pull information that's impossible to do in a where statement you use an inline view subquery shown above
-- Remember that a group by clause aggregates functions in order while as a order by clause organize data already returned in a query
--Keep note that inline view queries require a group by function because it is not a single-group function


select *
from 
(
    select department_id, min(salary) as MIN_SALARY, max(salary) as MAX_SALARY, avg(salary) as AVERAGE_SALARY
    from employee
    group by department_id
) mma
    
where mma.MAX_SALARY > 2 * mma.MIN_SALARY;


with emp as
(
    select department_id, avg(salary) as AVERAGE_SALARY
    from employee
    group by department_id
)
select *
from emp e
where e.AVERAGE_SALARY > 4000;

-- Alternatively, instead of using an inline view (which can be less efficient), we can use suquery factoring instead
--This method uses the with clause to begin creating the subquery and then calls it in the main query as a function
--This method still requires a group by clause so that is not returned as a single group clause

select department_id
from employee
where salary > 3000 and birthdate >= date '1986-01-01'
group by department_id
having count(*) > 1;

--This only returns part of what we need to show the table

select *
from employee
where department_id in
(
    select department_id
	from employee
	where salary > 3000 and birthdate >= date '1986-01-01'
	group by department_id
	having count(*) > 1
);

-- This sort of works but it does not take into account the where statement

with filtered_emp as
(
    select *
    from employee
    where salary > 3000 and birthdate >= date '1986-01-01'   
)
select *
from filtered_emp
where department_id in
(
    select department_id
    from filtered_emp
    group by department_id
    having count(*) > 1
);

--To fix this, we create the where statement as a function called filtered_emp
--From there the code calls a subquery that calls from filtered emp instead first
--That way the conditional statement is front and center first before executing what else is needed.

with subquery1 (name, dept_id, phone, new_total_salary) as
(
    select name, department_id, nvl(phone, 'NO PHONE'), salary * 1.25 + nvl(bonus, 0)
    from employee
)
select *
from subquery1;

--What's great about subquery factoring is that it allows you to assign alias for the columns right away in situations such as this one.
--This theoretically can be written without using a subquery, but this make it for efficient and is less of a hassle to write

with subquery1 (name, dept_id, phone, new_total_salary) as
(
    select name, department_id, nvl(phone, 'NO PHONE'), salary * 1.25 + nvl(bonus, 0)
    from employee
),
subquery2 as
(
    select *
    from subquery1
    where new_total_salary < 5000
)
select *
from subquery1;

--You can add a second subquery, however I'm not sure how this yields the results we want


with MMA (department_id, MIN_SALARY, MAX_SALARY, AVERAGE_SALARY) as
(
    select department_id, min(salary), max(salary), avg(salary)
    from employee
    group by department_id
)
select *
from MMA
where MAX_SALARY > MIN_SALARY * 2;


select *
from employee
where rownum <= 3
order by salary desc;

--This does not exactly yield the right result that we want because it is not ordered first.
-- It instead lists the top three results first and then orders them in descending order


with ordered as
(
    select *
    from employee
    order by salary desc
)
select *
from ordered
where rownum <= 3;

--However when it is executed like this, we yield the right results because the order is done first in a subquery before it limits the rows
-- Note that rownum only returns a select number of rows from the top down

select salary, count(*)
from employee
group by salary
order by salary;

select e.*, count(*) over (partition by salary)
from employee e
order by salary;

--Instead of using a group by clause we can use a partition by clause in which we need the group by function to happen right away in the main select part of the query

select name,  salary,
ROW_NUMBER() over (order by Salary desc) as ROW_NUMBER,
RANK() over (order by salary desc) as  RANK,
DENSE_RANK() over (order by salary desc) as DENSE_RANK
from employee
order by salary desc;

--row_number, rank, and dense rank are additional functions that you can use to define numeric data

with numbered as 
(
    select name, salary,
    row_number() over (order by salary desc) as rn
    from employee
    order by salary desc
)
select *
from numbered
where rn <= 3;

--This essentially shares the same functionality as the rownum function
--However it's worth noting that with this method you can include an entire column to displaying the actual row numbers as well

select *
from employee
order by salary desc
fetch first 5 rows only;

-- This method is much simpler rendition of what we wanted to return before
--It's worth noting that rownumb can still be usefull if order doesn't matter and you only want to return a specific amount of rows


select *
from employee
order by salary desc
fetch first 5 rows only;



with new_list as 
(
    select name, birthdate, phone, salary, department_id, hire_date, job_id, email, bonus,
    dense_rank() over (order by salary) as DRANK
    from employee
    order by salary
)
select *
from new_list
where DRANK <= 3;



select *
from employee
where salary > 2000
order by birthdate desc
fetch first 5 rows only;


select *
from employee
order by salary desc
fetch next 5 rows only;

--The fetch function can be written with only first and next

select *
from employee
order by salary desc
fetch first 5 percent rows only;

-- You can also write it as a percentage

select *
from employee
order by salary desc
fetch first rows only;

-- You can also write it as just the first row and the results remain the same

select *
from employee
order by salary desc
fetch first 3 rows with ties;

-- This returns an extra row becase the salary matches the third result return so it is returned as well

select *
from employee
order by salary desc
offset 4 rows fetch first 3 rows with ties;

-- Offset clause means that it skips the first 4 rows and moves to the 3 rows with ties

with numbered as
(
    select e.*, row_number() over (order by salary desc) as rn
    from employee e
)
select *
from numbered
where rn between 5 and 7;

-- It could also be written like this, but it's not as efficient


SELECT *
FROM employee
ORDER BY salary, id
OFFSET (&page - 1) * 4 ROWS FETCH FIRST 4 ROWS ONLY;

--Cannot use this code in oracle sql live but this is suppost to prompt the user to enter for the page number to display 4 results at a time


SELECT category, COUNT(*) AS book_count
FROM books
WHERE price > (
        SELECT AVG(price)
        FROM books
    )
    AND author IS NOT NULL
GROUP BY category
HAVING COUNT(*) > 1;


--If you don't have a working solution from the first part of the challenge
--   you can use the following code (or part of it) and just extend it to produce the final result.
--To uncomment the below code, just select/mark the code and press Ctrl + /
--IMPORTANT: If you will use your own code, REMOVE all this commented text and code, and add your solution.

SELECT *
FROM books
WHERE category IN (SELECT category
                    FROM books
                    WHERE price > (
                            SELECT AVG(price)
                            FROM books
                        )
                        AND author IS NOT NULL
                    GROUP BY category
                    HAVING COUNT(*) > 1)
ORDER BY price DESC, author;


