
define service{
	use				linuxmuster-service
	host_name		        ####SERVERNAME####	
	service_description		SYS - disk:####MOUNTPOINT####  
	notification_options		w,u,c,r
	check_command			check_disk!####WARN####%!####CRIT####%!####MOUNTPOINT####
	}

