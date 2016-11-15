SQ_SERVER_CONTAINER=$(athena.plugin.get_prefix_for_container_name)-server-$(athena.os.get_instance)
SQ_SERVER_DOCKERFILE=$(athena.plugin.get_plg_docker_dir)/server
SQ_SCANNER_CONTAINER=$(athena.plugin.get_prefix_for_container_name)-scanner-$(athena.os.get_instance)
SQ_SCANNER_DOCKERFILE=$(athena.plugin.get_plg_docker_dir)/scanner
SQ_PLUGINS_DIRECTORY=$(athena.plugin.get_plg_docker_dir)/server/plugins
SQ_DATA_DIRECTORY=$(athena.plugin.get_plg_docker_dir)/server/data
SQ_SERVER_PLUGINS=/opt/sonarqube/extensions/plugins
SQ_SERVER_DATA=/opt/sonarqube/data
