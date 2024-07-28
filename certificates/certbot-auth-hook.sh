#!/bin/bash

source ~/.aws-credentials
record="
  {
              \"Comment\": \"Create or update vpn record\",
              \"Changes\": [{
              \"Action\": \"UPSERT\",
                          \"ResourceRecordSet\": {
                                      \"Name\": \"_acme-challenge.${CERTBOT_ALL_DOMAINS}\",
                                      \"Type\": \"TXT\",
                                      \"TTL\": 30,
                                   \"ResourceRecords\": [{ \"Value\": \"\\\"${CERTBOT_VALIDATION}\\\"\"}]
  }}]
  }
  "
aws route53 change-resource-record-sets --hosted-zone-id ${AWS_VPN_HOSTED_ZONE_ID} --change-batch "${record}"

sleep 30

