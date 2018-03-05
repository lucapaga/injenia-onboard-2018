#!/bin/bash

 # Copyright 2017 Google Inc.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #     http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.

projectID=onboard-2018
GCSProjectID=$projectID
echo "GCS Project is: $projectID"
#export projectID

service_account_key_path=../service-account/bigdata-iot-sa.json
service_account_email=bigdata-iot-sa@onboard-2018.iam.gserviceaccount.com

session=20180307_dr2

#if you want to run the demo multiple times, just increment this variable
V=onboard_$session

#sandbox location for local operations
home=~/sandbox/t$V

flowName=flow_$V

# GOOGLE CLOUD STORAGE
gcsRegion=europe-west1
bucket=$projectID-$session-iot-demo
tempLocation=$bucket/$flowName/temp/

# BIGQUERY
dataset=DATASET_ONBOARD_2018
table=$projectID:$dataset.${flowName}_TABLE

# DATAFLOW
jobName=dataflow-job-$flowName
maxWorkers=10

#table=$projectID:$dataset.$flowName
dataflowzone=europe-west1-b
workerType=custom-4-8192

# PUB/SUB
topic=iot-temp-measures-$V
topicFullName=projects/$projectID/topics/$topic

# IoT CORE
iotzone=europe-west1
deviceName=d-$iotzone-rs256-$flowName
registryName=dreg-$iotzone-$flowName
# - EUROPE -
iotzone_eu=europe-west1
deviceName_eu=d-$iotzone_eu-rs256-$flowName
registryName_eu=dreg-$iotzone_eu-$flowName
# - US -
iotzone_us=us-central1
deviceName_us=d-$iotzone_us-rs256-$flowName
registryName_us=dreg-$iotzone_us-$flowName
# - ASIA -
iotzone_asia=asia-east1
deviceName_asia=d-$iotzone_asia-rs256-$flowName
registryName_asia=dreg-$iotzone_asia-$flowName


# k8s
k8s_cluster_eu_zone=europe-west1-b
k8s_cluster_eu_name=oboard-2018-iot-devices-eu
k8s_cluster_us_zone=us-central1-a
k8s_cluster_us_name=oboard-2018-iot-devices-us
k8s_cluster_asia_zone=asia-east1-b
k8s_cluster_asia_name=oboard-2018-iot-devices-asia
