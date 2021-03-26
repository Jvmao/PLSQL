set serveroutput on
set lines 150
set pages 150

DECLARE

    v_inicio    DATE;
    v_fin       DATE;
    total_days  NUMBER;

BEGIN

v_fin := '&f_fin';
v_inicio := '&f_inicio';

    IF (v_fin >= v_inicio) THEN
        select ((to_date(v_fin,'DD/MM/YYYY') - to_date(v_inicio,'DD/MM/YYYY'))+1) into total_days from dual;
        DBMS_OUTPUT.PUT_LINE('Total: ' || total_days || ' días');
    ELSIF (v_fin < v_inicio) THEN
        DBMS_OUTPUT.PUT_LINE('Fecha Inicio no puede ser mayor a Fecha Fin');
    END IF;

    EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(SQLCODE ||' '|| SQLERRM)

END;
/

set lines 150
set pages 150
