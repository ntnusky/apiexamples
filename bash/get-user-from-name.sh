#!/bin/bash
set -e

TOKEN=$(grep x-subject-token token.headers  | cut -d ' ' -f 2 | tr -d '\r')

if [[ -z $API ]]; then
  echo "Set an environment-variable API with a fqdn"
  echo "export API=api.mycloud.local"
  exit 2
fi

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <user-name> <domain-id>"
  exit 1
fi

USERNAME=$1
USERDOMAIN_ID=$2

curl -s \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: $TOKEN" \
  "https://$API:5000/v3/users?name=$USERNAME&domain_id=$USERDOMAIN_ID" \
  | jq '.["users"][0]'
