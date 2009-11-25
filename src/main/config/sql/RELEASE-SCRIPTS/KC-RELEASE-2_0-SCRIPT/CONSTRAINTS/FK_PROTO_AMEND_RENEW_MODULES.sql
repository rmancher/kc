ALTER TABLE PROTO_AMEND_RENEW_MODULES 
    ADD CONSTRAINT FK_PROTO_AMEND_RENEW_MODULES1 FOREIGN KEY (PROTO_AMEND_RENEWAL_ID) 
                REFERENCES PROTO_AMEND_RENEWAL (PROTO_AMEND_RENEWAL_ID) ;

ALTER TABLE PROTO_AMEND_RENEW_MODULES 
    ADD CONSTRAINT FK_PROTO_AMEND_RENEW_MODULES2 FOREIGN KEY (PROTOCOL_MODULE_CODE) 
                REFERENCES PROTOCOL_MODULES (PROTOCOL_MODULE_CODE) ;