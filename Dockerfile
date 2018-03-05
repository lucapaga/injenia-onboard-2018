FROM python:2.7
MAINTAINER luca.paganelli@injenia.it

RUN apt-get update && \
    mkdir -p /onboard && \
    mkdir -p /onboard/01-setup && \
    mkdir -p /onboard/02-pubsub && \
    mkdir -p /onboard/03-bigquery-preparation && \
    mkdir -p /onboard/04-dataflow && \
    mkdir -p /onboard/05-iot-core && \
    mkdir -p /onboard/06-device && \
    mkdir -p /onboard/ca && \
    mkdir -p /onboard/device_keys && \
    mkdir -p /onboard/service-account

WORKDIR /onboard

COPY 01-setup ./01-setup
COPY 02-pubsub ./02-pubsub
COPY 03-bigquery-preparation ./03-bigquery-preparation
COPY 04-dataflow ./04-dataflow
COPY 05-iot-core ./05-iot-core
COPY 06-device ./06-device
COPY ca ./ca
COPY device_keys ./device_keys
COPY service-account ./service-account
COPY src ./src

RUN  find ./ -name \*.sh | xargs chmod u+x

#WORKDIR /onboard/src/python/g-mqtt-client-v2

RUN cd /onboard/src/python/g-mqtt-client-v2 && \
    pip install -r requirements.txt

WORKDIR /onboard/06-device

