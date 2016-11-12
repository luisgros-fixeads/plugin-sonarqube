FROM openjdk:8-jre

MAINTAINER Luís Pitta Grós <luis.gros@olx.com>

ENV TZ=Europe/Lisbon
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV SONAR_SCANNER_VERSION=2.8
ENV SONAR_SCANNER_HOME="/sonar-scanner"

WORKDIR "/"

RUN  curl --insecure -OL \
"https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip" 
RUN unzip "/sonar-scanner-$SONAR_SCANNER_VERSION.zip" && \
mv "sonar-scanner-$SONAR_SCANNER_VERSION" "sonar-scanner" && \
rm "/sonar-scanner-$SONAR_SCANNER_VERSION.zip"

ENV PATH=${PATH}:"$SONAR_SCANNER_HOME/bin"
