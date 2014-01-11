DELIMITER /
INSERT INTO KRIM_TYP_ID_BS_S VALUES(NULL)
/
-- create new role type
INSERT INTO KRIM_TYP_T (KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
VALUES( (SELECT (MAX(ID)) FROM KRIM_TYP_ID_BS_S), UUID(), 1, 'Derived Role: IRB Correspondent', 'irbCorrespondentDerivedRoleTypeService', 'Y', 'KC-PROTOCOL')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- create new role
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'Unit Correspondent', 'KC-PROTOCOL', 'The Unit Correspondent role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE SRVC_NM = 'irbCorrespondentDerivedRoleTypeService'), 'Y', NOW())
/
COMMIT
/
DELIMITER ;
