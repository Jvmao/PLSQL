create table departamentos(
dep_id int not null Primary Key,
dep_name varchar2(50)
);

----Secuencia ID autoincremental que acompaña al siguiente trigger---
CREATE SEQUENCE dep_id MINVALUE 100 START WITH 100 CACHE 10;

--Trigger para id autoincremental--
CREATE OR REPLACE TRIGGER dep_autoID
BEFORE INSERT ON departamentos
FOR EACH ROW

BEGIN
  SELECT dep_id.NEXTVAL
  INTO   :new.dep_id
  FROM   dual;
END;
-------------------------------------

ALTER TABLE empleados DROP column emp_dep;
ALTER TABLE empleados ADD emp_dep INT;
ALTER TABLE empleados ADD bonus FLOAT;

ALTER TABLE empleados ADD CONSTRAINT fk_empDep FOREIGN KEY (emp_dep) REFERENCES departamentos(dep_id);

select * from empleados;
select * from departamentos;

insert into departamentos d (d.dep_name) values ('Desarrollo');
insert into departamentos d (d.dep_name) values ('Contabilidad');
insert into departamentos d (d.dep_name) values ('Ventas');
insert into departamentos d (d.dep_name) values ('Dirección');
insert into departamentos d (d.dep_name) values ('Administración');
insert into departamentos d (d.dep_name) values ('RRHH');

update empleados e set e.emp_dep=101 where e.emp_id=2;



select e.emp_name,e.emp_lname,e.emp_city,e.emp_dep,d.dep_name from Empleados e
    inner join departamentos d on e.emp_dep=d.dep_id order by e.emp_dep ASC;

insert all
  into Empleados
    (empleados.emp_name,empleados.emp_lname,empleados.emp_tel,empleados.emp_city,empleados.emp_salary,empleados.emp_dep)
    values('Kevin','Hoyuelos',632745385,'Madrid',1450,103)
   into Empleados
    (empleados.emp_name,empleados.emp_lname,empleados.emp_tel,empleados.emp_city,empleados.emp_salary,empleados.emp_dep)
    values('Lela','Star',656537622,'Madrid',2000,106)
select * from dual;

update empleados e set e.emp_salary=2500 where e.emp_name='Laura';
select avg(e.emp_salary) as Average from empleados e;
