package org.kuali.coeus.propdev.impl.budget.person;

import static org.kuali.kra.infrastructure.KeyConstants.QUESTION_BUDGET_PERSONNEL_ASSIGN_LATER_PERIOD_CONFIRMATION;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.budget.framework.core.Budget;
import org.kuali.coeus.common.budget.framework.core.BudgetConstants;
import org.kuali.coeus.common.budget.framework.nonpersonnel.BudgetLineItem;
import org.kuali.coeus.common.budget.framework.period.BudgetPeriod;
import org.kuali.coeus.common.budget.framework.personnel.BudgetPerson;
import org.kuali.coeus.common.budget.framework.personnel.BudgetPersonSalaryDetails;
import org.kuali.coeus.common.budget.framework.personnel.BudgetPersonService;
import org.kuali.coeus.common.budget.framework.personnel.BudgetPersonnelBudgetService;
import org.kuali.coeus.common.budget.framework.personnel.BudgetPersonnelDetails;
import org.kuali.coeus.common.budget.framework.personnel.TbnPerson;
import org.kuali.coeus.common.view.wizard.framework.WizardControllerService;
import org.kuali.coeus.common.view.wizard.framework.WizardResultsDto;
import org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetControllerBase;
import org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetForm;
import org.kuali.coeus.common.framework.person.PersonTypeConstants;
import org.kuali.rice.krad.uif.UifParameters;
import org.kuali.rice.krad.web.form.DialogResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/proposalBudget")
public class ProposalBudgetProjectPersonnelController extends ProposalBudgetControllerBase {

    @Autowired
    @Qualifier("wizardControllerService")
    private WizardControllerService wizardControllerService;

	@Autowired
	@Qualifier("budgetPersonService")
	private BudgetPersonService budgetPersonService;
	
	@Autowired
	@Qualifier("budgetPersonnelBudgetService")
	BudgetPersonnelBudgetService budgetPersonnelBudgetService;

	private static final String EDIT_PROJECT_PERSONNEL_DIALOG_ID = "PropBudget-EditPersonnel-Section";
	private static final String EDIT_PERSONNEL_PERIOD_DIALOG_ID = "PropBudget-EditPersonnelPeriod-Section";
	private static final String EDIT_LINE_ITEM_DETAILS_DIALOG_ID = "PropBudget-AssignPersonnelToPeriodsPage-DetailsAndRates";
	private static final String CONFIRM_PERSONNEL_PERIOD_CHANGES_DIALOG_ID = "PropBudget-ConfirmPersonnelPeriodChangesDialog";
	
	@RequestMapping(params="methodToCall=searchProjectPersonnel")
	public ModelAndView searchProjectPersonnel(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
       form.getAddProjectPersonnelHelper().getResults().clear();
       form.getAddProjectPersonnelHelper().setResults(getWizardControllerService().performWizardSearch(form.getAddProjectPersonnelHelper().getLookupFieldValues(),form.getAddProjectPersonnelHelper().getLineType()));
       return getModelAndViewService().getModelAndView(form);
	}

	@RequestMapping(params="methodToCall=addProjectPersonnel")
	public ModelAndView addProjectPersonnel(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	   if(StringUtils.equals(form.getAddProjectPersonnelHelper().getLineType(), PersonTypeConstants.TBN.getCode())) {
	       for (TbnPerson person : form.getAddProjectPersonnelHelper().getTbnPersons()) {
		       for (int index=0 ; index < person.getQuantity();  index++) {
		    	   BudgetPerson newPerson = new BudgetPerson(person);
	    	       getBudgetPersonService().addBudgetPerson(form.getBudget(), newPerson);
		       }
	       }
	   }else {
	       for (Object object : form.getAddProjectPersonnelHelper().getResults()) {
               WizardResultsDto wizardResult = (WizardResultsDto) object;
               BudgetPerson newBudgetPerson = new BudgetPerson();
	           if (wizardResult.isSelected() == true) {
                   if (wizardResult.isSelected() == true) {
                       if (wizardResult.getKcPerson() != null) {
                           newBudgetPerson.setPersonId(wizardResult.getKcPerson().getPersonId());
                           newBudgetPerson.setPersonName(wizardResult.getKcPerson().getFullName());
                           newBudgetPerson.setUserName(wizardResult.getKcPerson().getUserName());
                       } else if (wizardResult.getRolodex() != null) {
                           newBudgetPerson.setRolodexId(wizardResult.getRolodex().getRolodexId());
                           newBudgetPerson.setPersonName(wizardResult.getRolodex().getFullName());
                       }
                       getBudgetPersonService().addBudgetPerson(form.getBudget(), newBudgetPerson);
                   }
	           }
	       }
	   }
       form.getAddProjectPersonnelHelper().reset();
       return getModelAndViewService().getModelAndView(form);
	}

	@RequestMapping(params="methodToCall=editPersonDetails")
	public ModelAndView editPersonDetails(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	    String selectedLine = form.getActionParamaterValue(UifParameters.SELECTED_LINE_INDEX);
        if (StringUtils.isNotEmpty(selectedLine)) {
		       BudgetPerson editBudgetPerson = form.getBudget().getBudgetPerson(Integer.parseInt(selectedLine));
		       form.getAddProjectPersonnelHelper().setEditBudgetPerson(editBudgetPerson);
		       form.getAddProjectPersonnelHelper().setEditLineIndex(selectedLine);
	    }
    	return getModelAndViewService().showDialog(EDIT_PROJECT_PERSONNEL_DIALOG_ID, true, form);
	}

	@RequestMapping(params="methodToCall=updatePersonDetails")
	public ModelAndView updatePersonDetails(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	    int selectedLine = Integer.parseInt(form.getAddProjectPersonnelHelper().getEditLineIndex());
	    getBudgetPersonService().refreshBudgetPerson(form.getAddProjectPersonnelHelper().getEditBudgetPerson());
	    form.getBudget().getBudgetPersons().set(selectedLine, form.getAddProjectPersonnelHelper().getEditBudgetPerson());
	    getCollectionControllerService().saveLine(form);
	    return getModelAndViewService().getModelAndView(form);
	}
	
	@RequestMapping(params="methodToCall=calculatePersonSalaryDetails")
	public ModelAndView calculatePersonSalaryDetails(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	    Budget budget = form.getBudget();
	    int selectedLine = Integer.parseInt(form.getAddProjectPersonnelHelper().getEditLineIndex());
	    List<BudgetPersonSalaryDetails> budgetPersonSalaryDetails = new ArrayList<BudgetPersonSalaryDetails>();
        budgetPersonSalaryDetails =  budgetPersonnelBudgetService.calculatePersonSalary(budget, selectedLine);        
        form.getBudget().getBudgetPerson(selectedLine).setBudgetPersonSalaryDetails(budgetPersonSalaryDetails);
	    return getModelAndViewService().getModelAndView(form);
	}
	
	@RequestMapping(params="methodToCall=syncFromProposal")
	public ModelAndView syncFromProposal(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	    getBudgetPersonService().synchBudgetPersonsToProposal(form.getBudget());
	    return getModelAndViewService().getModelAndView(form);
	}

	@RequestMapping(params="methodToCall=assignPersonnelToPeriod")
	public ModelAndView assignPersonnelToPeriod(@RequestParam("budgetPeriodId") String budgetPeriodId, @ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
		Budget budget = form.getBudget();
        Long currentTabBudgetPeriodId = Long.parseLong(budgetPeriodId);
		BudgetPeriod budgetPeriod = getBudgetPeriod(currentTabBudgetPeriodId, budget);
        DialogResponse dialogResponse = form.getDialogResponse(CONFIRM_PERSONNEL_PERIOD_CHANGES_DIALOG_ID);
        if(dialogResponse == null && budgetPeriod.getBudgetPeriod() > 1 && !isPersonnelBudgetExists(budgetPeriod)) {
    		String warningMessage = getKualiConfigurationService().getPropertyValueAsString(QUESTION_BUDGET_PERSONNEL_ASSIGN_LATER_PERIOD_CONFIRMATION);
        	form.getAddProjectPersonnelHelper().setBudgetPeriodAssignPersonnelWarningMessage(warningMessage);
        	return getModelAndViewService().showDialog(CONFIRM_PERSONNEL_PERIOD_CHANGES_DIALOG_ID, true, form);
        }else {
            boolean confirmResetDefault = dialogResponse == null ? true : dialogResponse.getResponseAsBoolean();
            if(confirmResetDefault) {
        		form.getAddProjectPersonnelHelper().reset();
        		form.getAddProjectPersonnelHelper().setCurrentTabBudgetPeriod(budgetPeriod);
        		form.getAddProjectPersonnelHelper().getBudgetLineItem().setStartDate(budgetPeriod.getStartDate());
        		form.getAddProjectPersonnelHelper().getBudgetLineItem().setEndDate(budgetPeriod.getEndDate());
            }
    		return getModelAndViewService().getModelAndView(form);
        }
	}
	
	private boolean isPersonnelBudgetExists(BudgetPeriod budgetPeriod) {
		for(BudgetLineItem budgetLineItem : budgetPeriod.getBudgetLineItems()) {
			if(budgetLineItem.getBudgetPersonnelDetailsList().size() > 0) {
				return true;
			}
		}
		return false;
	}
	
	private BudgetPeriod getBudgetPeriod(Long currentTabBudgetPeriodId, Budget budget) {
        for(BudgetPeriod budgetPeriod : budget.getBudgetPeriods()) {
        	if(budgetPeriod.getBudgetPeriodId().equals(currentTabBudgetPeriodId)) {
        		return budgetPeriod;
        	}
        }
        return null;
	}

	@RequestMapping(params="methodToCall=addPersonnelToPeriod")
	public ModelAndView addPersonnelToPeriod(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
		BudgetPeriod currentTabBudgetPeriod = form.getAddProjectPersonnelHelper().getCurrentTabBudgetPeriod();
		BudgetLineItem newBudgetLineItem = form.getAddProjectPersonnelHelper().getBudgetLineItem();
		BudgetPersonnelDetails newBudgetPersonnelDetail = form.getAddProjectPersonnelHelper().getBudgetPersonnelDetail();
		String groupName = form.getAddProjectPersonnelHelper().getBudgetPersonGroupName();
		if(StringUtils.isNoneEmpty(groupName) && groupName != BudgetConstants.BUDGET_PERSONNEL_NEW_GROUP_NAME) {
			newBudgetLineItem.setGroupName(form.getAddProjectPersonnelHelper().getBudgetPersonGroupName());
		}
		getBudgetPersonnelBudgetService().addBudgetPersonnelToPeriod(currentTabBudgetPeriod, newBudgetLineItem, newBudgetPersonnelDetail);
		return getModelAndViewService().getModelAndView(form);
	}

	@RequestMapping(params="methodToCall=editPersonPeriodDetails")
	public ModelAndView editPersonPeriodDetails(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
	    String selectedLine = form.getActionParamaterValue(UifParameters.SELECTED_LINE_INDEX);
        if (StringUtils.isNotEmpty(selectedLine)) {
		       BudgetPersonnelDetails editBudgetPersonnel = form.getBudget().getBudgetPersonnelDetails().get(Integer.parseInt(selectedLine));
		       form.getAddProjectPersonnelHelper().setBudgetPersonnelDetail(editBudgetPersonnel);
		       form.getAddProjectPersonnelHelper().setEditLineIndex(selectedLine);
	    }
    	return getModelAndViewService().showDialog(EDIT_PERSONNEL_PERIOD_DIALOG_ID, true, form);
	}
	
	@RequestMapping(params="methodToCall=calculateCurrentPeriod")
	public ModelAndView calculateCurrentPeriod(@RequestParam("budgetPeriodId") String budgetPeriodId, @ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
		Budget budget = form.getBudget();
	    Long currentTabBudgetPeriodId = Long.parseLong(budgetPeriodId);
		BudgetPeriod currentTabBudgetPeriod = getBudgetPeriod(currentTabBudgetPeriodId, budget);
		getBudgetPersonnelBudgetService().calculateCurrentBudgetPeriod(currentTabBudgetPeriod);
		return getModelAndViewService().getModelAndView(form);
	}

	@RequestMapping(params="methodToCall=editBudgetDetailsAndRates")
	public ModelAndView editBudgetDetailsAndRates(@RequestParam("budgetPeriodId") String budgetPeriodId, @RequestParam("lineItemGroupKey") String lineItemGroupKey, @ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
		Budget budget = form.getBudget();
	    Long currentTabBudgetPeriodId = Long.parseLong(budgetPeriodId);
		BudgetPeriod currentTabBudgetPeriod = getBudgetPeriod(currentTabBudgetPeriodId, budget);
	    BudgetLineItem budgetLineItem = getSelectedBudgetLineItem(lineItemGroupKey, currentTabBudgetPeriod);
	    form.getAddProjectPersonnelHelper().setBudgetLineItem(budgetLineItem);
	    form.getAddProjectPersonnelHelper().setCurrentTabBudgetPeriod(currentTabBudgetPeriod);
    	return getModelAndViewService().showDialog(EDIT_LINE_ITEM_DETAILS_DIALOG_ID, true, form);
	}

	@RequestMapping(params="methodToCall=applyToLaterPeriods")
	public ModelAndView applyToLaterPeriods(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
		Budget budget = form.getBudget();
		BudgetPeriod currentTabBudgetPeriod = form.getAddProjectPersonnelHelper().getCurrentTabBudgetPeriod();
	    BudgetLineItem budgetLineItem = form.getAddProjectPersonnelHelper().getBudgetLineItem();
	    getBudgetCalculationService().applyToLaterPeriods(budget,currentTabBudgetPeriod,budgetLineItem);
		return getModelAndViewService().getModelAndView(form);
	}
				
	private BudgetLineItem getSelectedBudgetLineItem(String lineItemGroupKey, BudgetPeriod budgetPeriod) {
        for(BudgetLineItem budgetLineItem : budgetPeriod.getBudgetLineItems()) {
        	if(budgetLineItem.getLineItemGroupDescription().equals(lineItemGroupKey)) {
        		return budgetLineItem;
        	}
        }
        return null;
	}
	
    public WizardControllerService getWizardControllerService() {
        return wizardControllerService;
    }

    public void setWizardControllerService(WizardControllerService wizardControllerService) {
        this.wizardControllerService = wizardControllerService;
    }

    public BudgetPersonService getBudgetPersonService() {
		return budgetPersonService;
	}

	public void setBudgetPersonService(BudgetPersonService budgetPersonService) {
		this.budgetPersonService = budgetPersonService;
	}

	public BudgetPersonnelBudgetService getBudgetPersonnelBudgetService() {
		return budgetPersonnelBudgetService;
	}

	public void setBudgetPersonnelBudgetService(
			BudgetPersonnelBudgetService budgetPersonnelBudgetService) {
		this.budgetPersonnelBudgetService = budgetPersonnelBudgetService;
	}

}
