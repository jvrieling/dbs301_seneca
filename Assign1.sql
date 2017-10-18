

-- QUESTION 1
select
cust_no, cname, country_cd
from customers
where upper(country_cd) = 'GER';

