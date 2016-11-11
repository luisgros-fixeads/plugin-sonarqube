if ! $(curl --output /dev/null --silent --head --fail http://$SQSERVER_IP:9000) && [ $option == 'start' ] || [ $option == 'restart' ]; then
	retry=0
	retries=30

	until $(curl --output /dev/null --silent --head --fail http://$SQSERVER_IP:9000) || [ $retry -ge $retries ]; do
		retry=$((retry + 1))
		printf '.'
		sleep 1
	done

	if [ $retry -lt $retries ]; then
		printf "\n"
		athena.ok "SonarQube Server is running"
		athena.ok "http://$SQSERVER_IP:9000"
	fi
fi

