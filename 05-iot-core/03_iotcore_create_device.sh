. ../01-setup/00_set_params.sh

# CONFIGURE YOUR DEVICE INTO THE REGISTRY YOU JUST CONFIGURED AND INTO THE SAME REGION
# (https://cloud.google.com/sdk/gcloud/reference/beta/iot/devices/create)
gcloud beta iot devices create $deviceName \
	--region=$iotzone \
	--registry=$registryName \
	--public-key path=../device_keys/rsa_cert.pem,type=rs256
