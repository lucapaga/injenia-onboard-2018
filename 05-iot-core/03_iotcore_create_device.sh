. ../01-setup/00_set_params.sh

# CONFIGURE YOUR DEVICE INTO THE REGISTRY YOU JUST CONFIGURED AND INTO THE SAME REGION
# (https://cloud.google.com/sdk/gcloud/reference/beta/iot/devices/create)
gcloud beta iot devices create $deviceName_eu \
	--region=$iotzone_eu \
	--registry=$registryName_eu \
	--public-key path=../device_keys/rsa_cert.pem,type=rs256

gcloud beta iot devices create $deviceName_us \
	--region=$iotzone_us \
	--registry=$registryName_us \
	--public-key path=../device_keys/rsa_cert.pem,type=rs256

gcloud beta iot devices create $deviceName_asia \
	--region=$iotzone_asia \
	--registry=$registryName_asia \
	--public-key path=../device_keys/rsa_cert.pem,type=rs256
