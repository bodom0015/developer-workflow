FROM ubuntu:latest
MAINTAINER Mike Lambert <lambert8@illinois.edu>

RUN apt-get -qq update && \
    apt-get -qq install vim nano curl

CMD [ "bash" ]
