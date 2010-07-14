/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.irb.onlinereview.authorization;

import org.kuali.kra.authorization.Task;
import org.kuali.kra.infrastructure.TaskGroupName;
import org.kuali.kra.irb.onlinereview.ProtocolOnlineReview;

/**
 * A Protocol Online Review Task is a task that performs an action against a
 * Protocol Online Review.  To assist authorization, the ProtocolOnlineReview is available.
 */
public final class ProtocolOnlineReviewTask extends Task {
    
    private ProtocolOnlineReview protocolOnlineReview;
    
    /**
     * Constructs a ProtocolOnlineReviewTask.
     * @param taskName the name of the task
     * @param protocolOnlineReview the Protocol
     */
    public ProtocolOnlineReviewTask(String taskName, ProtocolOnlineReview protocolOnlineReview) {
        super(TaskGroupName.PROTOCOL_ONLINEREVIEW, taskName);
        this.protocolOnlineReview = protocolOnlineReview;
    }
    
    public ProtocolOnlineReviewTask(String taskName, ProtocolOnlineReview protocolOnlineReview, String genericTaskName) {
        super(TaskGroupName.PROTOCOL_ONLINEREVIEW, taskName, genericTaskName);
        this.protocolOnlineReview = protocolOnlineReview;
    }

    /**
     * Get the ProtocolOnlineReview.
     * @return the ProtocolOnlineReview
     */
    public ProtocolOnlineReview getProtocolOnlineReview() {
        return protocolOnlineReview;
    }
}
