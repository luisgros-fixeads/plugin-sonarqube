function athena.plugins.sonarqube.server_start() 
{
	if athena.plugins.sonarqube.is_container_running; then
		athena.info "SonarQube Server is already running"
	else
		athena.info "Starting SonarQube Server"
		athena.plugin.use_external_container_as_daemon "sonarqube:6.1-alpine"
		athena.docker.add_option "-p 9000:9000"
	fi
}

function athena.plugins.sonarqube.server_stop()
{
	if athena.plugins.sonarqube.is_container_running; then
		athena.docker.stop_container $SQSERVER_CONTAINER
	else
		athena.info "SonarQube Server is not running"
	fi
}

function athena.plugins.sonarqube.server_restart()
{              
	athena.plugins.sonarqube.server_stop
	athena.plugins.sonarqube.server_start
}

function athena.plugins.sonarqube.is_container_running () 
{
	if athena.docker.is_container_running $SQSERVER_CONTAINER; then
		return 0
	fi
	return 1
}
