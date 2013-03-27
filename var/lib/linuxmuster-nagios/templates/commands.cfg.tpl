################################################################################
# Sample command definitions for Nagios
################################################################################


################################################################################
# COMMAND DEFINITIONS
#
# SYNTAX:
#
#	define command{
#               template      <templatename>
#		name          <objectname>
#               command_name  <commandname>
#               command_line  <commandline>
#               }
#
# WHERE:
#
# <templatename> = object name of another command definition that should be
#                  used as a template for this definition (optional)
# <objectname>   = object name of command definition, referenced by other
#                  command definitions that use it as a template (optional)
# <commandname>  = name of the command, as recognized/used by Nagios
# <commandline>  = command line
#
################################################################################




################################################################################
#
# HOST CHECK COMMANDS
#
################################################################################

# On Debian, check-host-alive is being defined from within the
# nagios-plugins package


################################################################################
#
# NOTIFICATION COMMANDS
#
# These are some example notification commands.  They may or may not work on
# your system without modification.  As an example, some systems will require 
# you to use "/usr/bin/mailx" instead of "/usr/bin/mail" in the commands below.
#
################################################################################


# 'host-notify-by-email' command definition
define command{
	command_name	host-notify-by-email
	command_line    /usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTALIAS$\nState: $HOSTSTATE$ for $HOSTDURATION$\nAddress: $HOSTADDRESS$\nInfo:\n\n$HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n\nACK by: $HOSTACKAUTHOR$\nComment: $HOSTACKCOMMENT$\n" | /usr/bin/mail -s "** $NOTIFICATIONTYPE$ alert $NOTIFICATIONNUMBER$ - $HOSTALIAS$ host is $HOSTSTATE$ **" $CONTACTEMAIL$
	}


# 'host-notify-by-epager' command definition
define command{
	command_name	host-notify-by-epager
	command_line	/usr/bin/printf "%b" "Host '$HOSTALIAS$' is $HOSTSTATE$\nInfo: $HOSTOUTPUT$\nTime: $LONGDATETIME$" | /usr/bin/mail -s "$NOTIFICATIONTYPE$ alert - Host $HOSTNAME$ is $HOSTSTATE$" $CONTACTPAGER$
	}

# 'notify-by-email' command definition
define command{
	command_name	notify-by-email
	command_line    /usr/bin/printf "%b" "***** Nagios  *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nState: $SERVICESTATE$ for $SERVICEDURATION$\nAddress: $HOSTADDRESS$\n\nInfo:\n\n$SERVICEOUTPUT$\n\nDate/Time: $LONGDATETIME$\n\nACK by: $SERVICEACKAUTHOR$\nComment: $SERVICEACKCOMMENT$\n" | /usr/bin/mail -s "** $NOTIFICATIONTYPE$ alert $NOTIFICATIONNUMBER$ - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$
	}


# 'notify-by-epager' command definition
define command{
	command_name	notify-by-epager
	command_line	/usr/bin/printf "%b" "Service: $SERVICEDESC$\nHost: $HOSTNAME$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\nInfo: $SERVICEOUTPUT$\nDate: $LONGDATETIME$" | /usr/bin/mail -s "$NOTIFICATIONTYPE$: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$" $CONTACTPAGER$
	}





################################################################################
#
# PERFORMANCE DATA COMMANDS
#
# These are sample performance data commands that can be used to send performance
# data output to two text files (one for hosts, another for services).  If you
# plan on simply writing performance data out to a file, consider using the 
# host_perfdata_file and service_perfdata_file options in the main config file.
#
################################################################################


# 'process-host-perfdata' command definition
define command{
	command_name	process-host-perfdata
	command_line	/usr/bin/printf "%b" "$LASTHOSTCHECK$\t$HOSTNAME$\t$HOSTSTATE$\t$HOSTATTEMPT$\t$HOSTSTATETYPE$\t$HOSTEXECUTIONTIME$\t$HOSTOUTPUT$\t$HOSTPERFDATA$\n" >> /var/lib/nagios2/host-perfdata.out
	}


# 'process-service-perfdata' command definition
define command{
	command_name	process-service-perfdata
	command_line	/usr/bin/printf "%b" "$LASTSERVICECHECK$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICESTATE$\t$SERVICEATTEMPT$\t$SERVICESTATETYPE$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$\n" >> /var/lib/nagios2/service-perfdata.out
	}


