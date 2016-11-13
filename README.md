## Athena SonarQube Plugin

### How to

#### Install Athena
```sh
brew tap athena-oss/tap
brew install athena
# OR
git clone https://github.com/athena-oss/athena.git
```
[More info](https://github.com/athena-oss/athena)

#### Install the SonarQube plugin
```sh
./athena plugins install sonarqube git@github.com:luisgros-fixeads/plugin-sonarqube.git
```

#### Usage

```sh
./athena sonarqube server <start|stop|restart>
./athena sonarqube scanner <project-base-directory> [<sonar-scanner-options>]
```

#### Examples
```sh
# Start SonarQube Server
./athena sonarqube server start

# Quick
./athena sonarqube scanner ~/myproject/root/dir \
             -Dsonar.projectKey=my-web-project \ 
             -Dsonar.sources=vendor/mylibrary/src/file.php,someother/dir/myscript.php
           
# Using a different SonarQube Server            
./athena sonarqube scanner /home/example/myotherproject/ \
             -Dsonar.projectKey=some-project \ 
             -Dsonar.sources=vendor/mycode/,vendor/somelib/file.php \
             -Dsonar.host.url=http://othersonarserver.com:9000
             
# If you use the same SonarQube Scanner options most of the time you might consider
# placing the example file in this plugin "sonar-project.properties" inside 
# your project's base directory and run the scanner
./athena sonarqube scanner /home/example/myproject/
```

#### Resources

[Athena](https://github.com/athena-oss/athena)

[SonarQube Server User Guide](http://docs.sonarqube.org/display/SONAR/User+Guide)

[Analyzing with SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube PHP Plugin](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube GitHub Plugin](http://docs.sonarqube.org/display/PLUG/GitHub+Plugin)
