CREATE SEQUENCE SEQ_PROPOSAL_COST_SHARE_ID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_UNRECOVERED_FNA_ID INCREMENT BY 1 START WITH 1;

ALTER TABLE PROPOSAL_IDC_RATE
ADD PROPOSAL_ID NUMBER(12,0) NOT NULL;

commit;