FROM sonarqube:6.1-alpine

MAINTAINER Luís Pitta Grós <luis.gros@olx.com>

COPY run.sh $SONARQUBE_HOME/bin/

ENV PATH ${PATH}:$SONARQUBE_HOME/bin

ENTRYPOINT ["run.sh"]
