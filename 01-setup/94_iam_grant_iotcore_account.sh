. 00_set_params.sh

echo $projectID
exit 0

gcloud projects add-iam-policy-binding $projectID \
	--member serviceAccount:cloud-iot@system.gserviceaccount.com \
	--role roles/pubsub.publisher \
	| grep iot -a1

