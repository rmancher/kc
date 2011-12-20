CREATE TABLE PERSON_MASS_CHANGE_DOCUMENT (
  DOCUMENT_NUMBER   VARCHAR2(40 BYTE) NOT NULL,
  UPDATE_USER       VARCHAR2(60) NOT NULL, 
  UPDATE_TIMESTAMP  DATE NOT NULL, 
  OBJ_ID            VARCHAR2(36) NOT NULL,
  VER_NBR           NUMBER(8,0) DEFAULT 1 NOT NULL
)
/
ALTER TABLE PERSON_MASS_CHANGE_DOCUMENT ADD CONSTRAINT PK_PMC_DOCUMENT
  PRIMARY KEY (DOCUMENT_NUMBER)
/
