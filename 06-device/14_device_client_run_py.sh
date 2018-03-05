. ../01-setup/00_set_params.sh

## ---------------------------------------------------------------------------
##  FIRST OF ALL REVIEW THE CODE INTO ../src/python/mqtt_client/cloudiot_mqtt_example.py
## ---------------------------------------------------------------------------

#cd ../src/python/mqtt_client/
cd ../src/python/g-mqtt-client-v2/

#ls -l

#virtualenv env
#source env/bin/activate

#pip install -r requirements.txt

#ls -l ../../../device_keys/rsa_private_pkcs8

if [ -z $1 ];
then

  python cloudiot_mqtt_example.py \
                	--project_id $projectID \
                	--registry_id $registryName \
                	--device_id $deviceName \
                  --private_key_file ../../../device_keys/rsa_private.pem \
                	--algorithm RS256 \
                	--cloud_region $iotzone \
                	--num_messages 1000 \
                	--ca_certs ../../../ca/roots.pem \
                	--sensed_city "Bologna"

else

  python cloudiot_mqtt_example.py \
                  --project_id $projectID \
                  --registry_id $registryName \
                  --device_id $deviceName \
                  --private_key_file ../../../device_keys/rsa_private.pem \
                  --algorithm RS256 \
                  --cloud_region $iotzone \
                  --num_messages 5000 \
                  --ca_certs ../../../ca/roots.pem \
                  --sensed_city $1

fi
#	--num_messages 1000 \
#	--message_type event \
#	--mqtt_bridge_hostname \
#	--mqtt_bridge_port 443 \
