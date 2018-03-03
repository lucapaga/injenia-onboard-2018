#!/bin/bash
. ../01-setup/00_set_params.sh

# CREATE TOPIC NAMED 'chat-$V' WITH CLI
gcloud pubsub topics create chat-$V

# CREATE SUBSCRIPTION NAMED 'chat-$V-subscription' FOR TOPIC 'chat-$V' WITH CLI
gcloud pubsub subscriptions create chat-$V-subscription --topic=chat-$V

echo ""
echo "----------------------------------"
echo "         TOPIC: 'chat-$V'"
echo "  SUBSCRIPTION: 'chat-$V-subscription'"
echo "----------------------------------"
echo ""
