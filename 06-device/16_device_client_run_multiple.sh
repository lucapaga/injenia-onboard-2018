. ../01-setup/00_set_params.sh

## ---------------------------------------------------------------------------
##  FIRST OF ALL REVIEW THE CODE INTO ../src/python/mqtt_client/cloudiot_mqtt_example.py
## ---------------------------------------------------------------------------


if [ -z "$1" ]
then
	echo "Plese select a region.txt file"
	exit 1
fi

for aCity in $(cat $1); do
	./14_device_client_run_py.sh $aCity > log/$aCity.log &
done
