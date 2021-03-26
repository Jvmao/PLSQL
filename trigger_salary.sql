--Trigger para id autoincremental--
CREATE OR REPLACE TRIGGER bonus_emp 
AFTER INSERT OR UPDATE OF bonus ON empleados
FOR EACH ROW
    
DECLARE
    --Declaramos las variables--
    newSalary float;
    bonusValue float;
    noBonus varchar2(100);

BEGIN
    --Iniciamos las variables---
    bonusValue := 0.10;
    noBonus := 'Sin Bonus';
    
  ---Condición que se debe de cumplir---
  IF (:old.emp_salary >= 1500) THEN
        --newSalary := (empleados.emp_salary*empleados.bonus)+empleados.emp_salary;
        newSalary := (old.emp_salary*old.bonusValue)+old.emp_salary;
        ----UPDATE SALARY-----
        UPDATE empleados SET bonus =:newsalary where emp_id=:old.emp_id;
        DBMS_OUTPUT.PUT_LINE('Salary Updated!!!');
  ELSIF (:old.emp_salary < 1500) THEN
       DBMS_OUTPUT.PUT_LINE(noBonus);
       UPDATE empleados SET bonus = 0.00 where emp_id=old.emp_id;
  ELSE
        raise_application_error(-20001,'Something went wrong!!');
  END IF; 
  ------------------------------------------------------     
  
  
END;