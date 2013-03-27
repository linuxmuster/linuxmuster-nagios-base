
define serviceescalation {
	host_name      		####SERVERNAME####
	service_description	####REMOTE_ESCALATION_SERVICENAME####
	first_notification	5
	last_notification       5
	notification_interval   60
	contact_groups		external-support-group
	}
