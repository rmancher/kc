DELIMITER /

INSERT INTO COI_NOTE_TYPE ( NOTE_TYPE_CODE, SORT_ID, DESCRIPTION, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID )
VALUES ( '1', 1, 'PI Entry', 'Y', NOW(), 'admin', 1, UUID() )
/
INSERT INTO COI_NOTE_TYPE ( NOTE_TYPE_CODE, SORT_ID, DESCRIPTION, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID )
VALUES ( '2', 2, 'Reviewer Comment', 'Y', NOW(), 'admin', 1, UUID() )
/
INSERT INTO COI_NOTE_TYPE ( NOTE_TYPE_CODE, SORT_ID, DESCRIPTION, ACTIVE_FLAG, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID )
VALUES ( '3', 3, 'COI Officer', 'Y', NOW(), 'admin', 1, UUID() )
/

DELIMITER ;