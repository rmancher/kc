DELIMITER /
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' and NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Time And Money Document' and NMSPC_CD = 'KC-T'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1,
(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' and NMSPC_CD = 'KC-AWARD'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Open Time And Money Document' and NMSPC_CD = 'KC-T'), 'Y')
/
DELIMITER ;
