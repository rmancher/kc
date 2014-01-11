CREATE TABLE IACUC_ALT_SEARCH_DB ( 
    ALT_SEARCH_DB_CODE NUMBER(4,0) NOT NULL, 
    ALT_SEARCH_DB_NAME VARCHAR2(2000) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL    
) 
/

ALTER TABLE IACUC_ALT_SEARCH_DB 
ADD CONSTRAINT PK_IACUC_ALT_SEARCH_DB 
PRIMARY KEY (ALT_SEARCH_DB_CODE) 
/
