CMD_DESCRIPTION="SonarQube Scanner"

athena.usage 2  "<install|remove> [<plugin-jar-url>]" "$(athena.plugins.sonarqube.plugins_list)"

SQ_PLUGIN_OPT="$(athena.arg 1)"
SQ_PLUGIN_NAME="$(basename $(athena.arg 2))"
SQ_PLUGIN_JAR=$SQ_PLUGINS_DIRECTORY/$SQ_PLUGIN_NAME

if [ $SQ_PLUGIN_OPT = 'install' ]; then
	athena.plugins.sonarqube.plugins_install
elif [ $SQ_PLUGIN_OPT = 'remove' ]; then
	athena.plugins.sonarqube.plugins_remove
fi
