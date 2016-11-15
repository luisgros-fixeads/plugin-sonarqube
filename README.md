## Athena SonarQube Plugin

This plugin tries to simplify the automation of your [SonarQube](http://docs.sonarqube.org/display/SONAR/Architecture+and+Integration) code analysis, it comes
with SonarQube Server, SonarQube Scanner and 4 plugins (PHP, CSS, Javascript and GitHub) 
pre-installed to get you started.

### How to

#### Install Athena
```sh
brew tap athena-oss/tap
brew install athena
# or
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
./athena sonarqube scanner <project-root-directory> [<sonar-scanner-options>]
./athena sonarqube plugins <install|remove> <plugin-jar-url>
```

#### Examples

##### Starting SonarQube Server
```sh
./athena sonarqube server start
```
This will provide you with a link to access SonarQube's web interface

##### Running a code analysis
```sh
./athena sonarqube scanner ~/myproject/
```
After you will be able to access results on SonarQube's web interface, sometimes
results might take a little bit to display depending on project size, so, be patient.

##### Using SonarQube Scanner options to only analyze certain files and directories
```sh
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.sources=vendor/mycode/script.php, somelib/file.php, web/
```

##### Using a different SonarQube Server
```sh  
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.host.url=http://othersonarserver:9000
           -Dsonar.sources=vendor/mylib/, public/example.php
```

Instead of passing scanner options you can create a [sonar-project.properties](sonar-project.properties) file inside your project's root directory
```sh
# Use basic example file provided by this plugin as a skeleton
curl -o /home/example/someproject/sonar-project.properties \
  https://raw.githubusercontent.com/luisgros-fixeads/plugin-sonarqube/master/sonar-project.properties
  
./athena sonarqube scanner /home/example/someproject/
```

Installing and removing [SonarQube Plugins](http://docs.sonarqube.org/display/PLUG/Plugin+Library)
```sh
# http://docs.sonarqube.org/display/PLUG/SWIFT+Plugin#lastVersion

./athena sonarqube plugins install \
https://sonarsource.bintray.com/CommercialDistribution/sonar-swift-plugin/sonar-swift-plugin-1.7.jar

./athena sonarqube plugins remove \
https://sonarsource.bintray.com/CommercialDistribution/sonar-swift-plugin/sonar-swift-plugin-1.7.jar
# or
./athena sonarqube plugins remove sonar-swift-plugin-1.7.jar

# Listing installed plugins
./athena sonarqube plugins
```

Athena SonarQube Plugin comes bundled with the following plugins:
* [SonarQube PHP Plugin](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)
* [SonarQube GitHub Plugin](http://docs.sonarqube.org/display/PLUG/GitHub+Plugin)
* [SonarQube CSS/Less Plugin](https://github.com/racodond/sonar-css-plugin#readme)
* [SonarQube JavaScript Plugin](https://github.com/SonarSource/sonar-javascript#readme)

#### Resources

[Athena](https://github.com/athena-oss/athena)

[SonarQube Server User Guide](http://docs.sonarqube.org/display/SONAR/User+Guide)

[Analyzing with SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube Plugin Library](http://docs.sonarqube.org/display/PLUG/Plugin+Library)
