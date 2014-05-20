package org.kuali.coeus.common.api.question;

import org.kuali.coeus.sys.api.model.IdentifiableNumeric;

public interface QuestionnaireQuestionContract extends IdentifiableNumeric {

    public Long getQuestionnaireId();

    public Long getQuestionId();

    public Integer getQuestionNumber();

    public Integer getParentQuestionNumber();

    public boolean getConditionFlag();

    public String getCondition();

    public String getConditionValue();

    public Integer getQuestionSeqNumber();

    public String getRuleId();

    public QuestionContract getQuestion();
}
