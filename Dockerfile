FROM python:2.7-alpine
MAINTAINER luca.paganelli@injenia.it

RUN apk update && \
    mkdir -p /onboard

WORKDIR /onboard

COPY 0* ./
COPY src ./src
