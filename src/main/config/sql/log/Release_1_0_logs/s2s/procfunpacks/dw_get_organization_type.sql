CREATE OR REPLACE procedure dw_get_organization_type
   ( as_organization_id IN osp$organization.organization_id%TYPE,
     cur_organization_type IN OUT result_sets.cur_generic) is

begin
open cur_organization_type for
  SELECT OSP$ORGANIZATION_TYPE.ORGANIZATION_ID,
         OSP$ORGANIZATION_TYPE.ORGANIZATION_TYPE_CODE,
         OSP$ORGANIZATION_TYPE.UPDATE_TIMESTAMP,
         OSP$ORGANIZATION_TYPE.UPDATE_USER,
    		OSP$ORGANIZATION_TYPE_LIST.DESCRIPTION
    FROM OSP$ORGANIZATION_TYPE,
     		OSP$ORGANIZATION_TYPE_LIST
	WHERE OSP$ORGANIZATION_TYPE.ORGANIZATION_TYPE_CODE = OSP$ORGANIZATION_TYPE_LIST.ORGANIZATION_TYPE_CODE
			AND OSP$ORGANIZATION_TYPE.ORGANIZATION_ID = as_organization_id
	ORDER BY OSP$ORGANIZATION_TYPE_LIST.DESCRIPTION;

end;
/
