. ../01-setup/00_set_params.sh

echo "PREPARING DATAFLOW'S STAGING AREA ON GCS ..."
gsutil mb -c regional -l $gcsRegion gs://$bucket/ 
touch a-file && echo "temp" > a-file && gsutil cp a-file gs://$tempLocation && rm a-file
