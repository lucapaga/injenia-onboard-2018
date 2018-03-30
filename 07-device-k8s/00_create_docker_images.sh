. ../01-setup/00_set_params.sh

cd ..

sudo docker build --no-cache -t ${docker_image_name}:${docker_image_tag} .

sudo gcloud docker -- push ${docker_image_name}:${docker_image_tag}

cd -
