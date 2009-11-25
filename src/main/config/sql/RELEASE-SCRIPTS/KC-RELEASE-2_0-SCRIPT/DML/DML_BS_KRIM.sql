-- Statements are order dependent, do not reorder.
-- Questionnaire Permission 7 statments
INSERT INTO KRIM_PERM_TMPL_T (PERM_TMPL_ID, NM, DESC_TXT, KIM_TYP_ID, ACTV_IND, NMSPC_CD, OBJ_ID) 
VALUES (KRIM_PERM_TMPL_ID_S.nextVal, 'Questionnaire Permission', 'Modify/View Questionnaire', 3, 'Y', 'KC-IDM', SYS_GUID());

INSERT INTO KRIM_PERM_T (PERM_ID, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD, OBJ_ID) 
VALUES (KRIM_PERM_ID_S.nextVal, KRIM_PERM_TMPL_ID_S.currVal, 'Modify Questionnaire', null, 'Y', 'KC-QUESTIONNAIRE', SYS_GUID());

INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID) 
VALUES (KRIM_ROLE_PERM_ID_S.nextval, 1119, KRIM_PERM_ID_S.currVal, 'Y', SYS_GUID());

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES(KRIM_ATTR_DATA_ID_S.NEXTVAL, SYS_GUID(), '1', KRIM_PERM_ID_S.currVal, '3', '13', 'QuestionnaireMaintenanceDocument') ;


INSERT INTO KRIM_PERM_T (PERM_ID, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD, OBJ_ID) 
VALUES (KRIM_PERM_ID_S.nextVal, KRIM_PERM_TMPL_ID_S.currVal, 'View Questionnaire', null, 'Y', 'KC-QUESTIONNAIRE', SYS_GUID());

INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID) 
VALUES (KRIM_ROLE_PERM_ID_S.nextval, 1120, KRIM_PERM_ID_S.currVal, 'Y', SYS_GUID());

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES(KRIM_ATTR_DATA_ID_S.NEXTVAL, SYS_GUID(), '1', KRIM_PERM_ID_S.currVal, '3', '13', 'QuestionnaireMaintenanceDocument') ;

--Proposal Hierarchy Permission 2 statements
INSERT INTO KRIM_PERM_T (PERM_ID, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT, OBJ_ID)
VALUES(KRIM_PERM_ID_S.NEXTVAL, 1000, 'KRA-PD', 'Maintain ProposalHierarchy', 'Create, modify and synchronize ProposalHierarchies', SYS_GUID () ) ;

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, OBJ_ID)
VALUES(KRIM_ROLE_PERM_ID_S.NEXTVAL, 1109, KRIM_PERM_ID_S.CURVAL, SYS_GUID () ) ;

-- Print Proposal Permission 1 statement
UPDATE krim_perm_t 
SET NM='PRINT_PROPOSAL' 
WHERE NM = 'Print Proposal';