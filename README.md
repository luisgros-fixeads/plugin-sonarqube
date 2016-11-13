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

#### Example

Starting SonarQube Server
```sh
./athena sonarqube server start
```

Running a scan
```sh
./athena sonarqube scanner ~/myproject/root/dir
```

Using SonarQube Scanner options to only analyze certain files and directories
```sh
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.sources=vendor/mycode/script.php, somelib/file.php, web/
```

Using a different SonarQube Server
```sh  
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.host.url=http://othersonarserver:9000
           -Dsonar.sources=vendor/mylib/, pubic/example.php
```

Creating a [sonar-project.properties](sonar-project.properties) file inside your project's root directory
```sh
curl -o /home/example/myproject/sonar-project.properties \
  https://raw.githubusercontent.com/luisgros-fixeads/plugin-sonarqube/master/sonar-project.properties
  
./athena sonarqube scanner /home/example/myproject/
```

#### Resources

[Athena](https://github.com/athena-oss/athena)

[SonarQube Server User Guide](http://docs.sonarqube.org/display/SONAR/User+Guide)

[Analyzing with SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube PHP Plugin](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube GitHub Plugin](http://docs.sonarqube.org/display/PLUG/GitHub+Plugin)
