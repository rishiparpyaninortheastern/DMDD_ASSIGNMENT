--------------------------------------------------------
--  DDL for Procedure REGISTER_CUSTOMER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."REGISTER_CUSTOMER" (  ---------------CREATING THE PROCEDURE FOR REGISTERING----------------------
p_CUSTNAME IN CUSTOMER.CUST_NAME%TYPE,
p_CUSTCONTACT IN CUSTOMER.CUST_CONTACT%TYPE,
p_CUSTEMAIL IN CUSTOMER.CUST_EMAIL%TYPE,
p_CUSTACCOUNTNO IN CUSTOMER.CUST_ACCOUNTNO%TYPE,
p_ADDR IN CUSTOMER.ADDR%TYPE, -------------------------------------------------EXPECTED TO BE THE NAME OF THE COUNTRY, SP INSERTS CORRESPONDING ID INTO CUSTOMER TABLE AFTER LOOKUP--
------p_BUYINGPOWER IN CUSTOMER.CUST_BUYINGPOWER%TYPE,
------p_CUSTUSERNAME IN CUSTOMER.CUST_USERNAME%TYPE,
p_CUSTPASSWORD IN CUSTOMER.CUST_PASSWORD%TYPE)

AS
e_invalid_CONTACT EXCEPTION;
e_invalid_PASSWORD EXCEPTION;
CONTACTLENGTH NUMBER(10);
PASSWORD_LENGTH NUMBER(12);
max_ID NUMBER(10);
addresscode varchar(30);
ERR NUMBER(10);
p_BUYINGPOWER NUMBER(10);
p_USERNAME VARCHAR(10);
p_user varchar(50);


BEGIN

	SELECT LENGTH(p_CUSTPASSWORD) INTO PASSWORD_LENGTH FROM DUAL;----------PASSWORD VALIDATION
	IF 
	(PASSWORD_LENGTH<12)
	THEN
	RAISE e_invalid_PASSWORD;
	END IF;



	SELECT LENGTH(p_CUSTCONTACT) INTO CONTACTLENGTH FROM DUAL; ------------CONTACT NO. VALIDATION
	IF
	(CONTACTLENGTH <> 10)
	THEN
	RAISE
	e_invalid_CONTACT;
	END IF;

	-------------------GENERATING THE CUSTOMERID-------------
	select (MAX(CUST_ID)+1) into max_ID from CUSTOMER;

	----------------GENERATING ADDRESS CODE FROM COUNTRY NAME----------------------

    ERR:=1;
	SELECT ADDR_CODE INTO addresscode FROM ADDRESS WHERE UPPER(ADDR_PROVINCE)= UPPER(p_ADDR);


    SELECT TRIM(SUBSTR(p_CUSTNAME,1,5)) || max_ID INTO p_user from DUAL;



    p_BUYINGPOWER:=100;

	-----------INSERTING VALUES INTO THE TABLE--------------------
	INSERT INTO CUSTOMER (CUST_ID, CUST_NAME,CUST_CONTACT,CUST_EMAIL, CUST_ACCOUNTNO, ADDR, CUST_BUYINGPOWER, CUST_USERNAME,CUST_PASSWORD)
	VALUES(max_ID, p_CUSTNAME, p_CUSTCONTACT, p_CUSTEMAIL, p_CUSTACCOUNTNO, addresscode, 100 ,p_user, p_CUSTPASSWORD );

    COMMIT;

    dbms_output.put_line('Customer Registration start');
    
    EXECUTE IMMEDIATE 'CREATE USER ' || p_user || ' IDENTIFIED BY ' || p_CUSTPASSWORD;
    EXECUTE IMMEDIATE 'GRANT DB_CUSTOMERS TO ' || p_user;

    ---SELECT CUST_USERNAME INTO p_USERNAME FROM CUSTOMER WHERE CUST_ID=max_ID;


    dbms_output.put_line('Customer Registration Complete');
    dbms_output.put_line('Your User Name is ' || p_user);

EXCEPTION WHEN
e_invalid_CONTACT ---------------------INVALID CONTACT
THEN
dbms_output.put_line('PLEASE ENTER A VALID CONTACT NUMBER');

WHEN
e_invalid_PASSWORD------------------------------INVALID PASSWORD
THEN
dbms_output.put_line('Length of password is less than 12. Enter a valid password.');

WHEN NO_DATA_FOUND THEN--------------------INVALID ADDRESS
 IF ERR=1 THEN
    DBMS_OUTPUT.PUT_LINE('INVALID LOCATION ENTERED');
  END IF; 


END;

/

