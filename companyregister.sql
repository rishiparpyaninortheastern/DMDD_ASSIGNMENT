create or replace procedure companyregister (COMPANY_NAMEI IN VARCHAR2, CONTACTI IN NUMBER, PWD in VARCHAR2)
AS
CONTACTNO number;
COMPANYNAME varchar2(100);
COMAPNYID number(10);
P_SECTYPE VARCHAR2(20);
e_invalid_CONTACT EXCEPTION;
e_invalid_PASSWORD EXCEPTION;
c_pwd varchar2(50);
max_ID NUMBER(10);
p_user varchar2(50);
BEGIN

SELECT LENGTH(CONTACTI) INTO CONTACTNO FROM DUAL;
IF
(CONTACTNO<10 AND CONTACTNO>10)
THEN
RAISE
e_invalid_CONTACT;
END IF;


SELECT LENGTH(PWD) INTO c_pwd FROM DUAL;----------PASSWORD VALIDATION
	IF 
	(c_pwd<12)
	THEN
	RAISE e_invalid_PASSWORD;
	END IF;

        -------------------GENERATING THE CompanyId-------------
		select (MAX(Company_Id)+1) into max_ID from Company;

        SELECT SUBSTR(REPLACE(COMPANY_NAMEI,' ',''),1,5) || max_ID INTO p_user from DUAL;

        INSERT INTO COMPANY VALUES(max_ID,COMPANY_NAMEI,CONTACTI,PWD,p_user);
        COMMIT;

         EXECUTE IMMEDIATE 'CREATE USER ' || p_user || ' IDENTIFIED BY ' || PWD;
         EXECUTE IMMEDIATE 'GRANT COMP_ROLE TO ' || p_user;

        dbms_output.put_line('Company Registration Complete');
        dbms_output.put_line('User Name is ' || p_user);
        dbms_output.put_line('*********************************************************************************');
        dbms_output.put_line('Kindly complete your company setup by providing additional details for your company');
        dbms_output.put_line('');

        dbms_output.put_line('*********************************************************************************');
        dbms_output.put_line('Choose from below list ');
FOR SECTYPE IN 
          (
            SELECT SECURITYTYPE_DESC  FROM securitytype 
          )
          LOOP
            dbms_output.put_line(SECTYPE.SECURITYTYPE_DESC);
          END LOOP;

            dbms_output.put_line('***********************************************');
        dbms_output.put_line('Choose THE STOCK EXCHANGE FROM BELOW ');
        dbms_output.put_line('---------------------------------------------------------');
FOR EXCHANGE IN 
          (
            SELECT EXCHANGE_NAME  FROM stockexchange 
          )
          LOOP
            dbms_output.put_line(EXCHANGE.EXCHANGE_NAME);
          END LOOP;         

dbms_output.put_line('Please execute the below SP in an anonymous block');
dbms_output.put_line('ADD_SECURITY(''<COMPANYNAME>'',''<SECURITYTYPE>'',''<EXCHANGE>'')');     

EXCEPTION
WHEN 
e_invalid_CONTACT THEN
dbms_output.put_line('Invalid contact number entered');

WHEN
e_invalid_PASSWORD------------------------------INVALID PASSWORD
THEN
dbms_output.put_line('Length of password is less than 12. Enter a valid password.');

END;