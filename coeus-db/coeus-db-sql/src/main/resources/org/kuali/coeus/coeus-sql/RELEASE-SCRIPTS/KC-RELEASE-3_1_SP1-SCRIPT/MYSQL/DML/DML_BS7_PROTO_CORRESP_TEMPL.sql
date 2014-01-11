INSERT INTO SEQ_PROTO_CORRESP_TEMPL VALUES (null);
INSERT INTO PROTO_CORRESP_TEMPL(PROTO_CORRESP_TEMPL_ID, PROTO_CORRESP_TYPE_CODE, COMMITTEE_ID, FILE_NAME, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID, CORRESPONDENCE_TEMPLATE)
SELECT LAST_INSERT_ID(), '28', 'DEFAULT', 'DEFAULT-28-AbandonNotice.xsl', STR_TO_DATE('2011-01-27 16:00:14','%Y-%m-%d %k:%i:%s'), 'admin', 1, uuid(),
   (select replace(replace(CORRESPONDENCE_TEMPLATE, 'Withdrawal','Abandon'), 'withdrawn', 'abandoned') from PROTO_CORRESP_TEMPL where PROTO_CORRESP_TYPE_CODE = '16');
   
COMMIT;