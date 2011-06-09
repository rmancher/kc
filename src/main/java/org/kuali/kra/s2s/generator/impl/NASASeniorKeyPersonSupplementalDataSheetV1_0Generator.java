/*
 * Copyright 2005-2010 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.kra.s2s.generator.impl;

import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.CoItypeDataType;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.FederalAgencyDataType;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPersonAttachment;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPersonAttachment.NASASeniorKeyPersonSupplementalDataSheetAtt;
import gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPersonAttachment.NASASeniorKeyPersonSupplementalDataSheetAtt.SeniorKeyPerson;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.attachmentsV10.AttachmentGroupMin0Max100DataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.XmlObject;
import org.kuali.kra.bo.Rolodex;
import org.kuali.kra.bo.Sponsor;
import org.kuali.kra.bo.SponsorHierarchy;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.proposaldevelopment.bo.ProposalPerson;
import org.kuali.kra.proposaldevelopment.bo.ProposalPersonComparator;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;
import org.kuali.kra.s2s.service.S2SBudgetCalculatorService;
import org.kuali.kra.s2s.service.S2SUtilService;
import org.kuali.kra.s2s.util.S2SConstants;
import org.kuali.rice.kns.service.BusinessObjectService;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * NASASeniorKeyPersonSupplementalDataSheetV1.0. This form is generated using
 * XMLBean API's generated by compiling
 * NASASeniorKeyPersonSupplementalDataSheetV1.0 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class NASASeniorKeyPersonSupplementalDataSheetV1_0Generator extends
		S2SBaseFormGenerator {

	private S2SUtilService s2sUtilService;
	private S2SBudgetCalculatorService s2sBudgetCalculatorService;
	private BusinessObjectService businessObjectService;

	private static final String COLLABORATOR = "COLLABORATOR";
	private static final String COUNTRY_CODE_USA = "USA";
	private static final String COUNTRY_CODE_PRI = "PRI";
	private static final String COUNTRY_CODE_VIR = "VIR";
	private static final String CO_INVESTIGATOR = "COI";
	private static final String ROLE_COLLABORATOR = "COLLABORATOR";

	private static final String ATTACHED_ATTACHMENT_1 = "Attached Attachment 1";
	private static final String ATTACHED_ATTACHMENT_2 = "Attached Attachment 2";
	private static final String ATTACHED_ATTACHMENT_3 = "Attached Attachment 3";
	private static final String ATTACHED_ATTACHMENT_4 = "Attached Attachment 4";

	private static final String ATTACHMENT_TYPE_BUDGET_DETAILS = "3";
	private static final String ATTACHMENT_TYPE_STATEMENT_OF_COMMITMENT_DOC = "4";
	protected static final int MAX_KEY_PERSON_COUNT = 8;
    private static final String HIERARCHY_ADMINISTERING_ACTIVIUTY = "Administering Activity";
    private static final String HIERARCHY_NAME = null;
    private static final String SPONSOR_CODE = null;

	List<ProposalPerson> extraPersons = new ArrayList<ProposalPerson>();

	/**
	 * 
	 * Constructs a NASASeniorKeyPersonSupplementalDataSheetV1_0Generator.java.
	 */
	public NASASeniorKeyPersonSupplementalDataSheetV1_0Generator() {
		s2sUtilService = KraServiceLocator.getService(S2SUtilService.class);
		s2sBudgetCalculatorService = KraServiceLocator
				.getService(S2SBudgetCalculatorService.class);
		businessObjectService = KraServiceLocator
				.getService(BusinessObjectService.class);
	}

	/**
	 * 
	 * This method returns NASASeniorKeyPersonSupplementalDataSheetDocument
	 * object based on proposal development document which contains the
	 * NASASeniorKeyPersonSupplementalDataSheetDocument informations
	 * Senior_Key_Person,
	 * Attachment1,Attachment2,Attachment3,Attachment4,SeniorKeyPersonAttachment
	 * for a particular proposal
	 * 
	 * @return nasaSeniorKeyPersonSupplementalDataSheetDocument(NASASeniorKeyPersonSupplementalDataSheetDocument)
	 */
	private NASASeniorKeyPersonSupplementalDataSheetDocument getNasaSeniorKeyPersonSupplementalDataSheetDocument() {
		NASASeniorKeyPersonSupplementalDataSheetDocument nasaSeniorKPDoc = NASASeniorKeyPersonSupplementalDataSheetDocument.Factory
				.newInstance();
		NASASeniorKeyPersonSupplementalDataSheet nasaSeniorKPDataSheet = nasaSeniorKPDoc.addNewNASASeniorKeyPersonSupplementalDataSheet();
		nasaSeniorKPDataSheet.setFormVersion(S2SConstants.FORMVERSION_1_0);
		populateInvestigators(nasaSeniorKPDataSheet);
		if (extraPersons != null && extraPersons.size() > 0) {
			int extraPersonNumber = extraPersons.size();
			int attPersons;

			List<NASASeniorKeyPersonSupplementalDataSheetAtt> nasaSeniorKPAttList = new ArrayList<NASASeniorKeyPersonSupplementalDataSheetAtt>();
			for (int begin = 0, index = 0; begin < extraPersonNumber; begin = begin + 8, index++) {
				NASASeniorKeyPersonSupplementalDataSheetAtt nasaSeniorKPAtt = NASASeniorKeyPersonSupplementalDataSheetAtt.Factory
						.newInstance();

				if (extraPersonNumber - begin > 8) {
					attPersons = begin + 8;
				} else {
					attPersons = extraPersonNumber;
				}
				List<SeniorKeyPerson> seniorKeyPersonList = new ArrayList<SeniorKeyPerson>();
				for (int cnt = begin; cnt < attPersons; cnt++) {
					int index1 = 0;
					seniorKeyPersonList.add(getExtraPerson(extraPersons
							.get(cnt)));
					index1++;
				}
				SeniorKeyPerson seniorKeyPersons[] = new SeniorKeyPerson[0];
				seniorKeyPersons = seniorKeyPersonList
						.toArray(seniorKeyPersons);
				nasaSeniorKPAtt.setSeniorKeyPersonArray(seniorKeyPersons);
				nasaSeniorKPAttList.add(nasaSeniorKPAtt);

				if (begin == 0) {
					nasaSeniorKPDataSheet.setAttachment1(ATTACHED_ATTACHMENT_1);
				} else if (begin == 8) {
					nasaSeniorKPDataSheet.setAttachment2(ATTACHED_ATTACHMENT_2);
				} else if (begin == 16) {
					nasaSeniorKPDataSheet.setAttachment3(ATTACHED_ATTACHMENT_3);
				} else if (begin == 24) {
					nasaSeniorKPDataSheet.setAttachment4(ATTACHED_ATTACHMENT_4);
				}
			}
			SeniorKeyPersonAttachment seniorKeyPersonAttachment = SeniorKeyPersonAttachment.Factory
					.newInstance();
			NASASeniorKeyPersonSupplementalDataSheetAtt[]  nasaSeniorKPAtts =  
			                                        new NASASeniorKeyPersonSupplementalDataSheetAtt[0];
			nasaSeniorKPAtts = nasaSeniorKPAttList.toArray(nasaSeniorKPAtts);
			seniorKeyPersonAttachment
					.setNASASeniorKeyPersonSupplementalDataSheetAttArray(nasaSeniorKPAtts);
			nasaSeniorKPDataSheet
					.setSeniorKeyPersonAttachment(seniorKeyPersonAttachment);
		}
//		nasaSeniorKPDoc
//				.setNASASeniorKeyPersonSupplementalDataSheet(nasaSeniorKPDataSheet);
		return nasaSeniorKPDoc;
	}

	/**
	 * This method returns array of SeniorKeyPersons based on proposalPerson
	 * @param nasaSeniorKPDataSheet 
	 * 
	 * @return seniorKeyPersons
	 *         (NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson[])
	 * 
	 */
	private void populateInvestigators(NASASeniorKeyPersonSupplementalDataSheet nasaSeniorKPDataSheet) {
		List<ProposalPerson> proposalPersonns = pdDoc.getDevelopmentProposal()
				.getProposalPersons();
		Collections.sort(proposalPersonns, new ProposalPersonComparator());
		List<ProposalPerson> keyPersons = new LinkedList<ProposalPerson>();

		for (ProposalPerson proposalPerson : pdDoc.getDevelopmentProposal()
				.getProposalPersons()) {
			if (proposalPerson.getProposalPersonRoleId() != null
					&& (CO_INVESTIGATOR.equalsIgnoreCase(proposalPerson
							.getProposalPersonRoleId()) || ROLE_COLLABORATOR
							.equalsIgnoreCase(proposalPerson.getProjectRole()))) {
				keyPersons.add(proposalPerson);
			}
		}
		
		if(keyPersons.isEmpty()){
		    nasaSeniorKPDataSheet.addNewSeniorKeyPerson();
		    return;
		}
		
		List<ProposalPerson> nKeyPersons = s2sUtilService.getNKeyPersons(
				keyPersons, true, MAX_KEY_PERSON_COUNT);
		extraPersons = s2sUtilService.getNKeyPersons(keyPersons, false,
				MAX_KEY_PERSON_COUNT);
		List<gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson> seniorKeyPersonList = new LinkedList<gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson>();
		for (ProposalPerson proposalPerson : nKeyPersons) {
			seniorKeyPersonList.add(getPerson(proposalPerson));
		}

		gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson[] seniorKeyPersonsArray = new gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson[0];
		nasaSeniorKPDataSheet.setSeniorKeyPersonArray(seniorKeyPersonList.toArray(seniorKeyPersonsArray));
	}

	/**
	 * 
	 * This method fetches the LEVEL1 value for Sponsor Hierarchy
	 * 
	 * @param sponsorCode
	 *            of the sponsor.
	 * @return enum FederalAgencyDataType based on the sponsor code passed.
	 */
	private FederalAgencyDataType.Enum getFederalAgencyDataType(
			String sponsorCode) {
//		FederalAgencyDataType.Enum federalAgencyDataType = null;
//		Map<String, String> criteriaMap = new HashMap<String, String>();
//		criteriaMap.put(HIERARCHY_NAME, HIERARCHY_ADMINISTERING_ACTIVIUTY);
//		criteriaMap.put(SPONSOR_CODE, sponsorCode);
//		List<SponsorHierarchy> sponsorHierarchyList = new
//		ArrayList<SponsorHierarchy>(businessObjectService.findMatching(SponsorHierarchy.class, criteriaMap));
//		if (sponsorHierarchyList.size() > 0) {
//    		federalAgencyDataType=FederalAgencyDataType.Enum.forString(sponsorHierarchyList.get(0).getLevel1());
//		}

		// FIXME above line commented and value is hardcoded because values in
		// column sponsor_Hierachy.LEVEL1 don't match with
		return null;
	}

	/**
	 * This method returns SeniorKeyPerson object which contains informations
	 * SeniorKeyPersonName,NASACo-Itype,
	 * USGovernmentParticipation,FederalAgency,FederalAgencyDollar,InternationalParticipation,
	 * StatementofCommitment,BudgetDetails based on proposalPerson
	 * 
	 * @param proposalPerson(ProposalPerson)
	 * @return seniorKeyPerson
	 *         (NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson)
	 *         corresponding to the ProposalPerson object.
	 */
	private gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson getPerson(
			ProposalPerson proposalPerson) {
		gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson seniorKeyPerson = gov.grants.apply.forms.nasaSeniorKeyPersonSupplementalDataSheetV10.NASASeniorKeyPersonSupplementalDataSheetDocument.NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson.Factory
				.newInstance();
		seniorKeyPerson.setInternationalParticipation(YesNoDataType.N_NO); // default
		seniorKeyPerson.setUSGovernmentParticipation(YesNoDataType.N_NO); // default
		int sponsortType = -1;
		String sponsorCode = null;
		if (proposalPerson.getProposalPersonRoleId() != null
				&& proposalPerson.getProposalPersonRoleId()
						.equals(COLLABORATOR)) {
			seniorKeyPerson.setNASACoItype(CoItypeDataType.COLLABORATOR);
		}

		if (s2sBudgetCalculatorService.isPersonNonMITPerson(proposalPerson)) {
			if (proposalPerson.getRolodexId() != null) {
				Map<String, String> conditionMap = new HashMap<String, String>();
				conditionMap.put("rolodexId", proposalPerson.getRolodexId()
						.toString());
				Rolodex rolodex = (Rolodex) businessObjectService
						.findByPrimaryKey(Rolodex.class, conditionMap);
				if (rolodex != null) {
						Sponsor rolodexSponsor = rolodex.getSponsor();
                        Sponsor proposalSponsor = pdDoc.getDevelopmentProposal().getSponsor();
                        if (rolodexSponsor != null&& rolodexSponsor.getSponsorTypeCode() != null
								    && rolodexSponsor.getSponsorTypeCode().equals(
								            proposalSponsor.getSponsorTypeCode())) {
							sponsortType = Integer.parseInt(rolodexSponsor.getSponsorTypeCode());
							sponsorCode = rolodex.getSponsorCode();
							if (sponsortType == 0) {
								seniorKeyPerson
										.setUSGovernmentParticipation(YesNoDataType.Y_YES);
							} else if (sponsortType > 9) {
								seniorKeyPerson
										.setInternationalParticipation(YesNoDataType.Y_YES);
							}
						}
					// if no sponsor in rolodex is found, then use person's
					// country
					if (sponsortType == -1
							&& rolodex.getCountryCode() != null
							&& ((rolodex.getCountryCode().equals(
									COUNTRY_CODE_USA)
									|| rolodex.getCountryCode().equals(
											COUNTRY_CODE_PRI) || rolodex
									.getCountryCode().equals(COUNTRY_CODE_VIR)))) {
						seniorKeyPerson
								.setNASACoItype(CoItypeDataType.CO_I_INSTITUTIONAL_PI);
					} else {
						seniorKeyPerson
								.setNASACoItype(CoItypeDataType.CO_I_CO_PI_NON_U_S_ORGANIZATION_ONLY);
						seniorKeyPerson
								.setInternationalParticipation(YesNoDataType.Y_YES);
					}
				}
			}
		} else {
			seniorKeyPerson.setNASACoItype(CoItypeDataType.COLLABORATOR);
		}
		if (proposalPerson.getProposalPersonRoleId() != null
                && proposalPerson.getProposalPersonRoleId().equals(Constants.KEY_PERSON_ROLE)
                && proposalPerson.getProjectRole().equalsIgnoreCase(COLLABORATOR)) {
            seniorKeyPerson.setNASACoItype(CoItypeDataType.COLLABORATOR);
        }		
		if (sponsorCode != null && sponsortType==0) {
			FederalAgencyDataType.Enum federalAgency = getFederalAgencyDataType(sponsorCode);
			if (federalAgency != null) {
				seniorKeyPerson.setFederalAgency(federalAgency);
			}
		}
		// set total dollar amount requested. There is no budget for rolodex
		// person.
		// seniorKeyPerson.setFederalAgencyDollar(null);
		// Above logic same as in Coeus

		seniorKeyPerson.setSeniorKeyPersonName(globLibV20Generator
				.getHumanNameDataType(proposalPerson));

		AttachedFileDataType commitmentAttachment = getPernonnelAttachments(
				pdDoc, proposalPerson.getPersonId(), proposalPerson
						.getRolodexId(),
				ATTACHMENT_TYPE_STATEMENT_OF_COMMITMENT_DOC);
		if (commitmentAttachment != null) {
			AttachmentGroupMin0Max100DataType attachmentGroup = AttachmentGroupMin0Max100DataType.Factory
					.newInstance();
			AttachedFileDataType[] commitmentAttachmentArray = new AttachedFileDataType[1];
			commitmentAttachmentArray[0] = commitmentAttachment;
			attachmentGroup.setAttachedFileArray(commitmentAttachmentArray);
			seniorKeyPerson.setStatementofCommitment(attachmentGroup);
		}

		AttachedFileDataType budgetAttachment = getPernonnelAttachments(pdDoc,
				proposalPerson.getPersonId(), proposalPerson.getRolodexId(),
				ATTACHMENT_TYPE_BUDGET_DETAILS);
		if (budgetAttachment != null) {
			AttachmentGroupMin0Max100DataType attachmentGroup = AttachmentGroupMin0Max100DataType.Factory
					.newInstance();
			AttachedFileDataType[] budgetAttachmentArray = new AttachedFileDataType[1];
			budgetAttachmentArray[0] = budgetAttachment;
			attachmentGroup.setAttachedFileArray(budgetAttachmentArray);
			seniorKeyPerson.setBudgetDetails(attachmentGroup);
		}
		return seniorKeyPerson;
	}

	/**
	 * This method returns SeniorKeyPerson object which contains informations
	 * SeniorKeyPersonName,NASACo-Itype,
	 * USGovernmentParticipation,FederalAgency,FederalAgencyDollar,InternationalParticipation,
	 * StatementofCommitment,BudgetDetails based on proposalPerson
	 * 
	 * @param proposalPerson(ProposalPerson)
	 * @return seniorKeyPerson
	 *         (NASASeniorKeyPersonSupplementalDataSheet.SeniorKeyPerson)
	 *         corresponding to the ProposalPerson object.
	 */
	private SeniorKeyPerson getExtraPerson(ProposalPerson proposalPerson) {
		SeniorKeyPerson seniorKeyPerson = SeniorKeyPerson.Factory.newInstance();
		seniorKeyPerson.setInternationalParticipation(YesNoDataType.N_NO); // default
		seniorKeyPerson.setUSGovernmentParticipation(YesNoDataType.N_NO); // default
		int sponsortType = -1;
		String sponsorCode = null;
		if (proposalPerson.getProposalPersonRoleId() != null
				&& proposalPerson.getProposalPersonRoleId()
						.equals(COLLABORATOR)) {
			seniorKeyPerson.setNASACoItype(CoItypeDataType.COLLABORATOR);
		}
		if (s2sBudgetCalculatorService.isPersonNonMITPerson(proposalPerson)) {
			if (proposalPerson.getRolodexId() != null) {
				Map<String, String> conditionMap = new HashMap<String, String>();
				conditionMap.put("rolodexId", proposalPerson.getRolodexId()
						.toString());
				Rolodex rolodex = (Rolodex) businessObjectService
						.findByPrimaryKey(Rolodex.class, conditionMap);
				if (rolodex != null) {
					if (rolodex.getSponsorCode() != null
							&& rolodex.getSponsorCode().equals(
									pdDoc.getDevelopmentProposal()
											.getSponsorCode())) {
						if (rolodex.getSponsor() != null
								&& rolodex.getSponsor().getSponsorTypeCode() != null
								&& Integer.parseInt(rolodex.getSponsor()
										.getSponsorTypeCode()) == Integer
										.parseInt(pdDoc
												.getDevelopmentProposal()
												.getSponsor()
												.getSponsorTypeCode())) {
							sponsortType = Integer.parseInt(rolodex
									.getSponsor().getSponsorTypeCode());
							sponsorCode = rolodex.getSponsorCode();
							if (sponsortType == 0) {
								seniorKeyPerson
										.setUSGovernmentParticipation(YesNoDataType.Y_YES);
							} else if (sponsortType > 9) {
								seniorKeyPerson
										.setInternationalParticipation(YesNoDataType.Y_YES);
							}
						}
					}
					// if no sponsor in rolodex is found, then use person's
					// country
					if (sponsortType == -1
							&& rolodex.getCountryCode() != null
							&& ((rolodex.getCountryCode().equals(
									COUNTRY_CODE_USA)
									|| rolodex.getCountryCode().equals(
											COUNTRY_CODE_PRI) || rolodex
									.getCountryCode().equals(COUNTRY_CODE_VIR)))) {
						seniorKeyPerson
								.setNASACoItype(CoItypeDataType.CO_I_INSTITUTIONAL_PI);
					} else {
						seniorKeyPerson
								.setNASACoItype(CoItypeDataType.CO_I_CO_PI_NON_U_S_ORGANIZATION_ONLY);
						seniorKeyPerson
								.setInternationalParticipation(YesNoDataType.Y_YES);
					}
				}
			}
		} else {
			seniorKeyPerson.setNASACoItype(CoItypeDataType.CO_I);
		}
		if (sponsorCode != null) {
			FederalAgencyDataType.Enum federalAgency = getFederalAgencyDataType(sponsorCode);
			if (federalAgency != null) {
				seniorKeyPerson.setFederalAgency(federalAgency);
			}
		}
		// set total dollar amount requested. There is no budget for rolodex
		// person.
		// seniorKeyPerson.setFederalAgencyDollar(null);
		// Above logic same as in Coeus

		seniorKeyPerson.setSeniorKeyPersonName(globLibV20Generator
				.getHumanNameDataType(proposalPerson));

		AttachedFileDataType commitmentAttachment = getPernonnelAttachments(
				pdDoc, proposalPerson.getPersonId(), proposalPerson
						.getRolodexId(),
				ATTACHMENT_TYPE_STATEMENT_OF_COMMITMENT_DOC);
		if (commitmentAttachment != null) {
			AttachmentGroupMin0Max100DataType attachmentGroup = AttachmentGroupMin0Max100DataType.Factory
					.newInstance();
			AttachedFileDataType[] commitmentAttachmentArray = new AttachedFileDataType[1];
			commitmentAttachmentArray[0] = commitmentAttachment;
			attachmentGroup.setAttachedFileArray(commitmentAttachmentArray);
			seniorKeyPerson.setStatementofCommitment(attachmentGroup);
		}

		AttachedFileDataType budgetAttachment = getPernonnelAttachments(pdDoc,
				proposalPerson.getPersonId(), proposalPerson.getRolodexId(),
				ATTACHMENT_TYPE_BUDGET_DETAILS);
		if (budgetAttachment != null) {
			AttachmentGroupMin0Max100DataType attachmentGroup = AttachmentGroupMin0Max100DataType.Factory
					.newInstance();
			AttachedFileDataType[] budgetAttachmentArray = new AttachedFileDataType[1];
			budgetAttachmentArray[0] = budgetAttachment;
			attachmentGroup.setAttachedFileArray(budgetAttachmentArray);
			seniorKeyPerson.setBudgetDetails(attachmentGroup);
		}
		return seniorKeyPerson;
	}

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link NASASeniorKeyPersonSupplementalDataSheetDocument} by populating
	 * data from the given {@link ProposalDevelopmentDocument}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocument}
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
	 */
	public XmlObject getFormObject(
			ProposalDevelopmentDocument proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getNasaSeniorKeyPersonSupplementalDataSheetDocument();
	}

	/**
	 * This method typecasts the given {@link XmlObject} to the required
	 * generator type and returns back the document of that generator type.
	 * 
	 * @param xmlObject
	 *            which needs to be converted to the document type of the
	 *            required generator
	 * @return {@link XmlObject} document of the required generator type
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(XmlObject)
	 */
	public XmlObject getFormObject(XmlObject xmlObject) {
		NASASeniorKeyPersonSupplementalDataSheetDocument nasaSeniorKPDoc = NASASeniorKeyPersonSupplementalDataSheetDocument.Factory
				.newInstance();
		NASASeniorKeyPersonSupplementalDataSheet nasaSeniorKeyPersonSupplementalDataSheet = NASASeniorKeyPersonSupplementalDataSheet.Factory
				.newInstance();
		nasaSeniorKPDoc
				.setNASASeniorKeyPersonSupplementalDataSheet(nasaSeniorKeyPersonSupplementalDataSheet);
		return nasaSeniorKPDoc;
	}

}
