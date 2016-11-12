export SQ_SERVER_CONTAINER=$(athena.plugin.get_prefix_for_container_name)-server-$(athena.os.get_instance)
export SQ_SERVER_DOCKERFILE=$(athena.plugin.get_plg_docker_dir)/server
export SQ_SCANNER_CONTAINER=$(athena.plugin.get_prefix_for_container_name)-scanner-$(athena.os.get_instance)
export SQ_SCANNER_DOCKERFILE=$(athena.plugin.get_plg_docker_dir)/scanner
