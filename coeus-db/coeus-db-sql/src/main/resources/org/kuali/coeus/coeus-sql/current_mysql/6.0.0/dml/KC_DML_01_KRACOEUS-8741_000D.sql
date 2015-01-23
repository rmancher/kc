DELIMITER /

UPDATE QUESTIONNAIRE_USAGE 
   SET IS_MANDATORY = 'N'
   WHERE QUESTIONNAIRE_LABEL = 'Generic Demo Questionnaire' AND 
         MODULE_ITEM_CODE = (SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal')
/

DELIMITER ;
