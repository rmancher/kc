CREATE TABLE COMMENT_TYPE ( 
	COMMENT_TYPE_CODE				NUMBER(3,0) constraint COMMENT_TYPEN0 NOT NULL ENABLE,
	DESCRIPTION					VARCHAR2(200) constraint COMMENT_TYPEN1 NOT NULL ENABLE,
	TEMPLATE_FLAG				VARCHAR2(1) constraint COMMENT_TYPEN2 NOT NULL ENABLE,
	CHECKLIST_FLAG				VARCHAR2(1) constraint COMMENT_TYPEN3 NOT NULL ENABLE,
	AWARD_COMMENT_SCREEN_FLAG	VARCHAR2(1) constraint COMMENT_TYPEN4 NOT NULL ENABLE,
    UPDATE_TIMESTAMP       		DATE constraint COMMENT_TYPEN5 NOT NULL ENABLE,
    UPDATE_USER            		VARCHAR2(60) constraint COMMENT_TYPEN6 NOT NULL ENABLE,
    VER_NBR 					NUMBER(8,0) DEFAULT 1  constraint COMMENT_TYPEN7 NOT NULL ENABLE,
	OBJ_ID 						VARCHAR2(36) DEFAULT SYS_GUID()  constraint COMMENT_TYPEN8 NOT NULL ENABLE,
    CONSTRAINT PK_COMMENT_TYPE PRIMARY KEY(COMMENT_TYPE_CODE) ENABLE
)