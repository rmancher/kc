REM INSERTING INTO AWARD_TEMPLATE
INSERT
INTO AWARD_TEMPLATE
  (
    AWARD_TEMPLATE_CODE, DESCRIPTION, STATUS_CODE, PRIME_SPONSOR_CODE,
    BASIS_OF_PAYMENT_CODE, METHOD_OF_PAYMENT_CODE, UPDATE_TIMESTAMP, UPDATE_USER,
    VER_NBR, OBJ_ID
  )
  VALUES
  (
    1, 'Test Sponsor Template', '1', '000340', '2', '1', TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, 'AEEBCF4E-63FB-9284-9046-4AA918CB2A18'
  );
REM INSERTING into AWARD_TEMPLATE_COMMENTS
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    30, 0, '20ADDB93-6A08-53E4-6EEE-76660712A150', 1, '1', 'N',
    'Invoicing remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    31, 0, '9EEE173A-40D9-2826-9E43-EA1010A38394', 1, '2', 'N',
    'General remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    32, 0, 'E53035A3-49F1-B73A-B6FA-5189A04ED7FF', 1, '3', 'N',
    'Financial Rpt remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    33, 0, '9AF4AA0C-F19E-F209-E70B-FC585A556178', 1, '4', 'N',
    'IP remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    34, 0, '9C5570BF-C1FD-6FFC-1A5A-82EDA1967E04', 1, '5', 'N',
    'Procurement remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    35, 0, 'B252E3CE-CC37-3D2A-6950-9371FEA5EA45', 1, '6', 'N',
    'Property/Equipment remarks from sync to Test Sponsor Template.',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_COMMENTS
  (
    AWARD_TEMPLATE_COMMENTS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    COMMENT_TYPE_CODE, CHECKLIST_PRINT_FLAG, COMMENTS, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    36, 0, 'BD519B0D-91B1-7132-7087-5E2FBC57436D', 1, '9', 'N',
    'Cost sharing remarks from sync to Test Sponsor Template.', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
REM INSERTING into AWARD_TEMPLATE_CONTACT
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    37, 1, '3', 273, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, 'BC75B618-636F-7096-088F-1C79C00893B4'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    38, 1, '11', 274, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, '6921EF04-A2A7-83DC-6150-099851FCD2B1'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    39, 1, '5', 275, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, 'AAC705FB-FFFD-1053-C766-DCC85B3BAB7D'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    40, 1, '4', 276, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, '40CE46BB-4E28-86D4-D566-B17213EBAEFD'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    41, 1, '1', 1736, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, '92BDE155-8EBB-2598-0203-D74A4BB72DD2'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    42, 1, '9', 1291, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, '57E3B643-ABCA-A509-BC00-4F1D96712818'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    43, 1, '13', 312, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, 'B2DA722F-D169-1D78-86DE-15E2D7833AA2'
  );
INSERT
INTO AWARD_TEMPLATE_CONTACT
  (
    AWARD_TEMPLATE_CONTACT_ID, AWARD_TEMPLATE_CODE, CONTACT_TYPE_CODE,
    ROLODEX_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID
  )
  VALUES
  (
    44, 1, '2', 1389, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart', 0, 'ED06B83C-02DB-75BE-CF5B-1F27A4E209AA'
  );
REM INSERTING into AWARD_TEMPLATE_REPORT_TERMS
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    2, 0, 'BD889A8C-DD9C-4E02-E9FB-9A61F969440E', 1, '1', '33', '7', '3', '4',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    4, 0, 'F689AA88-8DDA-1D4D-A0AC-ECB22268D717', 1, '1', '5', '12', '4', '2',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    6, 0, '6C04824B-AA12-829D-8C98-C267150BB1F2', 1, '2', '39', '3', '2', '1',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    8, 0, '89C1F455-7DEF-0DF8-940B-682B806CCE93', 1, '2', '40', '13', '4', '2',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    10, 0, 'B3781BC8-67EB-318B-EA99-8C387E13E079', 1, '3', '7', '6', '2', '4',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    12, 0, 'B7166AFE-0621-6966-CEBB-D61C8CEA340E', 1, '3', '36', '30', '3', '1'
    , NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    14, 0, '617664BB-5332-2AB2-AFF5-754158C28EA2', 1, '4', '9', '4', '6', '3',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    16, 0, 'B933DD46-86B2-0ABB-1EA5-95E020E4FF6C', 1, '4', '5', '43', '4', '1',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    18, 0, 'BDB2DB85-139C-3C0B-B661-5850461C2262', 1, '5', '7', '3', '2', '1',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    20, 0, '0E46A878-4695-2904-53B0-DF879E271C5F', 1, '5', '37', '10', '4', '4'
    , NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    22, 0, '16084F45-EF23-E5C5-04AA-5A89A8FC337C', 1, '6', '51', '2', '2', '4',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    24, 0, '1573F98B-7AFC-8DE1-6417-59B582B4F4C2', 1, '6', '5', '12', '4', '4',
    NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    26, 0, '4C7330FB-3847-EF9F-250A-B4B8F5A760CD', 1, '7', '69', '16', '4', '4'
    , NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_REPORT_TERMS
  (
    TEMPLATE_REPORT_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE,
    OSP_DISTRIBUTION_CODE, DUE_DATE, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    28, 0, '0D66D358-422C-EF5B-E8D2-1197FD55D9E1', 1, '7', '70', '23', '4', '4'
    , NULL, TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'),
    'quickstart'
  );
REM INSERTING into AWARD_TEMPL_REP_TERMS_RECNT
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    3, 2, '2', 1389, 1, 0, '43B14D6B-16CB-1C37-2EAE-FB1313982BEE', TO_TIMESTAMP
    ('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    5, 4, '2', 1389, 2, 0, 'E47AA07D-5B45-D4FA-4DB7-2F6EB6466E9B', TO_TIMESTAMP
    ('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    7, 6, '5', 275, 3, 0, '95FC4ED5-23CA-B3C4-87BA-23528E11B592', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    9, 8, '5', 275, 2, 0, '0810C2B4-BB13-71D3-EB09-00C011DC1A05', TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    11, 10, '4', 276, 4, 0, '9F1257FE-E0A0-46CA-3982-5EF22469BBA9',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    13, 12, '4', 276, 3, 0, '0783A3C5-7A72-5C0D-9B4E-46E2255E2FB0',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    15, 14, '1', 1736, 1, 0, '752CD2D9-35D1-98CE-3AF2-56A6DE3C94CC',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    17, 16, '1', 1736, 3, 0, '78C62643-B1A1-1FD4-45F3-A7BED335F165',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    19, 18, '9', 1291, 2, 0, 'C4534F36-434A-47D9-4560-A5FB6463F002',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    21, 20, '9', 1291, 3, 0, 'EFF9376E-A142-1761-9F8A-34CF912257E4',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    23, 22, '3', 273, 1, 0, 'C2EA9B1B-5FB1-A4F8-651E-71699CAEBC32',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    25, 24, '3', 273, 2, 0, '0CC41008-FF3C-0612-BA6A-F0A3F6D1C1A4',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    27, 26, '2', 1389, 5, 0, '8439DED5-8BAE-8E31-597D-ABEF5FE8689C',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPL_REP_TERMS_RECNT
  (
    TEMPL_REP_TERMS_RECNT_ID, TEMPLATE_REPORT_TERMS_ID, CONTACT_TYPE_CODE,
    ROLODEX_ID, NUMBER_OF_COPIES, VER_NBR, OBJ_ID, UPDATE_TIMESTAMP,
    UPDATE_USER
  )
  VALUES
  (
    29, 28, '2', 1389, 3, 0, '823DB295-E85B-AC60-70EF-AB1162FEF308',
    TO_TIMESTAMP('24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
REM INSERTING into AWARD_TEMPLATE_TERMS
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    45, 0, '164B0A79-21C6-7E4D-6BBB-3DE942CC0452', 1, 5, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    46, 0, '66A22155-41AE-BFC0-85D8-CCAD88543EDE', 1, 24, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    47, 0, 'AD8B5E26-C3A9-DF07-A7E9-088DD8F6BBA8', 1, 43, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    48, 0, '21CDE72B-6F04-6ED8-158B-E28B18090527', 1, 45, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    49, 0, 'C547B828-2844-D358-3A0C-3FC26ECD2580', 1, 61, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    50, 0, 'EC198902-31CC-CBC7-81B9-CC8B0B95105A', 1, 68, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    51, 0, '92AD3F70-46E9-1656-7550-4319AAE40BA2', 1, 72, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    52, 0, '5366E524-A7E2-04BB-8C7B-01FD478C678C', 1, 74, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    53, 0, '127F1561-777A-38AF-F7CD-7DACCD94E437', 1, 79, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    54, 0, '0A8673FE-A270-848A-FC2A-C2E1296A1702', 1, 83, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    55, 0, 'F9908C1B-DAD6-B8F4-6E44-365EEDB54DF3', 1, 87, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    56, 0, 'A1F3DA79-37D2-863C-EADF-25448D5A4EE8', 1, 92, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    57, 0, 'DF358AB9-EEB5-E373-91A8-67A5C345679D', 1, 93, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    58, 0, '34DA150A-8142-09AA-046E-AFC99FA23DB1', 1, 121, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    59, 0, '1B310D7A-9EC3-F9F0-CE8E-9A9C6AE0BD66', 1, 122, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    60, 0, '83410390-E077-33C1-A004-1E1284AD6F12', 1, 145, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    61, 0, '9DC5F54C-5D65-E984-50A1-89A6B1D17B08', 1, 148, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    62, 0, 'D932EC9A-9FA9-11AC-7238-CC7DB29F8036', 1, 149, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    63, 0, 'F82F6898-C146-6BD5-DD00-BCC7BF14A9AF', 1, 199, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    64, 0, '06665AA2-9DB8-1FDB-E32B-D5617239F4EB', 1, 212, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    65, 0, '27EF4E13-23B2-3396-0412-CD50167B7D1C', 1, 223, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    66, 0, '112A89B7-12C8-43D6-C7C0-C2CC050C6F46', 1, 231, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    67, 0, 'B0B4F6F8-C456-00D8-D5B6-1D8E90D4B42E', 1, 259, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    68, 0, '7E81E5B2-66FD-2C97-956C-4B0E2D90B0FC', 1, 265, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    69, 0, '7C985A03-FA27-C521-4E59-9D79A7CCEB39', 1, 286, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
INSERT
INTO AWARD_TEMPLATE_TERMS
  (
    AWARD_TEMPLATE_TERMS_ID, VER_NBR, OBJ_ID, AWARD_TEMPLATE_CODE,
    SPONSOR_TERM_ID, UPDATE_TIMESTAMP, UPDATE_USER
  )
  VALUES
  (
    70, 0, '666E4D83-5756-379D-508D-CFE500A29BA2', 1, 294, TO_TIMESTAMP(
    '24-FEB-2010', 'DD-MON-YYYY'), 'quickstart'
  );
COMMIT;