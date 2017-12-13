--------------------------------------
--NOTICE:
--  I don't care if you use my work.
--  BUT: Be warned, doing it yourself is REALLY good practice. I highly reccommend it as
--  a method of studying for the test.
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
