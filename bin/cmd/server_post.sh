if [ $option != 'stop' ]; then
	time=1
	timeout=30

	SQ_SERVER_IP=$(athena.docker.get_ip_for_container "$SQ_SERVER_CONTAINER")

	until $(curl --silent --head --fail --output /dev/null http://$SQ_SERVER_IP:9000) || [ $time -ge $timeout ]; do
		printf '.'
		sleep 1
		((time++))
	done

	if [ $time -lt $timeout ]; then
		printf "\n"
		athena.ok "SonarQube Server is running"
		athena.ok "http://$SQ_SERVER_IP:9000"
	else
		athena.error "Unable to start SonarQube Server"
	fi
fi
