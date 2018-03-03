#!/usr/bin/env python

# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Python sample for connecting to Google Cloud IoT Core via MQTT, using JWT.
This example connects to Google Cloud IoT Core via MQTT, using a JWT for device
authentication. After connecting, by default the device publishes 100 messages
to the device's MQTT topic at a rate of one per second, and then exits.
Before you run the sample, you must follow the instructions in the README
for this sample.
"""

import argparse
import datetime
import os
import time
import random

#import jwt
#import paho.mqtt.client as mqtt

from gpiozero import LED, Button, Buzzer
from time import sleep
from google.cloud import pubsub_v1


def parse_command_line_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description=(
            'Example Google Cloud IoT Core MQTT device connection code.'))
    parser.add_argument(
            '--project_id',
            default=os.environ.get('GOOGLE_CLOUD_PROJECT'),
            help='GCP cloud project name')
    parser.add_argument(
            '--pub_sub_topic',
            required=True,
            help='GCP cloud project name')
    #parser.add_argument(
    #        '--registry_id', required=True, help='Cloud IoT Core registry id')
    #parser.add_argument(
    #        '--device_id', required=True, help='Cloud IoT Core device id')
    #parser.add_argument(
    #        '--private_key_file',
    #        required=True, help='Path to private key file.')
    #parser.add_argument(
    ##        '--algorithm',
    # #       choices=('RS256', 'ES256'),
    #        required=True,
    #        help='Which encryption algorithm to use to generate the JWT.')
    #parser.add_argument(
    #        '--cloud_region', default='us-central1', help='GCP cloud region')
    #parser.add_argument(
    #        '--ca_certs',
    #        default='roots.pem',
    #        help=('CA root from https://pki.google.com/roots.pem'))
    parser.add_argument(
            '--num_messages',
            type=int,
            default=100,
            help='Number of messages to publish.')
    #parser.add_argument(
    #        '--message_type',
    #        choices=('event', 'state'),
    #        default='event',
    #        help=('Indicates whether the message to be published is a '
    #              'telemetry event or a device state message.'))
    #parser.add_argument(
    #        '--mqtt_bridge_hostname',
    #        default='mqtt.googleapis.com',
    #        help='MQTT bridge hostname.')
    #parser.add_argument(
    #        '--mqtt_bridge_port',
    #        choices=(8883, 443),
    #        default=8883,
    #        type=int,
    #        help='MQTT bridge port.')
    #parser.add_argument(
    #        '--jwt_expires_minutes',
    #        default=20,
    #        type=int,
    #        help=('Expiration time, in minutes, for JWT tokens.'))

    parser.add_argument(
            '--sensed_city',
            default='Modena',
            help=('A city in the world'))

    return parser.parse_args()


def on_button_pressed(button):
    print("BUTTON PRESSED: processing handler ...")
    red_led.on()
    for i in range(1, 4):
        try:
            print("Publishing message {}".format(i))
            run_termometer_pubsub(1)
            print("Publishing done!")
        except Exception as e:
            print("Publishin failed...:" + str(e))
            pass
    print("This is it, terminating...")
    green_led.off()
    red_led.off()

def activate_termometer_thread():
    print("No-op")

def run_termometer_pubsub(number_of_sensings):
    args = parsed_cli_args

    city = args.sensed_city
    pubsub_topic_name=args.pub_sub_topic

    publish_client = pubsub_v1.PublisherClient()
    topic = 'projects/{project_id}/topics/{topic}'.format(
            project_id=args.project_id,
            topic=pubsub_topic_name
        )

    reference_date = datetime.datetime.today()
    #reference_date = reference_date.replace(year=2017)
    #reference_date = reference_date.replace(month=8)
    #reference_date = reference_date.replace(day=1)

    for i in range(1, number_of_sensings + 1):
        temperature=random.uniform(-20, 40)

        payload = '{{ "message":"{}/{}-message-{}", "city":"{}", "temperature": "{}", "hour": "{}", "day": "{}", "month": "{}", "year": "{}" }}'.format(
                    "a-registry-id",
                	"a-registry-id",
                	i,
                	city,
                	temperature,
                	reference_date.hour, reference_date.day, reference_date.month, reference_date.year)

        print('Publishing message {}/{}: \'{}\''.format(i, number_of_sensings, payload))

        green_led.on()
        publish_client.publish(topic, str(payload))
        green_led.off()

    	reference_date = reference_date + datetime.timedelta(hours=1)

        # [REVIEW HERE] YOU CAN CHANGE THE TIME-MACHINE SIMULATION SPEED
        time.sleep(0.3) # if args.message_type == 'event' else 5)



green_led = LED(18)
red_led = LED(17)
#bz = Buzzer(3)
button = Button(23)
button.when_pressed = on_button_pressed

parsed_cli_args = parse_command_line_args()

while True:
    pass
