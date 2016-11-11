CMD_DESCRIPTION="SonarQube Server"

athena.usage 1 "<start|stop|restart>"

# arguments are found below
option="$(athena.arg 1)"

athena.pop_args 1

export SQSERVER_CONTAINER='athena-plugin-sonarqube-sonarqube6.1-alpine-0'
export SQSERVER_IP=$(athena.os.get_host_ip)


if [ $option = "start" ]; then
	if athena.docker.is_container_running $SQSERVER_CONTAINER; then
		athena.info "SonarQube Server is already running"
	else
		athena.info "Starting SonarQube Server"
		athena.plugin.use_external_container_as_daemon "sonarqube:6.1-alpine"
		athena.docker.add_option "-p 9000:9000"
	fi
elif [ $option = "stop" ]; then
	if athena.docker.is_container_running $SQSERVER_CONTAINER; then
		athena.docker.stop_container $SQSERVER_CONTAINER
	else
		athena.info "SonarQube Server is not running"
	fi
elif [ $option = "restart" ]; then
	if athena.docker.is_container_running $SQSERVER_CONTAINER; then
		athena.docker.stop_container $SQSERVER_CONTAINER
	fi

	athena.info "Starting SonarQube Server"
	athena.plugin.use_external_container_as_daemon "sonarqube:6.1-alpine"
	athena.docker.add_option "-p 9000:9000"
fi

