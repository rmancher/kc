CREATE OR REPLACE PROCEDURE UPD_S2S_SUB_ATTACHMENT (
	   AV_CONTENT_ID 		  		IN	OSP$S2S_APP_ATTACHMENTS.CONTENT_ID%TYPE :=NULL,
	   AV_PROPOSAL_NUMBER 			IN 	OSP$S2S_APP_ATTACHMENTS.PROPOSAL_NUMBER%TYPE :=NULL,
	   AV_HASH_CODE					IN	OSP$S2S_APP_ATTACHMENTS.HASH_CODE%TYPE :=NULL,
	   AV_CONTENT_TYPE				IN	OSP$S2S_APP_ATTACHMENTS.CONTENT_TYPE%TYPE :=NULL,
	   AV_UPDATE_TIMESTAMP			IN	OSP$S2S_APP_ATTACHMENTS.UPDATE_TIMESTAMP%TYPE :=NULL,
	   AV_UPDATE_USER				IN	OSP$S2S_APP_ATTACHMENTS.UPDATE_USER%TYPE :=NULL,
	   AW_CONTENT_ID 		  		IN	OSP$S2S_APP_ATTACHMENTS.CONTENT_ID%TYPE :=NULL,
	   AW_PROPOSAL_NUMBER	  		IN	OSP$S2S_APP_ATTACHMENTS.PROPOSAL_NUMBER%TYPE :=NULL,
	   AW_UPDATE_TIMESTAMP			IN	OSP$S2S_APP_ATTACHMENTS.UPDATE_TIMESTAMP%TYPE :=NULL,
	   AC_TYPE IN CHAR )


IS
    DATA_CHANGED    EXCEPTION;

BEGIN

  IF AC_TYPE = 'I' THEN
    BEGIN
    INSERT INTO OSP$S2S_APP_ATTACHMENTS (
		CONTENT_ID,
		PROPOSAL_NUMBER,
		HASH_CODE,
		CONTENT_TYPE,
		UPDATE_TIMESTAMP,
		UPDATE_USER)
    VALUES (
		AV_CONTENT_ID,
		AV_PROPOSAL_NUMBER,
		AV_HASH_CODE,
		AV_CONTENT_TYPE,
		AV_UPDATE_TIMESTAMP,
		AV_UPDATE_USER) ;
    END;
  ELSIF AC_TYPE = 'U' THEN
    UPDATE OSP$S2S_APP_ATTACHMENTS SET
		CONTENT_ID = AV_CONTENT_ID,
		PROPOSAL_NUMBER = AV_PROPOSAL_NUMBER,
		HASH_CODE = AV_HASH_CODE,
		CONTENT_TYPE = AV_CONTENT_TYPE,
		UPDATE_TIMESTAMP = AV_UPDATE_TIMESTAMP,
		UPDATE_USER = AV_UPDATE_USER
    WHERE
      CONTENT_ID = AW_CONTENT_ID AND
      PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER AND
      UPDATE_TIMESTAMP = AW_UPDATE_TIMESTAMP ;

    IF SQL%NOTFOUND THEN
      RAISE DATA_CHANGED;
    END IF;
  END IF;
EXCEPTION
  WHEN DATA_CHANGED THEN
    RAISE_APPLICATION_ERROR(-20100, 'DATA CHANGED BETWEEN RETRIEVE AND UPDATE');

END;
/
