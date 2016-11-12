CMD_DESCRIPTION="SonarQube Scanner"

athena.usage 1 "<project-path> [<sonar-scanner-options>]"

option="$(athena.arg 1)"

athena.plugins.sonarqube.scanner
