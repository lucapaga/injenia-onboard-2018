#!/bin/bash

# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

openssl req \
	-x509 \
	-newkey rsa:2048 \
	-keyout ../device_keys/rsa_private.pem \
	-nodes \
	-out ../device_keys/rsa_cert.pem \
	-subj "/CN=unused"

openssl ecparam \
	-genkey \
	-name prime256v1 \
	-noout \
	-out ../device_keys/ec_private.pem

openssl ec \
	-in ../device_keys/ec_private.pem \
	-pubout \
	-out ../device_keys/ec_public.pem

openssl pkcs8 \
	-topk8 \
	-inform PEM \
	-outform DER \
	-in ../device_keys/rsa_private.pem \
    	-nocrypt > ../device_keys/rsa_private_pkcs8

openssl pkcs8 \
	-topk8 \
	-inform PEM \
	-outform DER \
	-in ../device_keys/ec_private.pem \
	-nocrypt > ../device_keys/ec_private_pkcs8
