. ../01-setup/00_set_params.sh

echo "REGISTRY NAME: $registryName"
echo "      PROJECT: $GCSProjectID"

# CREATE A DEVICE REGISTRY INTO CONFIGURED 'iotzone' TO WORK WITH PUB/SUB TOPIC
# DEFINED IN 'topicFullName'
# (https://cloud.google.com/sdk/gcloud/reference/beta/iot/registries/create)

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_eu"
gcloud --quiet beta iot registries delete $registryName_eu \
	--region=$iotzone_eu 

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_us"
gcloud --quiet beta iot registries delete $registryName_us \
	--region=$iotzone_us 

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_asia"
gcloud --quiet beta iot registries delete $registryName_asia \
	--region=$iotzone_asia 
