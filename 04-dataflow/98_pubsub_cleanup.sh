#!/bin/bash

. ../01-setup/00_set_params.sh

# CLEAN 'chat-$V-subscription' SUBSCRIPTION
#gcloud pubsub subscriptions delete chat-$V-subscription
# CLEAN 'chat-$V' TOPIC
gcloud pubsub topics delete $topicFullName

