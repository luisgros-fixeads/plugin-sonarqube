# Athena SonarQube Plugin

This plugin tries to simplify the automation of your [SonarQube](http://docs.sonarqube.org/display/SONAR/Architecture+and+Integration) code analysis, it comes
with SonarQube Server, SonarQube Scanner and 4 plugins (PHP, CSS, Javascript and GitHub) 
pre-installed to get you started quickly.

## Table of content

- [Installation](#installation)
    - [Athena](#install-athena)
    - [SonarQube Plugin](#install-the-sonarqube-plugin)
- [Usage](#usage)
    - [Commands](#commands)
    - [Start SonarQube Server](#start-the-sonarqube-server)
    - [Run code analysis](#run-a-code-analysis)
- [Examples](#examples)
    - [Using SonarQube Scanner CLI options](#using-sonarqube-scanner-options-to-only-analyze-certain-files-and-directories)
    - [Using a different SonarQube Server](#using-a-different-sonarqube-server)
    - [Installing, removing and listing SonarQube Plugins](#installing-and-removing-sonarqube-plugins)
- [Plugins](#plugins)
- [Resources](#resources)

## Installation
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

## Usage

#### Commands
```sh
./athena sonarqube server <start|stop|restart>
./athena sonarqube scanner <project-root-directory> [<sonar-scanner-options>]
./athena sonarqube plugins <install|remove> <plugin-jar-url>
```
#### Start the SonarQube Server
```sh
./athena sonarqube server start
```
This will provide you with a link to access your SonarQube web interface

#### Run a code analysis
```sh
./athena sonarqube scanner ~/myproject/
``` 
After that you will be able to access your code analysis report on SonarQube web interface, sometimes
reports might take a little bit of time to display on the web interface depending on the project size, be patient.

## Examples

#### Using SonarQube Scanner options to only analyze certain files and directories
```sh
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.sources=vendor/mycode/script.php, somelib/file.php, web/
```

#### Using a different SonarQube Server
```sh  
./athena sonarqube scanner /home/example/myotherproject/ \
           -Dsonar.host.url=http://othersonarserver:9000
           -Dsonar.sources=vendor/mylib/, public/example.php
```

#### Instead of passing scanner options, creating a [sonar-project.properties](https://raw.githubusercontent.com/luisgros-fixeads/plugin-sonarqube/master/sonar-project.properties) file inside your project's root directory
```sh
# Use basic example file provided by this plugin as a skeleton
curl -o /home/example/someproject/sonar-project.properties \
  https://raw.githubusercontent.com/luisgros-fixeads/plugin-sonarqube/master/sonar-project.properties
  
./athena sonarqube scanner /home/example/someproject/
```

#### Installing and removing [SonarQube Plugins](http://docs.sonarqube.org/display/PLUG/Plugin+Library)
```sh
# http://docs.sonarqube.org/display/PLUG/SWIFT+Plugin#lastVersion

# Installing
./athena sonarqube plugins install \
https://sonarsource.bintray.com/CommercialDistribution/sonar-swift-plugin/sonar-swift-plugin-1.7.jar

# Removing
./athena sonarqube plugins remove \
https://sonarsource.bintray.com/CommercialDistribution/sonar-swift-plugin/sonar-swift-plugin-1.7.jar
# or
./athena sonarqube plugins remove sonar-swift-plugin-1.7.jar

# Listing installed plugins
./athena sonarqube plugins
```

## Plugins
Athena SonarQube Plugin comes bundled with the following plugins:
* [SonarQube PHP Plugin](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)
* [SonarQube GitHub Plugin](http://docs.sonarqube.org/display/PLUG/GitHub+Plugin)
* [SonarQube CSS/Less Plugin](https://github.com/racodond/sonar-css-plugin#readme)
* [SonarQube JavaScript Plugin](https://github.com/SonarSource/sonar-javascript#readme)

## Resources

[Athena](https://github.com/athena-oss/athena)

[SonarQube Server User Guide](http://docs.sonarqube.org/display/SONAR/User+Guide)

[Analyzing with SonarQube Scanner](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

[SonarQube Plugin Library](http://docs.sonarqube.org/display/PLUG/Plugin+Library)
