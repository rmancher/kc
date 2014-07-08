/*
 * Copyright 2005-2014 The Kuali Foundation.
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


import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ApplicationType;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ApplicationType.TypeOfApplication;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.*;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.HumanSubjectSection.InclusionOfChildren;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.HumanSubjectSection.InclusionOfWomenAndMinorities;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.HumanSubjectSection.ProtectionOfHumanSubjects;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.HumanSubjectSection.TargetedPlannedEnrollmentTable;
import gov.grants.apply.forms.phs398ResearchPlanV11.PHS398ResearchPlanDocument.PHS398ResearchPlan.ResearchPlanAttachments.OtherResearchPlanSections.*;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.attachmentsV10.AttachmentGroupMin0Max100DataType;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.propdev.api.attachment.NarrativeContract;
import org.kuali.kra.s2s.generator.FormGenerator;
import org.kuali.kra.s2s.util.S2SConstants;

import java.util.ArrayList;
import java.util.List;

/**
 * Class for generating the XML object for grants.gov PHS398ResearchPlanV1_1. Form is generated using XMLBean classes and is based
 * on PHS398ResearchPlanV1_1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("PHS398ResearchPlanV1_1Generator")
public class PHS398ResearchPlanV1_1Generator extends PHS398ResearchPlanBaseGenerator {


    /**
     * 
     * This method gives the list of attachments for PHS398ResearchPlan form
     * 
     * @return phsResearchPlanDocument {@link XmlObject} of type PHS398ResearchPlanDocument.
     */
    private PHS398ResearchPlanDocument getPHS398ResearchPlan() {

        PHS398ResearchPlanDocument phsResearchPlanDocument = PHS398ResearchPlanDocument.Factory.newInstance();
        PHS398ResearchPlan phsResearchPlan = PHS398ResearchPlan.Factory.newInstance();
        phsResearchPlan.setFormVersion(S2SConstants.FORMVERSION_1_1);

        phsResearchPlan.setApplicationType(getApplicationType());
        ResearchPlanAttachments researchPlanAttachments = ResearchPlanAttachments.Factory.newInstance();
        HumanSubjectSection humanSubjectSection = HumanSubjectSection.Factory.newInstance();
        OtherResearchPlanSections otherResearchPlanSections = OtherResearchPlanSections.Factory.newInstance();
        AttachedFileDataType attachedFileDataType = null;
        for (NarrativeContract narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
            if (narrative.getNarrativeType().getCode() != null) {
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == INTRODUCTION_TO_APPLICATION) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    IntroductionToApplication introductionToApplication = IntroductionToApplication.Factory.newInstance();
                    introductionToApplication.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setIntroductionToApplication(introductionToApplication);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == SPECIFIC_AIMS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    SpecificAims specificAims = SpecificAims.Factory.newInstance();
                    specificAims.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setSpecificAims(specificAims);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == BACKGROUND_SIGNIFICANCE) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    BackgroundSignificance backgroundSignificance = BackgroundSignificance.Factory.newInstance();
                    backgroundSignificance.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setBackgroundSignificance(backgroundSignificance);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == PROGRESS_REPORT) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ProgressReport progressReport = ProgressReport.Factory.newInstance();
                    progressReport.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setProgressReport(progressReport);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == RESEARCH_DESIGN_METHODS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ResearchDesignMethods researchDesignMethods = ResearchDesignMethods.Factory.newInstance();
                    researchDesignMethods.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setResearchDesignMethods(researchDesignMethods);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == INCLUSION_ENROLLMENT_REPORT) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    InclusionEnrollmentReport inclusionEnrollmentReport = InclusionEnrollmentReport.Factory.newInstance();
                    inclusionEnrollmentReport.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setInclusionEnrollmentReport(inclusionEnrollmentReport);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == PROGRESS_REPORT_PUBLICATION_LIST) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ProgressReportPublicationList progressReportPublicationList = ProgressReportPublicationList.Factory
                            .newInstance();
                    progressReportPublicationList.setAttFile(attachedFileDataType);
                    researchPlanAttachments.setProgressReportPublicationList(progressReportPublicationList);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == PROTECTION_OF_HUMAN_SUBJECTS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ProtectionOfHumanSubjects protectionOfHumanSubjects = ProtectionOfHumanSubjects.Factory.newInstance();
                    protectionOfHumanSubjects.setAttFile(attachedFileDataType);
                    humanSubjectSection.setProtectionOfHumanSubjects(protectionOfHumanSubjects);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == INCLUSION_OF_WOMEN_AND_MINORITIES) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    InclusionOfWomenAndMinorities inclusionOfWomenAndMinorities = InclusionOfWomenAndMinorities.Factory
                            .newInstance();
                    inclusionOfWomenAndMinorities.setAttFile(attachedFileDataType);
                    humanSubjectSection.setInclusionOfWomenAndMinorities(inclusionOfWomenAndMinorities);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == TARGETED_PLANNED_ENROLLMENT_TABLE) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    TargetedPlannedEnrollmentTable tarPlannedEnrollmentTable = TargetedPlannedEnrollmentTable.Factory.newInstance();
                    tarPlannedEnrollmentTable.setAttFile(attachedFileDataType);
                    humanSubjectSection.setTargetedPlannedEnrollmentTable(tarPlannedEnrollmentTable);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == INCLUSION_OF_CHILDREN) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    InclusionOfChildren inclusionOfChildren = InclusionOfChildren.Factory.newInstance();
                    inclusionOfChildren.setAttFile(attachedFileDataType);
                    humanSubjectSection.setInclusionOfChildren(inclusionOfChildren);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == VERTEBRATE_ANIMALS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    VertebrateAnimals vertebrateAnimals = VertebrateAnimals.Factory.newInstance();
                    vertebrateAnimals.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setVertebrateAnimals(vertebrateAnimals);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == SELECT_AGENT_RESEARCH) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    SelectAgentResearch selectAgentResearch = SelectAgentResearch.Factory.newInstance();
                    selectAgentResearch.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setSelectAgentResearch(selectAgentResearch);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == MULTIPLE_PI_LEADERSHIP_PLAN) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    MultiplePILeadershipPlan multiplePILeadershipPlan = MultiplePILeadershipPlan.Factory.newInstance();
                    multiplePILeadershipPlan.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setMultiplePILeadershipPlan(multiplePILeadershipPlan);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == CONSORTIUM_CONTRACTUAL_ARRANGEMENTS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ConsortiumContractualArrangements contractualArrangements = ConsortiumContractualArrangements.Factory
                            .newInstance();
                    contractualArrangements.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setConsortiumContractualArrangements(contractualArrangements);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == LETTERS_OF_SUPPORT) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    LettersOfSupport lettersOfSupport = LettersOfSupport.Factory.newInstance();
                    lettersOfSupport.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setLettersOfSupport(lettersOfSupport);
                }
                if (Integer.parseInt(narrative.getNarrativeType().getCode()) == RESOURCE_SHARING_PLANS) {
                    attachedFileDataType = getAttachedFileType(narrative);
                    if(attachedFileDataType == null){
                        continue;
                    }
                    ResourceSharingPlans resourceSharingPlans = ResourceSharingPlans.Factory.newInstance();
                    resourceSharingPlans.setAttFile(attachedFileDataType);
                    otherResearchPlanSections.setResourceSharingPlans(resourceSharingPlans);
                }
            }
        }

        researchPlanAttachments.setHumanSubjectSection(humanSubjectSection);
        researchPlanAttachments.setOtherResearchPlanSections(otherResearchPlanSections);

        AttachmentGroupMin0Max100DataType attachmentGroupMin0Max100DataType = AttachmentGroupMin0Max100DataType.Factory
                .newInstance();
        attachmentGroupMin0Max100DataType.setAttachedFileArray(getAttachedFileDataTypes());
        researchPlanAttachments.setAppendix(attachmentGroupMin0Max100DataType);
        phsResearchPlan.setResearchPlanAttachments(researchPlanAttachments);
        phsResearchPlanDocument.setPHS398ResearchPlan(phsResearchPlan);
        return phsResearchPlanDocument;
    }

    /**
     * 
     * This method is used to get ApplicationType from ProposalDevelopmentDocumentContract
     * 
     * @return ApplicationType corresponding to the proposal type code.
     */
    private ApplicationType getApplicationType() {

        ApplicationType applicationType = ApplicationType.Factory.newInstance();
        if (pdDoc.getDevelopmentProposal().getProposalType() != null && Integer.parseInt(pdDoc.getDevelopmentProposal().getProposalType().getCode()) < PROPOSAL_TYPE_CODE_6) {
            // Check <6 to ensure that if proposalType='TASk ORDER", it must not set. THis is because enum ApplicationType has no
            // entry for TASK ORDER
            TypeOfApplication.Enum typeOfApplication = TypeOfApplication.Enum.forInt(Integer.parseInt(pdDoc.getDevelopmentProposal().getProposalType().getCode()));
            applicationType.setTypeOfApplication(typeOfApplication);
        }
        return applicationType;
    }

    /**
     * 
     * This method is used to get List of appendix attachments from NarrativeAttachment
     * 
     * @return AttachedFileDataType[] array of attachments for the corresponding narrative type code APPENDIX.
     */
    private AttachedFileDataType[] getAttachedFileDataTypes() {
        List<AttachedFileDataType> attachedFileDataTypeList = new ArrayList<AttachedFileDataType>();
        AttachedFileDataType attachedFileDataType = null;
        for (NarrativeContract narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
            if (narrative.getNarrativeType().getCode() != null && Integer.parseInt(narrative.getNarrativeType().getCode()) == APPENDIX) {
            	attachedFileDataType = getAttachedFileType(narrative);
            	if(attachedFileDataType != null){
            		attachedFileDataTypeList.add(attachedFileDataType);
            	}
            }
        }
        return attachedFileDataTypeList.toArray(new AttachedFileDataType[0]);
    }

    /**
     * This method creates {@link XmlObject} of type {@link PHS398ResearchPlanDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param ProposalDevelopmentDocumentContract for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocumentContract)
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract ProposalDevelopmentDocumentContract) {
        this.pdDoc = ProposalDevelopmentDocumentContract;
        return getPHS398ResearchPlan();
    }
}
