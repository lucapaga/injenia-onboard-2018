#!/bin/bash

# PREREQ:
#  - sudo apt-get install -y gettext
#  - mkdir k8s_install
#  - cd k8s_install/
#  - curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.7/bin/linux/amd64/kubectl
#  - chmod u+x kubectl
#  - sudo mv ./kubectl /usr/local/bin/kubectl
#

#gcloud container clusters get-credentials --zone ${k8s_cluster_eu_zone} ${k8s_cluster_eu_name}

mkdir europe
for aCity in $(cat ../06-device/data/europa.txt); do
  export CUSTER_REGION=europe
  export CITY=${aCity}
	cat device-tpl.yaml | envsubst > europe/k8s-job-${aCity}.yaml
done

# kubectl apply -f europe/*

#gcloud container clusters get-credentials --zone ${k8s_cluster_us_zone} ${k8s_cluster_us_name}
#gcloud container clusters get-credentials --zone ${k8s_cluster_asia_zone} ${k8s_cluster_asia_name}
