---------Creación Tabla------------
CREATE TABLE empleados (
emp_id INT NOT NULL,
emp_name VARCHAR2(20) NULL,
emp_lname VARCHAR(50) NULL,
emp_tel NUMBER(11) NULL,
emp_city VARCHAR2(50) NULL,
emp_salary FLOAT NULL,
CONSTRAINT emp_pk PRIMARY KEY (emp_id)
);
---------------------------------------

----Secuencia ID autoincremental que acompaña al siguiente trigger---
CREATE SEQUENCE emp_id MINVALUE 1 START WITH 1 CACHE 10;

--Trigger para id autoincremental--
CREATE OR REPLACE TRIGGER emp_autoID 
BEFORE INSERT ON empleados 
FOR EACH ROW

BEGIN
  SELECT emp_id.NEXTVAL
  INTO   :new.emp_id
  FROM   dual;
END;
-------------------------------------

------Inserts empleados------------------
INSERT INTO empleados p
    (p.emp_name,p.emp_lname,p.emp_tel,p.emp_city,p.emp_salary) 
        VALUES ('Jose','Marti',696288099,'Valencia',1500.0);
INSERT INTO empleados p
    (p.emp_name,p.emp_lname,p.emp_tel,p.emp_city,p.emp_salary) 
        VALUES ('Ana','Sanchez',647586594,'Valencia',1200.0);
----------------------------------------

select * from empleados;
        
Drop table empleados;