<%--
 Copyright 2005-2010 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.osedu.org/licenses/ECL-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<html:form styleId="kualiForm" method="post"
    action="/krmsRuleLookup.do" enctype=""
    onsubmit="return hasFormAlreadyBeenSubmitted();"> 
    <input type="hidden" id="methodToCall"
        name="methodToCall" value="${KrmsRuleLookupForm.methodToCall}"/>
    <input type="hidden" id="nodeIndex"
        name="nodeIndex" value="${KrmsRuleLookupForm.nodeIndex}"/>
    <input type="hidden" id="ruleId"
        name="ruleId" value="${KrmsRuleLookupForm.ruleId}"/>
    <input type="hidden" id="anchor"
        name="anchor" value="${KrmsRuleLookupForm.anchor}"/>


        <!--  <label>Sponsor Code Search</label> -->
        <label>
        <%--
            <input type="image" tabindex="1000000" name="methodToCall.performLookup.(!!org.kuali.kra.questionnaire.question.Question!!).(((questionRefId:newRuleId,question:newQuestion))).((%true%)).anchor" id = "lookupBtn" 
       src="/kra-dev/kr/static/images/searchicon.gif" border="0" class="tinybutton" valign="middle" alt="Multiple Value Search on " title="Multiple Value Search on " />
        --%>
                <input type="image" tabindex="1000000" name="methodToCall.performLookup.(!!org.kuali.kra.krms.KcKrmsRule!!).(((id:ruleId))).((%false%)).anchor" id = "lookupBtn" 
       src="kr/static/images/searchicon.gif" border="0" class="tinybutton" valign="middle" alt="Search on " title="Search on " />
        
            </label><br>
            
            
            <p><a href="javascript:returnRule();window.close();"><b>return data</b></a> <a href="javascript:window.close()">Close</a></p> 
            
            <script type="text/javascript">
       function hasFormAlreadyBeenSubmitted() {
       //    return false;
       }
            
              
                 function returnRule() {
                        var newRuleId = document.getElementById("ruleId").value
                       // alert (newRuleId);
                        if (newRuleId != '') {
                        var nodeIndex = document.getElementById("nodeIndex").value
                        //var mapKey = document.getElementById("mapKey").value
                        //alert(newRuleId+"-"+newQuestionTypeId+"-"+newQuestion+"-")
                        window.opener.returnRule(newRuleId,nodeIndex);
                        }
                 
                 }
                 var lookupBtn=document.getElementById("lookupBtn");
                // alert("methodtocall "+document.getElementById("methodToCall").value);
                 if (document.getElementById("methodToCall").value != "refresh") {
                    lookupBtn.click();
                 } else {
               //   alert("else "+document.getElementById("methodToCall").value);
                    returnRule();
                    window.close();
                 }
            </script>
</html:form>
