. 00_set_params.sh
gcloud auth activate-service-account --key-file=$service_account_key_path $service_account_email
gcloud config set project $projectID
export $GCLOUD_PROJECT

