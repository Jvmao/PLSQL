SET SERVEROUTPUT ON
SET LINES 200
SET PAGES 200

DECLARE
    --Declaración de Varaibles
    e_name   empleados.emp_name%TYPE;
    e_salary empleados.emp_salary%TYPE;
    e_city   empleados.emp_city%TYPE;
    e_dep    departamentos.dep_name%TYPE;

    CURSOR c1 IS
        SELECT
            e.emp_name,
            e.emp_salary,
            e.emp_city,
            d.dep_name
            INTO
            e_name,
            e_salary,
            e_city,
            e_dep
        FROM empleados e, departamentos d
        WHERE d.dep_id = e.emp_dep
        ORDER BY 2;

BEGIN

    e_name := emp_name;

    DBMS_OUTPUT.PUT_LINE( '---------- Mostrando Datos -----------------' );
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'dd/mm/yyyy'));

    FOR f1 IN c1
    LOOP
        DBMS_OUTPUT.PUT_LINE( '********** EMPLEADO **********' );

        DBMS_OUTPUT.PUT_LINE('Datos Empleado: '
            || ' ' ||to_char(f1.emp_name)
            || ' ' ||to_char(f1.emp_salary)
            || ' ' ||to_char(f1.emp_city)
            || ' ' ||to_char(f1.dep_name));

        DBMS_OUTPUT.PUT_LINE( '******************************' );
    END LOOP f1;

    EXCEPTION
     WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('DATOS NO ENCONTRADOS!');
     WHEN TOO_MANY_ROWS THEN
         DBMS_OUTPUT.PUT_LINE('SE ENCONTRO MAS DE UNA FILA!');
     WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001,' ERROR DESCONOCIDO ');

END;
/
