FROM java:8-alpine

MAINTAINER Luís Pitta Grós <luis.gros@olx.com>

RUN apk --no-cache add unzip

ENV SONARLINT_DIRECTORY "/sonarlint-cli-2.0"

ADD "https://bintray.com/sonarsource/Distribution/download_file?file_path=sonarlint-cli%2Fsonarlint-cli-2.0.zip" \
    /sonarlint.zip

RUN unzip sonarlint.zip

ENV PATH ${PATH}:$SONARLINT_DIRECTORY/bin

ENTRYPOINT ["sonarlint"]
