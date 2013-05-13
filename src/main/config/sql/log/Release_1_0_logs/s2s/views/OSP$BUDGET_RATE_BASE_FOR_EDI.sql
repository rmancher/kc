
  CREATE OR REPLACE 
	VIEW OSP$BUDGET_RATE_BASE_FOR_EDI (PROPOSAL_NUMBER, BUDGET_PERIOD, LINE_ITEM_NUMBER, RATE_NUMBER, START_DATE, END_DATE, RATE_CLASS_CODE, RATE_TYPE_CODE, ON_OFF_CAMPUS_FLAG, APPLIED_RATE, BASE_COST, BASE_COST_SHARING, CALCULATED_COST, CALCULATED_COST_SHARING, UPDATE_TIMESTAMP, UPDATE_USER) AS 
  SELECT 
  A.PROPOSAL_NUMBER PROPOSAL_NUMBER,
  A.BUDGET_PERIOD BUDGET_PERIOD,
  A.LINE_ITEM_NUMBER LINE_ITEM_NUMBER,
  RATE_NUMBER,
  A.START_DATE START_DATE,
  A.END_DATE END_DATE,
  RATE_CLASS_CODE,
  RATE_TYPE_CODE,
  A.ON_OFF_CAMPUS_FLAG ON_OFF_CAMPUS_FLAG,
  APPLIED_RATE,
  BASE_COST,
  BASE_COST_SHARING,
  CALCULATED_COST,
  CALCULATED_COST_SHARING,
  A.UPDATE_TIMESTAMP UPDATE_TIMESTAMP,
  A.UPDATE_USER UPDATE_USER
FROM BUDGET_RATE_AND_BASE A, BUDGET_DETAILS B, BUDGET_CATEGORY C
WHERE B.PROPOSAL_NUMBER = A.PROPOSAL_NUMBER AND
B.VERSION_NUMBER = A.VERSION_NUMBER AND B.BUDGET_PERIOD = A.BUDGET_PERIOD
AND B.LINE_ITEM_NUMBER = A.LINE_ITEM_NUMBER 
AND C.BUDGET_CATEGORY_CODE = B.BUDGET_CATEGORY_CODE
AND C.CATEGORY_TYPE != 'P';
 