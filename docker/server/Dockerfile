FROM sonarqube:6.1-alpine

RUN apk --update add \
          curl \
          tmux \
          htop && \
          apk del build-base && \
          rm -rf /var/cache/apk/*

ADD https://sonarsource.bintray.com/Distribution/sonar-php-plugin/sonar-php-plugin-2.9.0.1664.jar "/opt/sonarqube/extensions/plugins"
ADD https://sonarsource.bintray.com/Distribution/sonar-github-plugin/sonar-github-plugin-1.3.jar "/opt/sonarqube/extensions/plugins"

COPY run.sh $SONARQUBE_HOME/bin/

ENV PATH=${PATH}:"$SONARQUBE_HOME/bin"

ENTRYPOINT ["run.sh"]
