CREATE TABLE KC_KRMS_TERM_FUNCTION (
	KC_KRMS_TERM_FUNCTION_ID NUMBER(12,0),
	KRMS_TERM_NM VARCHAR2(60),	
	DESCRIPTION VARCHAR2(200) NOT NULL,
	RETURN_TYPE VARCHAR2(100) default 'java.lang.String' NOT NULL ,
	FUNCTION_TYPE VARCHAR2(3),
	UPDATE_TIMESTAMP DATE NOT NULL,
	UPDATE_USER VARCHAR2(60) NOT NULL,
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL)
/

ALTER TABLE KC_KRMS_TERM_FUNCTION 
ADD CONSTRAINT PK_KC_KRMS_TERM_FUNCTION 
PRIMARY KEY (KC_KRMS_TERM_FUNCTION_ID)
/
