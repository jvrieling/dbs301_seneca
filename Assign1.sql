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
