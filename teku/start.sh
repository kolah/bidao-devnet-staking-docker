#!/bin/bash

set -e

while [ -z "$(find "/validator_keys" -name "keystore*.json" -print -quit)" ]; do
  echo "Waiting for validator keys to be generated..."
  sleep 1  # Wait for 1 second before checking again
done

mkdir -p /teku_validator_keys
rm /teku_validator_keys/* || true
cp /validator_keys/keystore* /teku_validator_keys
for keyFile in /teku_validator_keys/*.json; do echo "${KEYSTORE_PASSWORD}" > "/$(echo "$keyFile" | sed -e 's/\/\(.*\)\.json/\1/').txt"; done

exec /usr/local/bin/teku/bin/teku \
  --network=bidao \
	--log-destination=CONSOLE \
	--data-path=/data_teku \
  --validator-keys=/teku_validator_keys:/teku_validator_keys \
  --ee-endpoint=http://nethermind:8551 \
  --ee-jwt-secret-file=/jwt/jwt.secret \
  --validators-proposer-default-fee-recipient=${EXECUTION_ADDRESS} \
  --validators-graffiti="${GRAFFITI}"
