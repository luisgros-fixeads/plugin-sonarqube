function athena.plugins.sonarqube.server_start()
{
	if $(athena.docker.is_container_running "$SQ_SERVER_CONTAINER"); then
		athena.info "SonarQube Server is already running"
	else
		athena.info "Starting SonarQube Server"
		athena.plugin.use_container server
		athena.docker.add_option "-p 9000:9000 -p 9092:9092"
		athena.docker.add_daemon
		athena.docker.mount_dir $SQ_PLUGINS_DIRECTORY $SQ_SERVER_PLUGINS
		athena.docker.mount_dir $SQ_DATA_DIRECTORY $SQ_SERVER_DATA
		athena.docker.set_no_default_router 1
	fi
}

function athena.plugins.sonarqube.server_stop()
{
	if $(athena.docker.is_container_running "$SQ_SERVER_CONTAINER"); then
		athena.docker.stop_container $SQ_SERVER_CONTAINER
	else
		athena.info "SonarQube Server is not running"
	fi
}

function athena.plugins.sonarqube.server_restart()
{
	athena.info 'Restarting SonarQube Server'
	athena.plugins.sonarqube.server_stop
	athena.plugins.sonarqube.server_start
}

function athena.plugins.sonarqube.scanner()
{
	athena.argument.get_argument_and_remove 1 PROJECT_BASE_DIR

	PROJECT_BASE_DIR=$(athena.fs.get_full_path "$PROJECT_BASE_DIR")
	SQ_SERVER_IP=$(athena.docker.get_ip_for_container "$SQ_SERVER_CONTAINER")

	athena.argument.prepend_to_arguments "-Dsonar.host.url=http://$SQ_SERVER_IP:9000"
	athena.argument.prepend_to_arguments "-Dsonar.projectBaseDir=$PROJECT_BASE_DIR"
	athena.argument.prepend_to_arguments "-Dsonar.projectKey=athena-sonarqube-project"
	athena.argument.prepend_to_arguments "-Dsonar.sources=$PROJECT_BASE_DIR"

	athena.plugin.use_container scanner
	athena.docker.mount $PROJECT_BASE_DIR $PROJECT_BASE_DIR
	athena.docker.set_no_default_router 1
}

function athena.plugins.sonarqube.scanner_stop()
{
	if $(athena.docker.is_container_running "$SQ_SCANNER_CONTAINER"); then
		athena.docker.stop_container $SQ_SCANNER_CONTAINER
	fi
}

function athena.plugins.sonarqube.plugins_install()
{
	SQ_PLUGIN_UPDATE=false

	if [ -f $SQ_PLUGIN_JAR ]; then
		read -p "Plugin $SQ_PLUGIN_NAME already exists, do you want to replace it (Y/n):" yn
		case $yn in
		    [Nn]*)
		        athena.ok 'Nothing to do'
		        ;;
	        * )
	            SQ_PLUGIN_UPDATE=true
	            athena.plugins.sonarqube.install_plugin
	            ;;
        esac
    else
	    athena.plugins.sonarqube.install_plugin
    fi
}

function athena.plugins.sonarqube.install_plugin()
{
	athena.info 'Installing plugin'

	if $(curl -sfkL -o "$SQ_PLUGIN_JAR" "$(athena.arg 2)"); then
		if $SQ_PLUGIN_UPDATE; then
			athena.ok "Plugin $SQ_PLUGIN_NAME was updated"
		else
			athena.ok "Plugin $SQ_PLUGIN_NAME installed"
		fi

		athena.argument.set_arguments restart
		athena.plugin.run_command server $(athena.plugin.get_plg_cmd_dir);
    else
		athena.error "Unable to install plugin $SQ_PLUGIN_NAME"
	fi
}

function athena.plugins.sonarqube.plugins_remove()
{
    if [ ! -f $SQ_PLUGIN_JAR ]; then
        athena.error "Plugin $SQ_PLUGIN_NAME is not installed"
	elif $(rm "$SQ_PLUGIN_JAR"); then
		athena.ok "Plugin $SQ_PLUGIN_NAME was removed"
	    athena.argument.set_arguments restart
		athena.plugin.run_command server $(athena.plugin.get_plg_cmd_dir);
	else
		athena.ok "Unable to remove plugin $SQ_PLUGIN_NAME"
	fi
}

function athena.plugins.sonarqube.plugins_list()
{
    for plugin in "$SQ_PLUGINS_DIRECTORY"/*
    do
      plugins+=$(basename "$plugin\n")
    done

    printf "$(cat <<EOF
Installed plugins:
        $plugins
EOF
)"
}
