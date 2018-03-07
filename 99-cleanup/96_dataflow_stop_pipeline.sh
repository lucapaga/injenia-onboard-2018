. ../01-setup/00_set_params.sh

gcloud dataflow jobs list | grep Running
job_id=$(gcloud dataflow jobs list | grep $flowName | awk '{print $1;}')
gcloud dataflow jobs cancel $job_id --region=$dataflowzone

echo "JOB '$job_id' STOPPED"
