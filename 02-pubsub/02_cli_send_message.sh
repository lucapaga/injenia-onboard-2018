#!/bin/bash

. ../01-setup/00_set_params.sh

# GET COMMAND ARGS AS MESSAGE AND PUBLISH IT INTO 'chat-$V' TOPIC
gcloud pubsub topics publish chat-$V --message "$*"
