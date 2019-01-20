#!/usr/bin/env bash

curl -i -X POST http://localhost:8051/certificates/ \
  -H 'Content-Type: application/json' \
  -d "{\"cert\": \"$(cat /var/lib/iafoosball/cert/fullchain.pem)\", \"key\": \"$(cat /var/lib/iafoosball/cert/privkey.pem)\", \"snis\": [ \"iafoosball.me\" ] }"