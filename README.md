## Athena SonarQube Plugin

### How to

#### Install Athena
```sh
brew tap athena-oss/tap
brew install athena
# OR
git clone https://github.com/athena-oss/athena.git
```
[More info here](https://github.com/athena-oss/athena)

#### Install the SonarQube plugin
```sh
./athena plugins install sonarqube git@github.com:luisgros-fixeads/plugin-sonarqube.git
```

#### Usage
```sh
# Start SonarQube Server
./athena sonarqube server start
# Customize and place the example file in this plugin "sonar-project.properties" inside 
# your project's root dir and then run SonarQube Scanner
./athena sonarqube scanner /absolute/path/to/php/project/to/be/analysed
# (Optional) with SonarQube Scanner options
./athena sonarqube scanner /absolute/path/to/project/root/ \
             -Dsonar.sources=vendor/mycode/to/be/analysed/ \
             -Dsonar.host.url=http://othersonarqube.server.com:9000
```

#### Resources

[Athena](https://github.com/athena-oss/athena)

[SonarQube Server User Guide](http://docs.sonarqube.org/display/SONAR/User+Guide)

[Analyzing with SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube PHP Plugin](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube GitHub Plugin](http://docs.sonarqube.org/display/PLUG/GitHub+Plugin)
