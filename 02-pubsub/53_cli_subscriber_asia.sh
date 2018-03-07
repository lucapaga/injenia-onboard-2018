#!/bin/bash

. ../01-setup/00_set_params.sh

# PULL 'chat-$V-subscription' SUBSCRIPTION SLEEPING 1s FOR EACH LOOP
while true; do
	gcloud pubsub subscriptions pull chat-$V-subscription-asia --limit=10 --auto-ack
	sleep 1
done
