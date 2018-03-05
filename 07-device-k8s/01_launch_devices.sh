#!/bin/bash

# PREREQ:
#  - sudo apt-get install -y gettext
#  - mkdir k8s_install
#  - cd k8s_install/
#  - curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.7/bin/linux/amd64/kubectl
#  - chmod u+x kubectl
#  - sudo mv ./kubectl /usr/local/bin/kubectl
#

. ../01-setup/00_set_params.sh

echo "========================================================================="
echo ""
echo "  Launching EUROPEAN devices ..."
echo ""
echo "-------------------------------------------------------------------------"
DEVICES_ZONE=europe
TXT_FILE_NAME=europa
gcloud container clusters get-credentials --zone ${k8s_cluster_eu_zone} ${k8s_cluster_eu_name}
mkdir -p ${DEVICES_ZONE}
rm -rf ${DEVICES_ZONE}/*
for aCity in $(cat ../06-device/data/${TXT_FILE_NAME}.txt); do
  export CUSTER_REGION=${DEVICES_ZONE}
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  export REGISTRY_NAME=${registryName_eu}
  export DEVICE_NAME=${deviceName_eu}
  export IOT_ZONE=${iotzone_eu}
  cat device-tpl.yaml | envsubst > ${DEVICES_ZONE}/k8s-job-${CITY_LOWER}.yaml
done
kubectl apply -f ${DEVICES_ZONE}
echo "-------------------------------------------------------------------------"


echo "========================================================================="
echo ""
echo "  Launching US devices ..."
echo ""
echo "-------------------------------------------------------------------------"
DEVICES_ZONE=america
TXT_FILE_NAME=na
gcloud container clusters get-credentials --zone ${k8s_cluster_us_zone} ${k8s_cluster_us_name}
mkdir -p ${DEVICES_ZONE}
rm -rf ${DEVICES_ZONE}/*
for aCity in $(cat ../06-device/data/${TXT_FILE_NAME}.txt); do
  export CUSTER_REGION=${DEVICES_ZONE}
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  export REGISTRY_NAME=${registryName_us}
  export DEVICE_NAME=${deviceName_us}
  export IOT_ZONE=${iotzone_us}
  cat device-tpl.yaml | envsubst > ${DEVICES_ZONE}/k8s-job-${CITY_LOWER}.yaml
done
kubectl apply -f ${DEVICES_ZONE}
echo "-------------------------------------------------------------------------"


echo "========================================================================="
echo ""
echo "  Launching ASIAN devices ..."
echo ""
echo "-------------------------------------------------------------------------"
DEVICES_ZONE=asia
TXT_FILE_NAME=oriente
gcloud container clusters get-credentials --zone ${k8s_cluster_asia_zone} ${k8s_cluster_asia_name}
mkdir -p ${DEVICES_ZONE}
rm -rf ${DEVICES_ZONE}/*
for aCity in $(cat ../06-device/data/${TXT_FILE_NAME}.txt); do
  export CUSTER_REGION=${DEVICES_ZONE}
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  export REGISTRY_NAME=${registryName_asia}
  export DEVICE_NAME=${deviceName_asia}
  export IOT_ZONE=${iotzone_asia}
  cat device-tpl.yaml | envsubst > ${DEVICES_ZONE}/k8s-job-${CITY_LOWER}.yaml
done
kubectl apply -f ${DEVICES_ZONE}
echo "-------------------------------------------------------------------------"


echo "========================================================================="
echo ""
echo "  Launching ASIAN devices ..."
echo ""
echo "-------------------------------------------------------------------------"
DEVICES_ZONE=oceania
TXT_FILE_NAME=oceania
mkdir -p ${DEVICES_ZONE}
rm -rf ${DEVICES_ZONE}/*
for aCity in $(cat ../06-device/data/${TXT_FILE_NAME}.txt); do
  export CUSTER_REGION=${DEVICES_ZONE}
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  export REGISTRY_NAME=${registryName_asia}
  export DEVICE_NAME=${deviceName_asia}
  export IOT_ZONE=${iotzone_asia}
  cat device-tpl.yaml | envsubst > ${DEVICES_ZONE}/k8s-job-${CITY_LOWER}.yaml
done
kubectl apply -f ${DEVICES_ZONE}
echo "-------------------------------------------------------------------------"

#gcloud container clusters get-credentials --zone ${k8s_cluster_us_zone} ${k8s_cluster_us_name}
#gcloud container clusters get-credentials --zone ${k8s_cluster_asia_zone} ${k8s_cluster_asia_name}
