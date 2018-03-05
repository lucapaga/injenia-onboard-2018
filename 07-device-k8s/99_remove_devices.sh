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

gcloud container clusters get-credentials --zone ${k8s_cluster_eu_zone} ${k8s_cluster_eu_name}
for aCity in $(cat ../06-device/data/europa.txt); do
  export CUSTER_REGION=europe
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  #cat device-tpl.yaml | envsubst > europe/k8s-job-${CITY_LOWER}.yaml
  kubectl delete job ${CUSTER_REGION}-${CITY_LOWER}-devices
done

gcloud container clusters get-credentials --zone ${k8s_cluster_us_zone} ${k8s_cluster_us_name}
for aCity in $(cat ../06-device/data/na.txt); do
  export CUSTER_REGION=america
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  #cat device-tpl.yaml | envsubst > europe/k8s-job-${CITY_LOWER}.yaml
  kubectl delete job ${CUSTER_REGION}-${CITY_LOWER}-devices
done

gcloud container clusters get-credentials --zone ${k8s_cluster_asia_zone} ${k8s_cluster_asia_name}
for aCity in $(cat ../06-device/data/oriente.txt); do
  export CUSTER_REGION=asia
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  #cat device-tpl.yaml | envsubst > europe/k8s-job-${CITY_LOWER}.yaml
  kubectl delete job ${CUSTER_REGION}-${CITY_LOWER}-devices
done
for aCity in $(cat ../06-device/data/oceania.txt); do
  export CUSTER_REGION=oceania
  export CITY=${aCity}
  export CITY_LOWER=$(echo ${aCity} | tr '[:upper:]' '[:lower:]')
  #cat device-tpl.yaml | envsubst > europe/k8s-job-${CITY_LOWER}.yaml
  kubectl delete job ${CUSTER_REGION}-${CITY_LOWER}-devices
done
