CREATE OR REPLACE PROCEDURE "DW_GET_UNIT_DETAIL_NEW" 
   ( AS_UNIT_NUMBER IN VARCHAR2,
     cur_unit IN OUT Result_Sets.cur_generic) IS

BEGIN
OPEN cur_unit FOR
  SELECT OSP$UNIT.UNIT_NUMBER,
			OSP$UNIT.UNIT_NAME,
			OSP$UNIT.ADMINISTRATIVE_OFFICER,
			OSP$PERSON_A.FULL_NAME ADMINISTRATIVE_OFFICER_NAME,
			OSP$UNIT.UNIT_HEAD,
			OSP$PERSON_B.FULL_NAME UNIT_HEAD_NAME,
			OSP$UNIT.DEAN_VP,
			OSP$PERSON_C.FULL_NAME DEAN_VP_NAME,
			OSP$UNIT.OTHER_INDIVIDUAL_TO_NOTIFY,
			OSP$PERSON_D.FULL_NAME OTHER_IND_TO_NOTIFY_NAME,
			OSP$UNIT.OSP_ADMINISTRATOR,
 			OSP$PERSON_E.FULL_NAME OSP_ADMINISTRATOR_NAME,
			OSP$UNIT.UPDATE_TIMESTAMP,
         OSP$UNIT.UPDATE_USER,
		 OSP$UNIT.ORGANIZATION_ID, -- Added for Unit Enhancement - Maintaining Organization
			OSP$ORGANIZATION.ORGANIZATION_NAME -- Added for Unit Enhancement - Maintaining Organization
	FROM 	OSP$UNIT,
			OSP$UNIT UNIT_A,
			OSP$UNIT UNIT_B,
			OSP$UNIT UNIT_C,
			OSP$UNIT UNIT_D,
			OSP$UNIT UNIT_E,
			OSP$PERSON OSP$PERSON_A,
			OSP$PERSON OSP$PERSON_B,
			OSP$PERSON OSP$PERSON_C,
			OSP$PERSON OSP$PERSON_D,
			OSP$PERSON OSP$PERSON_E,
			OSP$ORGANIZATION
	WHERE	UNIT_A.ADMINISTRATIVE_OFFICER = OSP$PERSON_A.PERSON_ID (+)
		AND	UNIT_B.UNIT_HEAD = OSP$PERSON_B.PERSON_ID (+)
		AND	UNIT_C.DEAN_VP = OSP$PERSON_C.PERSON_ID (+)
		AND	UNIT_D.OTHER_INDIVIDUAL_TO_NOTIFY= OSP$PERSON_D.PERSON_ID (+)
		AND	UNIT_E.OSP_ADMINISTRATOR= OSP$PERSON_E.PERSON_ID (+)
		AND	UNIT_A.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER
		AND	UNIT_B.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER
		AND	UNIT_C.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER
		AND	UNIT_D.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER
		AND	UNIT_E.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER
		AND (LTRIM(RTRIM(OSP$UNIT.UNIT_NUMBER)) = LTRIM(RTRIM(AS_UNIT_NUMBER)))
		AND OSP$UNIT.ORGANIZATION_ID = OSP$ORGANIZATION.ORGANIZATION_ID(+);-- Added for Unit Enhancement - Maintaining Organization;
END;
/

CREATE OR REPLACE PROCEDURE "GET_UNIT_HIERARCHY_NODE" 
( AW_UNIT_NUMBER IN OSP$UNIT_HIERARCHY.unit_number%TYPE,
  cur_hierarchy IN OUT result_sets.cur_generic) IS

BEGIN

OPEN cur_hierarchy FOR
  SELECT OSP$UNIT_HIERARCHY.UNIT_NUMBER,
         OSP$UNIT_HIERARCHY.PARENT_UNIT_NUMBER,
         OSP$UNIT_HIERARCHY.HAS_CHILDREN_FLAG,
         OSP$UNIT_HIERARCHY.UPDATE_TIMESTAMP,
         OSP$UNIT_HIERARCHY.UPDATE_USER,
 			OSP$UNIT.UNIT_NAME
    FROM OSP$UNIT_HIERARCHY,  OSP$UNIT
   WHERE ( OSP$UNIT_HIERARCHY.UNIT_NUMBER = OSP$UNIT.UNIT_NUMBER )
   AND OSP$UNIT_HIERARCHY.UNIT_NUMBER=AW_UNIT_NUMBER;

END;
/

CREATE OR REPLACE procedure GET_TOT_BUD_INFO_FOR_PRNT
   ( AW_PROPOSAL_NUMBER IN OSP$BUDGET.PROPOSAL_NUMBER%TYPE,
     AW_VERSION_NUMBER IN OSP$BUDGET.VERSION_NUMBER%TYPE,
	  cur_generic IN OUT result_sets.cur_generic) is

		 prop_num OSP$BUDGET.PROPOSAL_NUMBER%TYPE;
       version_num OSP$BUDGET.VERSION_NUMBER%TYPE;
		 tot_cost  OSP$BUDGET.TOTAL_COST%TYPE;
		 tot_direct_cost OSP$BUDGET.TOTAL_DIRECT_COST%TYPE;
		 tot_ind_cost OSP$BUDGET.TOTAL_INDIRECT_COST%TYPE;
		 cost_shar_amt OSP$BUDGET.COST_SHARING_AMOUNT%TYPE;
       mod_budget  OSP$BUDGET.MODULAR_BUDGET_FLAG%TYPE;
begin

SELECT MODULAR_BUDGET_FLAG
INTO   mod_budget
FROM   OSP$BUDGET
WHERE	 PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
AND    VERSION_NUMBER = AW_VERSION_NUMBER;

prop_num := aw_proposal_number;
version_num := aw_version_number;

if mod_budget = 'N' then

	SELECT nvl(TOTAL_COST, 0) TOTAL_COST,
		    nvl(TOTAL_DIRECT_COST, 0) TOTAL_DIRECT_COST,
		    nvl(TOTAL_INDIRECT_COST, 0) TOTAL_INDIRECT_COST,
		    nvl(COST_SHARING_AMOUNT, 0) COST_SHARING_AMOUNT
	INTO   tot_cost,tot_direct_cost,tot_ind_cost,cost_shar_amt
   FROM   OSP$BUDGET
	WHERE  PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
	AND    VERSION_NUMBER = AW_VERSION_NUMBER;
else

	SELECT   DECODE(SUM(TOTAL_direct_COST),NULL,0 ,SUM(TOTAL_direct_COST)),
        		DECODE(SUM(TOTAL_direct_COST),NULL,0 ,SUM(TOTAL_direct_COST)),
       		0 ,
       		0 
   INTO   tot_cost,tot_direct_cost,tot_ind_cost,cost_shar_amt
	FROM   OSP$BUDGET_MODULAR
	WHERE  PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
	AND    VERSION_NUMBER = AW_VERSION_NUMBER;

end if;

open cur_generic for

SELECT prop_num AS PROPOSAL_NUMBER,
       version_num AS VERSION_NUMBER,
		 tot_cost AS TOTAL_COST,
		 tot_direct_cost AS TOTAL_DIRECT_COST,
		 tot_ind_cost AS TOTAL_INDIRECT_COST,
		 cost_shar_amt AS COST_SHARING_AMOUNT
FROM   DUAL;


end;
/

