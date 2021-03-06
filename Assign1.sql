SET PAGESIZE 100;

-- QUESTION 1
select
cust_no, cname, country_cd
from customers
where upper(country_cd) = 'GER';

--Question 2
select
cust_no
from customers
where cname = 'Ultra Sports 5';

--Question 3
select
c.cust_no,
c.cname,
ol.order_no
from customers c, orderlines ol, orders o
where o.order_no = ol.order_no
and o.cust_no = c.cust_no
and ol.prod_no = 40303
order by 1;

--Question 4
select
COUNT(*)
from orderlines
where prod_no = 40302;

--Question 5
select
c.cust_no, c.cname, o.order_no, p.prod_name, ol.price*ol.qty as TOTAL
from customers c, orders o, products p, orderlines ol
where o.cust_no = c.cust_no
and ol.order_no = o.order_no
and p.prod_no = ol.prod_no
and c.country_cd = 'UK'
and upper(c.city) like 'L%'
and o.order_no < 75
order by c.cust_no desc;

--Question 6
select
count(country_id)
from countries;

--Question 7
select
c.cname, ol.order_no, price*qty as TOTAL
from orderlines ol, orders o, customers c
where ol.order_no = o.order_no
and o.cust_no = c.cust_no
and upper(c.city) = 'LONDON'
order by o.order_no;

--Question 8
select
employee_id, cast(last_name || ' ' || first_name as varchar(25)) as "Full Name",
job_id, to_char(hire_date, 'Month ddth "of year" yyyy') as "Start Date"
from employees
--NOTE: I can't use MONTH() or YEAR() Functions! It just says invalid identifier...
--And using upper(to_char()) = 'MAY' doesn't work either...
where (to_char(hire_date, 'Month') like 'May%'
or to_char(hire_date, 'Month') like 'June%'
or to_char(hire_date, 'Month') like 'July%'
or to_char(hire_date, 'Month') like 'August%'
or  to_char(hire_date, 'Month') like 'December%')
order by hire_date;

--Question 9
select
'Employee ' || employee_id || ' named ' ||
cast(last_name || ' ' || first_name as varchar(25)) ||
' with Job ID of '  || job_id || ' will have new salary of ' || 
case
    when upper(job_id) like '%_MAN' then salary*1.3
    when upper(job_id) like '%_VP' then salary*1.2
end as "Employees with Increased Pay"
from employees
where salary/12 not between 6000 and 11000
and (job_id like '%_MAN'
or job_id like '%_VP')
order by salary;

--Question 10
select last_name, job_id, salary, country_id
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where country_id != 'US' and
(job_id not like '%VP' or job_id not like '%PRES')
and salary > (select min(salary)
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where country_id = 'CA') 
and salary > (select min(salary)
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where country_id = 'UK')
order by job_id;

--Another Answer for 10
select e.last_name, e.job_id, e.salary
from employees e join departments d
on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where l.country_id != 'US'
and (job_id not like '%VP'
and job_id not like '%PRES')
--SUBQUERY for minimum salary in UK 
and salary < (select min(salary) 
from employees e join departments d
on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'UK')
--------------------------------
--SUBQUERY for min salary in CA
and salary < (Select min(salary)
from employees e join departments d
on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'CA')
----------------------------
order by job_id;


--Question 11
select last_name, salary, job_id
from employees
where (upper(job_id) like 'IT_%'
or upper(job_id) like 'AC_%'
or upper(job_id) like 'MK_%')
and salary > (select min(salary) 
from employees
where department_id = 50)
order by last_name;

