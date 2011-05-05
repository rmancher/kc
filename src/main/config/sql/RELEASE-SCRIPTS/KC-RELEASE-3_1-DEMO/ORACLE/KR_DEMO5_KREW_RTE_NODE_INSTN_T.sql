--REM INSERTING into KREW_RTE_NODE_INSTN_T
INSERT INTO KREW_RTE_NODE_INSTN_T (RTE_NODE_INSTN_ID,DOC_HDR_ID,RTE_NODE_ID,BRCH_ID,ACTV_IND,CMPLT_IND,INIT_IND,VER_NBR) 
VALUES (3672,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'New Questionnaire - IRB Long V1 '),4171,3671,0,1,0,5)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID) 
VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'New Questionnaire - IRB Long V1 '),3672)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (RTE_NODE_INSTN_ID,DOC_HDR_ID,RTE_NODE_ID,BRCH_ID,ACTV_IND,CMPLT_IND,INIT_IND,VER_NBR) 
VALUES (3676,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'New Questionnaire - IRB Short V1 '),4171,3675,0,1,0,5)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID) 
VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'New Questionnaire - IRB Short V1 '),3676)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (RTE_NODE_INSTN_ID,DOC_HDR_ID,RTE_NODE_ID,BRCH_ID,ACTV_IND,CMPLT_IND,INIT_IND,VER_NBR) 
VALUES (3680,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Edit Questionnaire - IRB Long V2 '),4171,3679,0,1,0,5)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID) 
VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Edit Questionnaire - IRB Long V2 '),3680)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (RTE_NODE_INSTN_ID,DOC_HDR_ID,RTE_NODE_ID,BRCH_ID,ACTV_IND,CMPLT_IND,INIT_IND,VER_NBR) 
VALUES (3684,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Edit Questionnaire - IRB Long V2 '),4130,3683,0,1,0,13)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID) 
VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Edit Questionnaire - IRB Long V2 '),3684)
/

--REM PROTOCOL STAGE DATA
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4218,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - Pending/In Prog'),0,2927,4219,5)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - Pending/In Prog'),4219)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4220,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - Withdrawn'),0,2927,4221,9)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - Withdrawn'),4221)
/

INSERT INTO KREW_RTE_BRCH_T (INIT_RTE_NODE_INSTN_ID,NM,RTE_BRCH_ID,VER_NBR)
  VALUES (4223,'PRIMARY',4222,23)
/
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4222,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000019'),0,2945,4223,6)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000019'),4223)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4220,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - Withdrawn'),0,2929,4224,4)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4222,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000019'),0,2946,4225,4)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4222,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000019'),0,2947,4226,4)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4227,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SMRR' AND DOC_HDR_STAT_CD = 'X'),0,2927,4228,12)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SMRR' AND DOC_HDR_STAT_CD = 'X'),4228)
/

INSERT INTO KREW_RTE_BRCH_T (INIT_RTE_NODE_INSTN_ID,NM,RTE_BRCH_ID,VER_NBR)
  VALUES (4230,'PRIMARY',4229,23)
/
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4229,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000028'),0,2945,4230,6)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000028'),4230)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4229,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000028'),0,2946,4231,4)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4227,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SMRR' AND DOC_HDR_STAT_CD = 'X'),0,2929,4232,7)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4229,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000028'),0,2947,4233,4)
/

INSERT INTO KREW_RTE_BRCH_T (INIT_RTE_NODE_INSTN_ID,NM,RTE_BRCH_ID,VER_NBR)
  VALUES (4235,'PRIMARY',4234,14)
/
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4234,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SMRR' AND DOC_HDR_STAT_CD = 'S'),0,2927,4235,7)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SMRR' AND DOC_HDR_STAT_CD = 'S'),4235)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4236,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SRR' AND DOC_HDR_STAT_CD = 'X'),0,2927,4237,12)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SRR' AND DOC_HDR_STAT_CD = 'X'),4237)
/

INSERT INTO KREW_RTE_BRCH_T (INIT_RTE_NODE_INSTN_ID,NM,RTE_BRCH_ID,VER_NBR)
  VALUES (4239,'PRIMARY',4238,23)
/
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4238,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000049'),0,2945,4239,6)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000049'),4239)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4236,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SRR' AND DOC_HDR_STAT_CD = 'X'),0,2929,4240,7)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (0,4238,1,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000049'),0,2946,4241,4)
/

INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4238,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol Review - Researcher/Protocol# 1009000049'),0,2947,4242,4)
/

INSERT INTO KREW_RTE_BRCH_T (INIT_RTE_NODE_INSTN_ID,NM,RTE_BRCH_ID,VER_NBR)
  VALUES (4244,'PRIMARY',4243,14)
/
INSERT INTO KREW_RTE_NODE_INSTN_T (ACTV_IND,BRCH_ID,CMPLT_IND,DOC_HDR_ID,INIT_IND,RTE_NODE_ID,RTE_NODE_INSTN_ID,VER_NBR)
  VALUES (1,4243,0,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SRR' AND DOC_HDR_STAT_CD = 'S'),0,2927,4244,7)
/
INSERT INTO KREW_INIT_RTE_NODE_INSTN_T (DOC_HDR_ID,RTE_NODE_INSTN_ID)
  VALUES ((SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'KC Protocol - Staged for Admin Corr - SRR' AND DOC_HDR_STAT_CD = 'S'),4244)
/