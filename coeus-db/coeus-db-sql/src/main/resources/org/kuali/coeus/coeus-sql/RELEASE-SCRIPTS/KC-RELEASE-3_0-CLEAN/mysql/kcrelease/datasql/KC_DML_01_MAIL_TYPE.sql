delimiter /
TRUNCATE TABLE MAIL_TYPE
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Regular','admin',NOW(),UUID(),1)
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Electronic','admin',NOW(),UUID(),1)
/
INSERT INTO MAIL_TYPE (MAIL_TYPE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Delivery Service','admin',NOW(),UUID(),1)
/
delimiter ;
