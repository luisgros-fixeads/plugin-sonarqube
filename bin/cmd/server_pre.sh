CMD_DESCRIPTION="<start|stop|restart>"

athena.usage 1 "$CMD_DESCRIPTION"

SQ_SERVER_OPT="$(athena.arg 1)"

athena.pop_args 1

if [ $SQ_SERVER_OPT = "start" ]; then
	athena.plugins.sonarqube.server_start
elif [ $SQ_SERVER_OPT = "stop" ]; then
	athena.plugins.sonarqube.server_stop
elif [ $SQ_SERVER_OPT = "restart" ]; then
	athena.plugins.sonarqube.server_restart
fi
