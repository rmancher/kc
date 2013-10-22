DELIMITER /

CREATE TABLE IACUC_PROTO_STUDY_GRP_SPECIES ( 
    IACUC_PROTO_STUDY_GRP_SPC_ID DECIMAL(12,0) NOT NULL, 
    PROTOCOL_ID DECIMAL(12,0) NOT NULL, 
    PROTOCOL_DECIMAL VARCHAR(20) NOT NULL, 
    SEQUENCE_DECIMAL DECIMAL(3,0) NOT NULL, 
    SPECIES_CODE DECIMAL(4) NOT NULL,
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR(60) NOT NULL, 
    VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR(36) NOT NULL) 
/


ALTER TABLE IACUC_PROTO_STUDY_GRP_SPECIES 
ADD CONSTRAINT PK_IACUC_PROTO_STD_GRP_SPEC 
PRIMARY KEY (IACUC_PROTO_STUDY_GRP_SPC_ID) 
/

DELIMITER ;
