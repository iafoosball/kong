#!/usr/bin/env bash

curl -i -X POST http://localhost:8050/certificates \
-F "cert=@/var/lib/iafoosball/cert/fullchain.pem" \
-F "key=@/var/lib/iafoosball/cert/privkey.pem" \
-F "snis="