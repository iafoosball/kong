#!/usr/bin/env bash

cd /var/lib/iafoosball/cert
CERT=$(cat fullchain.pem)
KEY=$(cat privkey.pem)

curl -i -X POST http://localhost:8050/certificates \
--data "cert=$CERT" \
--data "key=$KEY" \
--data 'snis[]=iafoosball.me'
