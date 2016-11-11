CMD_DESCRIPTION="SonarQube Server"

athena.usage 1 "<start|stop|restart>"

# arguments are found below
option="$(athena.arg 1)"

athena.pop_args 1

export SQSERVER_CONTAINER='athena-plugin-sonarqube-sonarqube6.1-alpine-0'
export SQSERVER_IP=$(athena.os.get_host_ip)

if [ $option = "start" ]; then
	athena.plugins.sonarqube.server_start
elif [ $option = "stop" ]; then
	athena.plugins.sonarqube.server_stop
elif [ $option = "restart" ]; then
	athena.plugins.sonarqube.server_restart
fi

