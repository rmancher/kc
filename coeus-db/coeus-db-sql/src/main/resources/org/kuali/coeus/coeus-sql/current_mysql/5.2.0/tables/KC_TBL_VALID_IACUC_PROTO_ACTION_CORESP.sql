DELIMITER /

CREATE TABLE VALID_IACUC_PROTO_ACT_CORESP ( 
    VALID_IACUC_PROT_ACT_CORSP_ID DECIMAL(12,0) NOT NULL, 
    PROTOCOL_ACTION_TYPE_CODE VARCHAR(3) NOT NULL, 
    PROTO_CORRESP_TYPE_CODE VARCHAR(3) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR(60) NOT NULL, 
    FINAL_FLAG VARCHAR(1), 
    VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR(36) NOT NULL)
/


ALTER TABLE VALID_IACUC_PROTO_ACT_CORESP 
ADD CONSTRAINT VALID_IACUC_PROTO_ACT_CORSP_PK 
PRIMARY KEY (VALID_IACUC_PROT_ACT_CORSP_ID)
/

DELIMITER ;