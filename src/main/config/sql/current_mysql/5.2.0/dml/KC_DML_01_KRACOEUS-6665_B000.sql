DELIMITER /
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
insert into VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID) 
values ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'PerformanceSite_2_0',40,null,NOW(),'admin',UUID())
/

DELIMITER ;
