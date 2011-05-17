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
package org.kuali.kra.common.notifications.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kuali.kra.common.notification.bo.NotificationType;
import org.kuali.kra.common.notification.bo.NotificationTypeRecipient;
import org.kuali.kra.common.notifications.bo.KcNotification;
import org.kuali.kra.common.notifications.service.KcNotificationService;
import org.kuali.rice.ken.bo.Notification;
import org.kuali.rice.ken.bo.NotificationChannel;
import org.kuali.rice.ken.bo.NotificationContentType;
import org.kuali.rice.ken.bo.NotificationPriority;
import org.kuali.rice.ken.bo.NotificationProducer;
import org.kuali.rice.ken.bo.NotificationRecipient;
import org.kuali.rice.ken.service.NotificationService;
import org.kuali.rice.ken.util.NotificationConstants;
import org.kuali.rice.kim.bo.role.dto.KimRoleInfo;
import org.kuali.rice.kim.bo.types.dto.AttributeSet;
import org.kuali.rice.kim.service.RoleManagementService;
import org.kuali.rice.kim.service.RoleService;
import org.kuali.rice.kim.util.KimConstants;
import org.kuali.rice.kns.service.BusinessObjectService;

public class KcNotificationServiceImpl implements KcNotificationService {
    
    private BusinessObjectService businessObjectService;
    private NotificationService notificationService;
    private RoleManagementService roleManagementService;
    
    protected NotificationChannel kcNotificationChannel;
    protected NotificationProducer systemNotificationProducer;
    
    public List<KcNotification> getNotifications(String actionCode) {
        Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put("actionCode", actionCode);
        Collection<NotificationType> notificationTypes = businessObjectService.findMatching(NotificationType.class, fieldValues);
        List<KcNotification> kcNotifications = new ArrayList<KcNotification>();
        for (NotificationType notificationType : notificationTypes) {
            KcNotification notification = new KcNotification();
            notification.setMessage(notificationType.getMessage());
            notification.setSubject(notificationType.getSubject());
            notification.setNotificationTypeRecipients(notificationType.getNotificationTypeRecipients());
            kcNotifications.add(notification);
        }
        return kcNotifications;
    }
    
    public void sendNotifications(List<KcNotification> kcNotifications) {
        
        List<Notification> notifications = new ArrayList<Notification>();
        for (KcNotification kcNotification : kcNotifications) {
            Notification notification = new Notification();
            
            NotificationPriority priority = new NotificationPriority();
            priority.setId(new Long(1)); // TODO System param (normal priority)
            notification.setPriority(priority);
            
            NotificationContentType contentType = new NotificationContentType();
            contentType.setId(new Long(1)); // TODO System param
            notification.setContentType(contentType);
            
            notification.setProducer(getSystemNotificationProducer());
            notification.setChannel(getKcNotificationChannel());
            
            notification.setTitle(kcNotification.getSubject());
            notification.setContent("<content>" + kcNotification.getMessage() + "</content>");
            notification.setDeliveryType(NotificationConstants.DELIVERY_TYPES.FYI);
            
            for (NotificationTypeRecipient roleRecipient : kcNotification.getNotificationTypeRecipients()) {
                notification.getRecipients().addAll(resolveRoleRecipients(roleRecipient));
            }
            
            notifications.add(notification);
        }
        
        for (Notification notification : notifications) {
            notificationService.sendNotification(notification);
        }
    
    }
    
    protected NotificationProducer getSystemNotificationProducer() {
        if (this.systemNotificationProducer == null) {
            NotificationProducer np = new NotificationProducer();
            np.setId(new Long(1));
            List<NotificationChannel> notificationChannels = new ArrayList<NotificationChannel>();
            notificationChannels.add(getKcNotificationChannel());
            np.setChannels(notificationChannels);
            this.systemNotificationProducer = np;
        }
        return systemNotificationProducer;
    }
    
    protected NotificationChannel getKcNotificationChannel() {
        if (this.kcNotificationChannel == null) {
            NotificationChannel nc = new NotificationChannel();
            nc.setId(new Long(1000)); // TODO sys parm
            this.kcNotificationChannel = nc;
        }
        return kcNotificationChannel;
    }
    
    protected List<NotificationRecipient> resolveRoleRecipients(NotificationTypeRecipient roleRecipient) {
        List<NotificationRecipient> recipients = new ArrayList<NotificationRecipient>();
        KimRoleInfo role = roleManagementService.getRole(roleRecipient.getRoleId());
        // TODO Some error handling if the role is not found
        
        AttributeSet qualification = new AttributeSet();
        qualification.put(roleRecipient.getRoleQualifier(), roleRecipient.getQualifierValue());
        
        Collection<String> roleMembers = roleManagementService.getRoleMemberPrincipalIds(role.getNamespaceCode(), role.getRoleName(), qualification);
        for (String roleMember : roleMembers) {
            NotificationRecipient recipient = new NotificationRecipient();
            recipient.setRecipientId(roleMember);
            recipient.setRecipientType(KimConstants.KimGroupMemberTypes.PRINCIPAL_MEMBER_TYPE);
            recipients.add(recipient);
        }
        
        return recipients;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void setBusinessObjectService(BusinessObjectService businessObjectService) {
        this.businessObjectService = businessObjectService;
    }

    public void setRoleManagementService(RoleManagementService roleManagementService) {
        this.roleManagementService = roleManagementService;
    }

}
