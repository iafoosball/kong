#!/usr/bin/env bash

cd /var/lib/iafoosball/cert
CERT=$(cat fullchain.pem)
KEY=$(cat privkey.pem)

curl -i -X POST http://localhost:8051/certificates \
--data "cert=$CERT" \
--data "key=$KEY" \
--data 'snis[]=iafoosball.me'

#curl -i -X POST http://localhost:8050/certificates \
#    -F "cert=@/var/lib/iafoosball/cert/fullchain.pem" \
#    -F "key=@/var/lib/iafoosball/cert/privkey.pem" \
#    -F "snis=iafoosball.me"

