#!/bin/bash

source ~/.aws-credentials

if [ -f /tmp/update-route53-ip ]
then
  prev_public_ip=$(cat /tmp/update-route53-ip)
fi

public_ip=$(curl -s ipinfo.io/ip)
if [ "${public_ip}" != "${prev_public_ip}" ]
then
  echo "public ip has changed, was:${prev_public_ip} now is:${public_ip}"
  record="
  {
              \"Comment\": \"Create or update vpn record\",
              \"Changes\": [{
              \"Action\": \"UPSERT\",
                          \"ResourceRecordSet\": {
                                      \"Name\": \"vpn.gssn.net\",
                                      \"Type\": \"A\",
                                      \"TTL\": 300,
                                   \"ResourceRecords\": [{ \"Value\": \"${public_ip}\"}]
  }}]
  }
  "
  aws route53 change-resource-record-sets --hosted-zone-id ${AWS_VPN_HOSTED_ZONE_ID} --change-batch "${record}"

  echo ${public_ip} > /tmp/update-route53-ip
fi

