. ../01-setup/00_set_params.sh

#DATAFLOW_JOB_DATA='{"jobName":"'$jobName'","parameters":{"topic":"'$topicFullName'","table":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'
#echo $DATAFLOW_JOB_DATA

#GCP_DF_TEMPLATE_URI="https://dataflow.googleapis.com/v1b3/projects/$projectID/templates:launch?gcsPath=gs://dataflow-templates/pubsub-to-bigquery/template_file"
GCP_DF_TEMPLATE_URI="https://dataflow.googleapis.com/v1b3/projects/$projectID/templates:launch?gcsPath=gs://dataflow-templates/latest/PubSub_to_BigQuery"

#GCP_DF_REQUEST_PAYLOAD='{"jobName":"'$jobName'","parameters":{"topic":"'$topicFullName'","table":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'
#GCP_DF_REQUEST_PAYLOAD="{\"jobName\": \"$jobName\", \"parameters\": { \"inputTopic\": \"$topicFullName\", \"outputTableSpec\": \"$table\" }, \"environment\": { \"tempLocation\": \"gs://$tempLocation\", \"zone\": \"$dataflowzone\" } }"
GCP_DF_REQUEST_PAYLOAD='{"jobName":"'$jobName'","parameters":{"inputTopic":"'$topicFullName'","outputTableSpec":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'

curl 	-X POST \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer $(gcloud auth print-access-token)" \
	$GCP_DF_TEMPLATE_URI \
	-d $GCP_DF_REQUEST_PAYLOAD
