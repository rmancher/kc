/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.external.award.impl;


import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.WebServiceException;

import kfs.AccountCreationService;
import kfs.AccountCreationServiceSOAP;
import kfs.AccountCreationStatusDTO;
import kfs.AccountParametersDTO;
//import kfs.

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.kra.award.commitments.AwardFandaRate;
import org.kuali.kra.award.contacts.AwardUnitContact;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.paymentreports.awardreports.AwardReportTerm;
import org.kuali.kra.award.paymentreports.awardreports.AwardReportTermRecipient;
import org.kuali.kra.bo.KcPerson;
import org.kuali.kra.external.award.AccountCreationClient;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.rice.core.config.ConfigContext;
import org.kuali.rice.kew.exception.WorkflowException;
import org.kuali.rice.kew.web.session.UserSession;
import org.kuali.rice.kns.service.DocumentService;
import org.kuali.rice.kns.util.GlobalVariables;
import org.kuali.rice.kns.util.KualiDecimal;



/**
 * This class is the implementation of the client that
 * connects to the financial web service that creates 
 * an account.
 * This class was generated by Apache CXF 2.2.9
 * Wed Aug 04 14:02:35 MST 2010
 * Generated source version: 2.2.9
 * 
 */

public final class AccountCreationClientImpl implements AccountCreationClient {

    private AccountParametersDTO accountParameters;
    private DocumentService documentService;
    
    private static final Log LOG = LogFactory.getLog(AccountCreationClientImpl.class);
    private static final String CREATE_ACCOUNT_SERVICE_ERRORS = "error.award.createAccount.serviceErrors";
    private static final String CANNOT_CONNECT_TO_SERVICE = "error.award.createAccount.cannotConnect";
    private static final String DOCUMENT_NUMBER_NULL = "error.award.createAccount.nullDocumentNumber";
    private static final QName SERVICE_NAME = new QName("KFS", "accountCreationServiceSOAP");
    
    private AccountCreationClientImpl() {
    }

    /**
     * This method calls the web service on KFS to create a C&G account.
     * @see org.kuali.kra.external.award.AccountCreationClient#createAwardAccount(org.kuali.kra.award.home.Award)
     */
    public void createAwardAccount(Award award) throws DatatypeConfigurationException, WorkflowException {
        
        setAccountParameters(award);
        accountParameters = getAccountParameters();
        
        URL wsdlURL = null;
        String serviceEndPointUrl = ConfigContext.getCurrentContextConfig().getProperty(KeyConstants.KFS_ACCOUNT_CREATION_ENDPOINT);
        try {
            wsdlURL = new URL(serviceEndPointUrl + "?wsdl");
            AccountCreationServiceSOAP ss = new AccountCreationServiceSOAP(wsdlURL, SERVICE_NAME);
            AccountCreationService port = ss.getAccountCreationServicePort();   
            AccountCreationStatusDTO createAccountResult = port.createAccount(accountParameters);
            // If the account did not get created display the errors
            if (!createAccountResult.getStatus().equals("success")) {
                String completeErrorMessage = "";
                List<String> errorMessages = createAccountResult.getErrorMessages();
                for (String errorMessage : errorMessages) {
                    completeErrorMessage += errorMessage;
                }
                GlobalVariables.getMessageMap().putError(CREATE_ACCOUNT_SERVICE_ERRORS, 
                                                     KeyConstants.CREATE_ACCOUNT_SERVICE_ERRORS, 
                                                     completeErrorMessage);
            } else {
                /* if account created successfully, then update the award table with the document number and date*/
                String financialAccountDocumentNumber = createAccountResult.getDocumentNumber();
                if (financialAccountDocumentNumber == null) {
                    GlobalVariables.getMessageMap().putError(DOCUMENT_NUMBER_NULL, KeyConstants.DOCUMENT_NUMBER_NULL);
                    LOG.warn("Document number returned from KFS account creation service is null.");
                } else {
                    award.setFinancialAccountDocumentNumber(financialAccountDocumentNumber);
                    Calendar calendar = Calendar.getInstance();
                    award.setFinancialAccountCreationDate(new Date(calendar.getTime().getTime()));
                    AwardDocument awardDocument = award.getAwardDocument();
                    documentService.saveDocument(awardDocument);

                }
            }  
        } catch (MalformedURLException e) {
            String errorMessage = "Can not initialize the default wsdl from Service Endpoint location:" + serviceEndPointUrl;
            LOG.error(errorMessage + e.getMessage(), e);
            GlobalVariables.getMessageMap().putError(KeyConstants.AWARD_ACCOUNT_INVALID_WSDL_URL, KeyConstants.AWARD_ACCOUNT_INVALID_WSDL_URL);
        } catch (WebServiceException e) {
            String errorMessage = "Cannot connect to the service. The service may be down, please try again later.";
            LOG.error(errorMessage + e.getMessage(), e);
            GlobalVariables.getMessageMap().putError(CANNOT_CONNECT_TO_SERVICE, KeyConstants.CANNOT_CONNECT_TO_SERVICE);
        }
        
    }

   
    /**
     * This method sets the necessary values in the AccountParametersDTO object to be sent 
     * across to the financial service.
     * @param award
     * @throws DatatypeConfigurationException
     */
    protected void setAccountParameters(Award award) throws DatatypeConfigurationException {

        accountParameters  = new AccountParametersDTO();
        
        setName(award);
        //Account number
        accountParameters.setAccountNumber(award.getAccountNumber());
        setDefaultAddress(award);
        setAdminAddress(award);       
        setPaymentAddress(award);
        
        //cfdaNumber
        String cfdaNumber = award.getCfdaNumber();
        if  (cfdaNumber != null) {
            accountParameters.setCfdaNumber(cfdaNumber);
        }
        
        //effective date
        Date effectiveDate = award.getBeginDate(); 
        GregorianCalendar dateEffective = new GregorianCalendar();
        dateEffective.setTime(effectiveDate);
        XMLGregorianCalendar gregorianDate = DatatypeFactory.newInstance().newXMLGregorianCalendar(dateEffective);
        accountParameters.setEffectiveDate(gregorianDate);
        
        //expiration date
        Date expirationDate = award.getProjectEndDate();
        GregorianCalendar dateExpiration = new GregorianCalendar();
        dateExpiration.setTime(expirationDate);
        gregorianDate = DatatypeFactory.newInstance().newXMLGregorianCalendar(dateExpiration);
        accountParameters.setExpirationDate(gregorianDate);
        
        // expense guideline text
        String expenseGuidelineText = award.getAwardNumber();
        accountParameters.setExpenseGuidelineText(expenseGuidelineText);
        
        setIncomeGuidelineText(award);
        
        //account purpose text
        accountParameters.setPurposeText(award.getTitle());

        // unit number
        accountParameters.setUnit(award.getUnitNumber());
       
        //Principal id
        //accountParameters.setPrincipalId(UserSession.getAuthenticatedUser().getPrincipalId());
        /* KFS and KC do not share a common db, so using khuntleys id
         so it will pass KFS authentication.*/
        String KHUNTLEY_ID = "6162502038";
        accountParameters.setPrincipalId(KHUNTLEY_ID);
        // get the current FandaRate
        AwardFandaRate currentFandaRate = getCurrentFandaRate(award);
        
        //campus on/off indicator
        accountParameters.setOffCampusIndicator(!currentFandaRate.getOnOffCampusFlag()); 
        //indirect cost rate
        accountParameters.setIndirectCostRate(currentFandaRate.getApplicableFandaRate() + "");
        // indirect cost type code
        accountParameters.setIndirectCostTypeCode(currentFandaRate.getFandaRateTypeCode() + "");
        
        //higher education function code
        accountParameters.setHigherEdFunctionCode(award.getActivityType().getHigherEducationFunctionCode());
        
    }
   
    /**
     * This method sets the name.
     * @param award
     */
    protected void setName(Award award) {
        
        final int ACCOUNT_NAME_LENGTH = 40;
        // Account name
        String accountName = award.getSponsor().getAcronym() 
        // sponsor award id?
                            + "-" + award.getSponsorAwardNumber();  //award.getAwardNumber();
        if (award.getPrincipalInvestigatorName() != null) {
            accountName += "-" + award.getPrincipalInvestigator().getPerson().getFirstName()
                               + award.getPrincipalInvestigator().getPerson().getLastName();
        }
        // Trimming the name 
        if (accountName.length() > ACCOUNT_NAME_LENGTH) {
            accountName = accountName.substring(0, ACCOUNT_NAME_LENGTH - 1);
        }
        accountParameters.setAccountName(accountName);
    }
    
    /**
     * This method sets the default address.
     * @param award
     */
    protected void setDefaultAddress(Award award) {
        //default address is the PI address
        KcPerson principalInvestigator = award.getPrincipalInvestigator().getPerson();
        String streetAddress = principalInvestigator.getAddressLine1();
        if (principalInvestigator.getAddressLine2() != null) {
            streetAddress += principalInvestigator.getAddressLine2();
        }
            
        if (principalInvestigator.getAddressLine3() != null) {
            streetAddress += principalInvestigator.getAddressLine3();
        }
        
        accountParameters.setDefaultAddressStreetAddress(streetAddress);
        accountParameters.setDefaultAddressCityName(principalInvestigator.getCity());
        accountParameters.setDefaultAddressStateCode(principalInvestigator.getState());
        accountParameters.setDefaultAddressZipCode(principalInvestigator.getPostalCode());
        
    }
    
    /**
     * This method sets the admin address.
     * @param award
     */
    protected void setAdminAddress(Award award) {
        List<AwardUnitContact> unitContacts = award.getAwardUnitContacts();
        for (AwardUnitContact contact : unitContacts) {
            contact.refreshReferenceObject("unitAdministratorType");
            // Send the address of the administrative contact
            if ("Administrative Contact".equals(contact.getUnitAdministratorType().getDescription())) {
                KcPerson adminPerson = contact.getPerson();
                
                String adminStreetAddress = adminPerson.getAddressLine1();
                if (adminPerson.getAddressLine2() != null) {
                    adminStreetAddress += adminPerson.getAddressLine2();
                }
                    
                if (adminPerson.getAddressLine3() != null) {
                    adminStreetAddress += adminPerson.getAddressLine3();
                }
             
                accountParameters.setAdminContactAddressStreetAddress(adminStreetAddress);
                accountParameters.setAdminContactAddressStreetAddress(adminPerson.getAddressLine1());
                accountParameters.setAdminContactAddressCityName(adminPerson.getCity());
                accountParameters.setAdminContactAddressStateCode(adminPerson.getState());
                accountParameters.setAdminContactAddressZipCode(adminPerson.getPostalCode());
            }
        }
    }
    
    /**
     * This method sets the payment address.
     * @param award
     */
    protected void setPaymentAddress(Award award) {
      //payment contact address
        List<AwardReportTerm> items = award.getAwardReportTermItems();
        for (AwardReportTerm item : items) {
            List<AwardReportTermRecipient> recipients = item.getAwardReportTermRecipients();
            // send any one of the recipients addresses
            if (recipients.size() != 0) {
                String paymentStreetAddress = recipients.get(0).getRolodex().getAddressLine1();
                if (recipients.get(0).getRolodex().getAddressLine2() != null) {
                    paymentStreetAddress += recipients.get(0).getRolodex().getAddressLine2();
                }
                    
                if (recipients.get(0).getRolodex().getAddressLine3() != null) {
                    paymentStreetAddress += recipients.get(0).getRolodex().getAddressLine3();
                }
                
                accountParameters.setPaymentAddressStreetAddress(paymentStreetAddress);
                accountParameters.setPaymentAddressCityName(recipients.get(0).getRolodex().getCity());
                accountParameters.setPaymentAddressStateCode(recipients.get(0).getRolodex().getState());
                accountParameters.setPaymentAddressZipCode(recipients.get(0).getRolodex().getPostalCode());
            }
           
        }
    }
    
    /**
     * This method sets the income guideline text.
     * @param award
     */
    protected void setIncomeGuidelineText(Award award) {
        //income guideline text
        award.refreshReferenceObject("awardBasisOfPayment");        
        String paymentBasis = award.getAwardBasisOfPayment().getDescription();
        award.refreshReferenceObject("awardMethodOfPayment");
        String paymentMethod = award.getAwardMethodOfPayment().getDescription(); 
        
        String incomeGuidelineText = ""; 
        if (paymentBasis != null) {
            incomeGuidelineText += " " + paymentBasis;
        }
        if (paymentMethod != null) {
            incomeGuidelineText += " " + paymentMethod;
        }
        accountParameters.setIncomeGuidelineText(incomeGuidelineText);
    }
    
    
    /**
     * This method gets the current rate.
         * If there are multiple current rates, return the one with the higher rate
     * @param award
     * @return currentFandaRate
     */
    protected AwardFandaRate getCurrentFandaRate(Award award) {
        List<AwardFandaRate> rates = award.getAwardFandaRate();
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
       
        if (rates.size() == 0) {
            LOG.warn("No F and A rates provided");
        }
        
        AwardFandaRate currentFandaRate;
        
        KualiDecimal currentRateValue = new KualiDecimal(0.0);
        currentFandaRate = rates.get(0);
        for (AwardFandaRate rate : rates) {
            if (Integer.parseInt(rate.getFiscalYear()) == currentYear) {
                if (rate.getApplicableFandaRate().isGreaterThan(currentRateValue)) {
                    currentFandaRate = rate;
                    currentRateValue = rate.getApplicableFandaRate();
                }
            }      
        }
        return currentFandaRate;
    }
    
    protected AccountParametersDTO getAccountParameters() {
        return accountParameters;
    }

    /**
     * Sets the documentService attribute value. Injected by Spring.
     * 
     * @param documentService The documentService to set.
     */
    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
}
