-- Table Script 
CREATE TABLE PROPOSAL_LOG ( 
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL, 
    PROPOSAL_TYPE_CODE VARCHAR2(3) NOT NULL, 
    TITLE VARCHAR2(200) NOT NULL, 
    PI_ID VARCHAR2(9),
    ROLODEX_ID NUMBER (6, 0), 
    PI_NAME VARCHAR2(90), 
    LEAD_UNIT VARCHAR2(8) NOT NULL,
    PROPOSAL_LOG_TYPE_CODE VARCHAR2 (3),
    FISCAL_MONTH NUMBER (2, 0),
    FISCAL_YEAR NUMBER (4, 0), 
    SPONSOR_CODE CHAR(6), 
    SPONSOR_NAME VARCHAR2(200), 
    LOG_STATUS VARCHAR2 (3) NOT NULL, 
    COMMENTS VARCHAR2(300), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    DEADLINE_DATE DATE, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE PROPOSAL_LOG 
ADD CONSTRAINT PK_PROPOSAL_LOG 
PRIMARY KEY (PROPOSAL_NUMBER);

