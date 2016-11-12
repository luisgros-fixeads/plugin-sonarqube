CMD_DESCRIPTION="SonarQube Server"

athena.usage 1 "<start|stop|restart>"

# arguments are found below
option="$(athena.arg 1)"

athena.pop_args 1

if [ $option = "start" ]; then
	athena.plugins.sonarqube.server_start
elif [ $option = "stop" ]; then
	athena.plugins.sonarqube.server_stop
elif [ $option = "restart" ]; then
	athena.plugins.sonarqube.server_restart
fi
