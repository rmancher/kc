CREATE TABLE PROTOCOL_ATTACHMENT_TYPE_GROUP (
    TYPE_GROUP_ID NUMBER (12, 0) NOT NULL ENABLE, 
    TYPE_CD VARCHAR2 (3) NOT NULL ENABLE, 
    GROUP_CD VARCHAR2 (3) NOT NULL ENABLE, 
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL ENABLE, 
    OBJ_ID VARCHAR2 (36) DEFAULT SYS_GUID () NOT NULL ENABLE, 
    UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
    UPDATE_USER VARCHAR2 (10) NOT NULL ENABLE) ;

ALTER TABLE PROTOCOL_ATTACHMENT_TYPE_GROUP 
    ADD CONSTRAINT PK_PROTOCOL_ATTACH_TYPE_GROUP 
            PRIMARY KEY (TYPE_GROUP_ID) ;