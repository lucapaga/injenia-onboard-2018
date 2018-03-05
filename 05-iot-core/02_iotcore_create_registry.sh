. ../01-setup/00_set_params.sh

echo "REGISTRY NAME: $registryName"
echo "      PROJECT: $GCSProjectID"
echo "        TOPIC: $topicFullName"

# CREATE A DEVICE REGISTRY INTO CONFIGURED 'iotzone' TO WORK WITH PUB/SUB TOPIC
# DEFINED IN 'topicFullName'
# (https://cloud.google.com/sdk/gcloud/reference/beta/iot/registries/create)

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_eu"
gcloud beta iot registries create $registryName_eu \
	--region=$iotzone_eu \
	--event-pubsub-topic=$topicFullName

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_us"
gcloud beta iot registries create $registryName_us \
	--region=$iotzone_us \
	--event-pubsub-topic=$topicFullName

echo "---------------------------------------------------------"
echo "       REGION: $iotzone_asia"
gcloud beta iot registries create $registryName_asia \
	--region=$iotzone_asia \
	--event-pubsub-topic=$topicFullName
