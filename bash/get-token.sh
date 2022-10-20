#!/bin/bash
set -e

if [[ -z $API ]]; then
  echo "Set an environment-variable API with a fqdn"
  echo "export API=api.mycloud.local"
  exit 2
fi

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <username> <password>"
  exit 1
fi

USERNAME=$1
PASSWORD=$2

curl -s \
  -D token.headers \
  -H "Content-Type: application/json" \
  -d "
{ \"auth\": {
    \"identity\": {
      \"methods\": [\"password\"],
      \"password\": {
        \"user\": {
          \"name\": \"$USERNAME\",
          \"domain\": { \"id\": \"default\" },
          \"password\": \"$PASSWORD\"
        }
      }
    },
    \"scope\": {
      \"system\": {
        \"id\": \"all\"
      }
    }
  }
}" \
  "https://$API:5000/v3/auth/tokens" | jq; echo
