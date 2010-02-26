-- View for Coeus compatibility  
CREATE OR REPLACE VIEW OSP$CORRESP_BATCH_DETAIL AS 
SELECT BATCH_CORRESPONDENCE_TYPE_CODE AS CORRESP_BATCH_TYPE_CODE,
       CORRESPONDENCE_NUMBER,
       PROTO_CORRESP_TYPE_CODE,
       NO_OF_DAYS_TILL_NEXT,
       UPDATE_TIMESTAMP,
       UPDATE_USER
FROM   BATCH_CORRESPONDENCE_DETAIL;