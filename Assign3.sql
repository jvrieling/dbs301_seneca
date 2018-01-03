--------------------------------------
--NOTICE:
--  I don't care if you use my work.
--  BUT: Be warned, doing it yourself is REALLY good practice. I highly reccommend it as
--  a method of studying for the test.
--  Use this only as a last resort attempt to submit. Understand the material or you will regret it.
--------------------------------------


--QUESTION 1

DROP TABLE division;
DROP TABLE section;
DROP TABLE warehouse;

CREATE TABLE division (
    division_id number(3,0) NOT NULL,
    division_name varchar(25) NOT NULL UNIQUE,
    CONSTRAINT division_id_pk PRIMARY KEY (division_id)
);
CREATE TABLE warehouse(
    warehouse_id numeric(3,0) NOT NULL PRIMARY KEY,
    city varchar(15) NOT NULL UNIQUE,
    rating char CONSTRAINT warehouse_ck CHECK(rating LIKE'[A-D]'),
    found_date date NOT NULL    
);
CREATE TABLE section(
    warehouse_id numeric(3,0),
    section_id numeric(2,0),
    description varchar(50) NOT NULL,
    capacity numeric(8,0),
    CONSTRAINT section_pk PRIMARY KEY(warehouse_id, section_id),
    CONSTRAINT section_warehouse_id_fk FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id)
    ON DELETE CASCADE
);



--QUESTION 2

ALTER TABLE section
DROP COLUMN mgr_id;
ALTER TABLE section
ADD mgr_id numeric(6,0);
ALTER TABLE section
ADD CONSTRAINT mgr_id_fk FOREIGN KEY(mgr_id) REFERENCES employees(employee_id)
ON DELETE CASCADE;


--QUESTION 3
ALTER TABLE warehouse
DROP CONSTRAINT warehouse_ck;
ALTER TABLE warehouse
ADD CONSTRAINT warehouse_ck CHECK(rating LIKE'[A-DF]');



--QUESTION 4
CREATE SEQUENCE Whse_id_seq
INCREMENT BY 15
START WITH 320
MAXVALUE 900
NOCACHE
NOCYCLE;

-- QUESTION 5
INSERT INTO warehouse
values(
whse_id_seq.NEXTVAL,
'ATLANTA',
null,
sysdate
);

--QUESTION 6
CREATE TABLE CITIES AS
SELECT * FROM locations
WHERE  location_id < 2000;

--QUESTION 7
DESCRIBE cities;

--QUESTION 8
SLECT * FROM cities;

--OUTPUT:
1000	1297 Via Cola di Rie	00989	Roma		IT
1100	93091 Calle della Testa	10934	Venice		IT
1200	2017 Shinjuku-ku	1689	Tokyo	Tokyo Prefecture	JP
1300	9450 Kamiya-cho	6823	Hiroshima		JP
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1600	2007 Zagora St	50090	South Brunswick	New Jersey	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
1900	6092 Boxwood St	YSW 9T2	Whitehorse	Yukon	CA

--QUESTION 9
CREATE OR REPLACE VIEW whssec_man_vu
(warehouse_id, section_id, city, groupz, LName)
AS(
SELECT s.warehouse_id, s.section_id, w.city, d.division_id, e.last_name
FROM section s, employees e, warehouse w, division d
WHERE e.employee_id = s.mgr_id
AND s.warehouse_id = w.warehouse_id
);

--QUESTION 10
SELECT * FROM whssec_man_vu;


--QUESTION 11
ALTER VIEW <viewname>

--The following is not on test 2, but you must do self study on the topic

--QUESTION 12
SELECT city
FROM locations
MINUS
SELECT city
FROM cities;

--13 All the rows in A and all the rows in B with no duplicates is the set operator called 
--[Symbol]  
UNION

--14 All the rows in A and all the rows in B with duplicates [Symbol] 
 UNION ALL

--15 The rows in common to BOTH A and B tables [Symbol] 
INTERSECT 

--16 Rows that are in A but not in B would use the word [Symbol] 
MINUS



