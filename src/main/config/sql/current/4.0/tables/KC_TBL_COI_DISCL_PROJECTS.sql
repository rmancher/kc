ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_ID TO SHRT_TXT_FLD_1
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_TITLE TO LNG_TXT_FLD_1
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_TYPE TO SHRT_TXT_FLD_2
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_SPONSOR TO LNG_TXT_FLD_2
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_ROLE TO SHRT_TXT_FLD_3
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_START_DATE TO DATE_FLD_1
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_END_DATE TO DATE_FLD_2
/
ALTER TABLE COI_DISCL_PROJECTS RENAME COLUMN COI_PROJECT_FUNDING_AMOUNT TO NMBR_FLD_1
/
ALTER TABLE COI_DISCL_PROJECTS ADD LNG_TXT_FLD_3 VARCHAR(200)
/
ALTER TABLE COI_DISCL_PROJECTS ADD NMBR_FLD_2 NUMBER(12,2)
/
ALTER TABLE COI_DISCL_PROJECTS ADD SLCT_BOX_1 VARCHAR(20)