. ../01-setup/00_set_params.sh

gcloud --quiet beta iot devices delete $deviceName_eu \
	--region=$iotzone_eu \
	--registry=$registryName_eu

gcloud --quiet beta iot devices delete $deviceName_us \
	--region=$iotzone_us \
	--registry=$registryName_us 

gcloud --quiet beta iot devices delete $deviceName_asia \
	--region=$iotzone_asia \
	--registry=$registryName_asia 
