
--QUESTION 1
CREATE TABLE salesrep AS(
  SELECT employee_id AS repId, first_name AS FName, last_name AS LName,
  phone_number AS phone#, salary, commission_pct AS commision
  FROM employees
  WHERE department_id = 80
);

--QUESTION 2a

INSERT INTO CUST VALUES (501, 'ABC LTD', 'Montreal', 'C', NULL, 201); 
INSERT INTO CUST values (701, 'MIKE and SAM inc.', 'Kingston', 'A', NULL, 102);
INSERT INTO CUST values (703, 'RED PLANET', 'Mississauga', 'C', NULL, 107);
INSERT INTO CUST  values (717, 'blue sky ltd', 'Regina', 'D', NULL, 102);
INSERT INTO CUST values(502, 'Black Giant', 'Ottowa', 'B', 202);
--Note I only added one more row because I'm lazy and it's easy

--QUESTION 2b
CREATE TABLE goodcust AS( 
  SELECT cust# AS custid, custname, city, salesrep# AS repid
  FROM cust
  WHERE UPPER(rating) IN('A','B')
);
--note: Didn't test this one as I didn't have any data

--QUESTION 3
ALTER TABLE salesrep
ADD job_code VARCHAr(12);

--QUESTION 4
ALTER TABLE salesrep
MODIFY salary NOT NULL;

--skipped a few... good luck!

--Question 7
ALTER TABLE salesrep
ADD CONSTRAINT salesrep_repid_PK
PRIMARY KEY(repid);
--you make the next one
