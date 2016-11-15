if [ $SQ_SERVER_OPT != stop ]; then
    SQ_SERVER_TIMEOUT=0
	SQ_SERVER_IP=$(athena.docker.get_ip_for_container "$SQ_SERVER_CONTAINER")

	until $(curl -sfIo /dev/null http://$SQ_SERVER_IP:9000) || [ $SQ_SERVER_TIMEOUT -ge 30 ]; do
		printf '.'
		sleep 1
		((SQ_SERVER_TIMEOUT++))
	done

    printf "\n"

	if [ $SQ_SERVER_TIMEOUT -lt 30 ]; then
		athena.ok "SonarQube Server is running \n     http://$SQ_SERVER_IP:9000 \n"
	else
		athena.error "Unable to start SonarQube Server"
	fi
fi
