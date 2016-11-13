function athena.plugins.sonarqube.server_start()
{
	if $(athena.docker.is_container_running "$SQ_SERVER_CONTAINER"); then
		athena.info "SonarQube Server is already running"
	else
		athena.info "Starting SonarQube Server"
		athena.plugin.use_container 'server'
		athena.docker.add_daemon > /dev/null
		athena.docker.add_option "-p 9000:9000"
		athena.docker.set_no_default_router 1
	fi
}

function athena.plugins.sonarqube.server_stop()
{
	if $(athena.docker.is_container_running "$SQ_SERVER_CONTAINER"); then
		athena.docker.stop_container "$SQ_SERVER_CONTAINER"
	else
		athena.info "SonarQube Server is not running"
	fi
}

function athena.plugins.sonarqube.server_restart()
{              
	athena.plugins.sonarqube.server_stop
	athena.plugins.sonarqube.server_start
}

function athena.plugins.sonarqube.scanner()
{
	SQ_SERVER_IP=$(athena.docker.get_ip_for_container "$SQ_SERVER_CONTAINER")

	athena.argument.get_argument_and_remove 1 PROJECT_BASE_DIR
	PROJECT_BASE_DIR=$(athena.fs.get_full_path "$PROJECT_BASE_DIR")

	athena.argument.prepend_to_arguments "-Dsonar.host.url=http://$SQ_SERVER_IP:9000"
	athena.argument.prepend_to_arguments "-Dsonar.projectBaseDir=$PROJECT_BASE_DIR"

	athena.plugin.use_container 'scanner'
	athena.docker.mount "$PROJECT_BASE_DIR" "$PROJECT_BASE_DIR"
}

function athena.plugins.sonarqube.scanner_stop()
{
	if $(athena.docker.is_container_running "$SQ_SCANNER_CONTAINER"); then
		athena.docker.stop_container "$SQ_SCANNER_CONTAINER"
	fi
}
