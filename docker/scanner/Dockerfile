FROM  java:8-alpine

MAINTAINER Luís Pitta Grós <luis.gros@olx.com>

ENV SONAR_SCANNER_VERSION 2.8
ENV SONAR_SCANNER_HOME /sonar-scanner-$SONAR_SCANNER_VERSION

RUN apk --no-cache add curl

RUN curl -OkL \
    https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip && \
    unzip /sonar-scanner-$SONAR_SCANNER_VERSION.zip && \
    rm /sonar-scanner-$SONAR_SCANNER_VERSION.zip

ENV PATH ${PATH}:$SONAR_SCANNER_HOME/bin

ENTRYPOINT ["sonar-scanner"]
