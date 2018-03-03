. 00_set_params.sh

gsutil mb -c regional -l $gcsRegion gs://$bucket/ 
touch a-file && echo "temp" > a-file && gsutil cp a-file gs://$tempLocation && rm a-file
