DELIMITER /
ALTER TABLE IACUC_PROC_PERSON_RESPONSIBLE 
ADD CONSTRAINT FK_IACUC_PROTO_PERSON_RESPONSI 
FOREIGN KEY (IACUC_PROTOCOL_STUDY_GROUPS_ID) 
REFERENCES IACUC_PROTOCOL_STUDY_GROUPS (IACUC_PROTOCOL_STUDY_GROUPS_ID)
/


DELIMITER ;